from pathlib import Path
import os
import urllib.request
import subprocess

CTAN_BASE_URL = "https://mirrors.ctan.org/macros/latex/base/"
DIRECTORY = "src"

# Use Pathlib for more consistent path handling
SCRIPT_DIR = Path(__file__).resolve().parent
DOWNLOADS_PATH = SCRIPT_DIR / DIRECTORY
DOWNLOADS_PATH.mkdir(parents=True, exist_ok=True)

print(f"Target directory for downloads and processing: {DOWNLOADS_PATH}")

files_to_download = ["classes.pdf", "classes.dtx", "classes.ins"]

# Download files, explicitly removing them first if they exist
for filename in files_to_download:
    url = f"{CTAN_BASE_URL}{filename}"
    dest_file = DOWNLOADS_PATH / filename

    if dest_file.exists() and dest_file.is_file():
        print(f"Removing existing file: {dest_file}")
        try:
            dest_file.unlink()
        except OSError as e:
            print(
                f"Warning: Could not remove existing file {dest_file}: {e}. Urlretrieve will attempt to overwrite."
            )

    print(f"Downloading {url} to {dest_file}")
    try:
        urllib.request.urlretrieve(url, dest_file)
    except Exception as e:
        print(f"Error downloading {url}: {e}. Halting script.")
        exit(1)

# Clean up potential old intermediate LaTeX files before running 'latex classes.ins'
# This helps avoid conflicts with old log or auxiliary files.
# .cls files will be overwritten by the latex command itself.
intermediate_exts_to_clean_before_latex = [
    ".log",
    ".aux",
]  # Add more if needed (e.g., .toc, .lof, .lot)
print("Cleaning up old LaTeX intermediate files before processing...")
for ext in intermediate_exts_to_clean_before_latex:
    for old_intermediate_file in DOWNLOADS_PATH.glob(f"*{ext}"):
        if old_intermediate_file.is_file():  # Ensure it's a file
            print(f"Removing old intermediate file: {old_intermediate_file}")
            try:
                old_intermediate_file.unlink()
            except OSError as e:
                print(
                    f"Warning: Could not remove old intermediate file {old_intermediate_file}: {e}"
                )

# Run 'latex classes.ins' in the downloads directory
ins_file = DOWNLOADS_PATH / "classes.ins"
if ins_file.exists():
    print(f"Running 'latex {ins_file.name}' in directory: {DOWNLOADS_PATH}")
    try:
        # Set up the environment for the subprocess to ensure TeX searches the CWD.
        current_env = os.environ.copy()
        original_texinputs = current_env.get("TEXINPUTS", "")

        # Prepend the current working directory ('.') to TEXINPUTS.
        # TeX uses ':' as its internal path separator for TEXINPUTS.
        # '.:' means search CWD, then search the rest of the original/default TEXINPUTS paths.
        if original_texinputs:
            current_env["TEXINPUTS"] = f".:{original_texinputs}"
        else:
            # If TEXINPUTS was not set or was empty, '.:' ensures CWD and then system defaults.
            current_env["TEXINPUTS"] = ".:"

        print(
            f'Temporarily setting TEXINPUTS for subprocess to: "{current_env["TEXINPUTS"]}"'
        )

        result = subprocess.run(
            ["latex", ins_file.name],  # Pass only the filename as cwd is set
            cwd=DOWNLOADS_PATH,
            check=True,  # Raise an exception for non-zero exit codes
            capture_output=True,  # Capture stdout and stderr
            text=True,  # Decode output as text
            env=current_env,  # Pass the modified environment
        )
        print(f"'latex {ins_file.name}' completed successfully.")
        if result.stdout.strip():
            print("--- LaTeX STDOUT ---")
            print(result.stdout.strip())
            print("--- END LaTeX STDOUT ---")
        # LaTeX often uses stderr for informational messages as well
        if result.stderr.strip():
            print("--- LaTeX STDERR ---")
            print(result.stderr.strip())
            print("--- END LaTeX STDERR ---")
    except subprocess.CalledProcessError as e:
        print(
            f"Error running 'latex {ins_file.name}': Process exited with status {e.returncode}"
        )
        if e.stdout:
            print("--- LaTeX STDOUT (on error) ---")
            print(e.stdout.strip())
            print("--- END LaTeX STDOUT (on error) ---")
        if e.stderr:
            print("--- LaTeX STDERR (on error) ---")
            print(e.stderr.strip())
            print("--- END LaTeX STDERR (on error) ---")
        print("Halting script due to LaTeX processing error.")
        exit(1)
    except FileNotFoundError:
        print(
            "Error: 'latex' command not found. Please ensure TeX Live (or similar) is installed and in your system's PATH."
        )
        exit(1)
else:
    print(
        f"Skipping LaTeX processing as {ins_file} was not found (download may have failed)."
    )


# Final cleanup: Remove source .dtx, .ins, and any generated .log, .aux files from the current run.
# The .cls files (and the .pdf) are the desired outputs and should remain.
final_cleanup_extensions = [".dtx", ".ins", ".log", ".aux"]
print("Performing final cleanup of source and intermediate files...")
for ext in final_cleanup_extensions:
    for file_to_remove in DOWNLOADS_PATH.glob(f"*{ext}"):
        if file_to_remove.is_file():  # Ensure it's a file before trying to unlink
            print(f"Removing: {file_to_remove}")
            try:
                file_to_remove.unlink()
            except OSError as e:
                print(f"Warning: Could not remove file {file_to_remove}: {e}")

print("Update script finished.")
