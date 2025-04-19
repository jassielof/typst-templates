import argparse
import os
import subprocess
import shutil
import glob
import tomllib
import sys
import re
from pathlib import Path
from typing import List

def parse_args():
  parser = argparse.ArgumentParser(description="Build a Typst package or template")
  parser.add_argument("toml_file", help="Path to the typst.toml file")
  parser.add_argument("--output-dir", choices=["output", "universe"], default="output",
            help="Base output directory (either 'output' or 'universe')")
  return parser.parse_args()


def validate_package_name(package_name: str, toml_dir: Path):
  """Check if the package name matches the parent directory name."""
  parent_dir_name = toml_dir.name
  if package_name != parent_dir_name:
    raise ValueError(f"Package name '{package_name}' doesn't match parent directory name '{parent_dir_name}'")


def compile_template(toml_dir: Path, package_name: str, template_path: str, template_entrypoint: str):
  """Compile the template to make sure it's valid."""
  try:
    cmd = [
      "typst", "compile",
      "--root", ".",
      os.path.join(package_name, template_path, template_entrypoint)
    ]

    # Run the command from the parent directory of toml_dir
    subprocess.run(cmd, cwd=toml_dir.parent, check=True, capture_output=True)
  except subprocess.CalledProcessError as e:
    print(f"Error compiling template: {e}")
    print(f"Output: {e.stdout.decode() if e.stdout else ''}")
    print(f"Error: {e.stderr.decode() if e.stderr else ''}")
    sys.exit(1)


def should_exclude(file_path: str, exclude_patterns: List[str], base_dir: Path) -> bool:
    """Check if the file should be excluded based on the exclude patterns."""
    rel_path = os.path.relpath(file_path, base_dir)

    for pattern in exclude_patterns:
        # Match using glob
        if glob.fnmatch.fnmatch(rel_path, pattern):
            return True
        # If pattern ends with '/' or has no wildcard, treat as directory
        if (pattern.endswith('/') or (not any(c in pattern for c in '*?[]') and os.path.isdir(os.path.join(base_dir, pattern)))):
            # Exclude everything under this directory
            if rel_path == pattern.rstrip('/') or rel_path.startswith(pattern.rstrip('/') + os.sep):
                return True
    return False

def copy_files(toml_dir: Path, output_dir: Path, exclude_patterns: List[str], package_name: str, package_version: str, package_entrypoint: str):
  """Copy files from toml_dir to output_dir, excluding files that match exclude_patterns and updating import statements."""
  os.makedirs(output_dir, exist_ok=True)

  # Get the entry point file name (e.g., "lib.typ")
  entrypoint_name = Path(package_entrypoint).name

  for root, dirs, files in os.walk(toml_dir):
    for file in files:
      src_path = os.path.join(root, file)

      # Skip if this file should be excluded
      if should_exclude(src_path, exclude_patterns, toml_dir):
        continue

      # Create relative path from toml_dir
      rel_path = os.path.relpath(src_path, toml_dir)
      dst_path = os.path.join(output_dir, rel_path)

      # Create destination directory if it doesn't exist
      os.makedirs(os.path.dirname(dst_path), exist_ok=True)

      # Special handling for typst.toml: remove #schema directive
      if file == "typst.toml":
        with open(src_path, 'r', encoding='utf-8') as f:
          lines = f.readlines()
        # Remove any line that starts with #:
        filtered = [line for line in lines if not line.lstrip().startswith("#:schema")]
        with open(dst_path, 'w', encoding='utf-8') as f:
          f.writelines(filtered)
      # If it's a .typ file, check for imports to update
      elif file.endswith('.typ'):
        with open(src_path, 'r', encoding='utf-8') as f:
          content = f.read()

        # Package import replacement
        package_import = f'@preview/{package_name}:{package_version}'

        # Find all import statements referencing the entry point with relative paths
        # This regex looks for imports with one or more "../" followed by the entry point name
        # and preserves any import specifiers (like ": *")
        pattern = r'#import\s+"((?:\.\./)+)' + re.escape(entrypoint_name) + r'((?::\s*[^"]*)?)"'

        # Replace the entire path with the package import while keeping any specifiers
        content = re.sub(pattern, f'#import "{package_import}\\2"', content)

        # Write the modified content to the destination file
        with open(dst_path, 'w', encoding='utf-8') as f:
          f.write(content)
      else:
        # Just copy the file
        shutil.copy2(src_path, dst_path)

def main():
  args = parse_args()
  path = Path(args.toml_file)

  if not path.exists():
    print(f"Error: Path '{args.toml_file}' not found")
    sys.exit(1)

  if path.is_file():
    # If a file path is provided directly
    toml_file = path
  elif path.is_dir():
    # If a directory path is provided, search for typst.toml
    toml_files = list(path.glob("typst.toml"))
    if not toml_files:
      print(f"Error: No typst.toml file found in directory '{args.toml_file}'")
      sys.exit(1)
    if len(toml_files) > 1:
      print(f"Error: Multiple typst.toml files found in directory '{args.toml_file}'")
      sys.exit(1)
    toml_file = toml_files[0]
  else:
    print(f"Error: Path '{args.toml_file}' is neither a file nor a directory")
    sys.exit(1)

  # Get the directory containing the TOML file
  toml_dir = toml_file.parent

  try:
    # Parse TOML file
    with open(toml_file, "rb") as f:
      config = tomllib.load(f)

    # Extract required information
    package_name = config.get("package", {}).get("name")
    package_version = config.get("package", {}).get("version")
    package_exclude = config.get("package", {}).get("exclude", [])
    package_entrypoint = config.get("package", {}).get("entrypoint", "main.typ")

    template_path = config.get("template", {}).get("path", "")
    template_entrypoint = config.get("template", {}).get("entrypoint", "")

    if not package_name or not package_version:
      print("Error: 'package.name' and 'package.version' are required in the TOML file")
      sys.exit(1)

    # Validate package name
    validate_package_name(package_name, toml_dir)

    # Compile the template if path and entrypoint are provided
    if template_path and template_entrypoint:
      compile_template(toml_dir, package_name, template_path, template_entrypoint)

    # Create output directory
    output_base = Path(args.output_dir)
    output_dir = output_base / package_name / package_version

    # Copy files and update imports
    copy_files(toml_dir, output_dir, package_exclude, package_name, package_version, package_entrypoint)

    print(f"Package '{package_name}' v{package_version} built successfully to {output_dir}")

  except Exception as e:
    print(f"Error: {e}")
    sys.exit(1)


if __name__ == "__main__":
  main()
