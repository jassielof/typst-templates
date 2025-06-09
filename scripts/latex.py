import os
import shutil
import subprocess
import sys


def find_and_copy_latex_files(target_dir_relative_path, files_to_find):
    """
    Finds specified LaTeX files using kpsewhich and copies all contents
    from their source directories to the target directory.
    """
    # Ensure the target directory exists, creating it if necessary.
    # Paths are relative to the script's CWD, which should be the project root.
    try:
        os.makedirs(target_dir_relative_path, exist_ok=True)
        print(f"Ensured target directory exists: {target_dir_relative_path}")
    except OSError as e:
        print(f"Error creating directory {target_dir_relative_path}: {e}")
        return  # Stop processing for this target if directory creation fails

    print(f"Processing files for target directory: {target_dir_relative_path}")

    for f_name in files_to_find:
        print(f"Looking for {f_name}...")
        try:
            # Run kpsewhich to find the file
            process = subprocess.run(
                ["kpsewhich", f_name],
                capture_output=True,
                text=True,
                check=False,  # Do not raise exception on non-zero exit
            )

            if process.returncode != 0 or not process.stdout.strip():
                print(
                    f"Warning: {f_name} not found by kpsewhich. "
                    f"Exit code: {process.returncode}, "
                    f"stdout: '{process.stdout.strip()}', "
                    f"stderr: '{process.stderr.strip()}'."
                )
                continue

            path = process.stdout.strip()
            source_dir = os.path.dirname(path)
            print(f"Found {f_name} in directory {source_dir}")

            if not os.path.isdir(source_dir) or source_dir == "/":
                print(
                    f"Warning: Invalid source directory '{source_dir}' for {f_name}. Skipping copy from this source."
                )
                continue

            print(f"Copying all items from {source_dir} to {target_dir_relative_path}")
            for item_name in os.listdir(source_dir):
                source_item_path = os.path.join(source_dir, item_name)
                destination_item_path = os.path.join(
                    target_dir_relative_path, item_name
                )

                try:
                    if os.path.isfile(source_item_path):
                        shutil.copy2(source_item_path, destination_item_path)
                    elif os.path.isdir(source_item_path):
                        # dirs_exist_ok=True allows overwriting/merging into an existing directory structure.
                        # Requires Python 3.8+
                        shutil.copytree(
                            source_item_path, destination_item_path, dirs_exist_ok=True
                        )
                except Exception as copy_e:
                    print(
                        f"Warning: Could not copy {source_item_path} to {destination_item_path}: {copy_e}"
                    )

        except (
            Exception
        ) as e:  # Catch any other unexpected errors during processing of a file
            print(f"An error occurred while processing {f_name}: {e}")


if __name__ == "__main__":
    base_classes_dir_env = os.environ.get("BASE_CLASSES_DIR")
    koma_classes_dir_env = os.environ.get("KOMA_CLASSES_DIR")
    acm_classes_dir_env = os.environ.get("ACM_CLASSES_DIR")

    if not acm_classes_dir_env:
        print("Error: ACM_CLASSES_DIR environment variable is not set.")
        sys.exit(1)

    if not base_classes_dir_env:
        print("Error: BASE_CLASSES_DIR environment variable must be set.")
        sys.exit(1)
    if not koma_classes_dir_env:
        print("Error: KOMA_CLASSES_DIR environment variable must be set.")
        sys.exit(1)

    # These are relative paths like "koma-script/ctan/src/"
    # They will be used relative to the CWD where 'task' runs the script (project root).

    base_files = ["article.cls", "book.cls", "report.cls"]
    koma_files = ["scrartcl.cls", "scrbook.cls", "scrreprt.cls"]
    acm_files = ["acmart.cls"]

    print("Starting LaTeX class file retrieval using Python script...")

    find_and_copy_latex_files(base_classes_dir_env, base_files)
    find_and_copy_latex_files(koma_classes_dir_env, koma_files)
    find_and_copy_latex_files(acm_classes_dir_env, acm_files)

    print("Python script finished.")
