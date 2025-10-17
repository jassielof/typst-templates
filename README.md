# Collection of Typst Templates

All templates in this repository are made by me under my free time, and licensed under the MIT License.

## Templates

This repository is a collection of Typst templates for various purposes, check each template for more details:

### [Versatile APA](./versatile-apa/README.md) (Available in Universe)

Template for APA style documents (student/professional).

### [ACM Suite](./acm-suite/README.md) (WIP)

Template for ACM (Association for Computing Machinery) documents (based on ACM LaTeX `acmart`).

### [UPSA Bolivia](./upsa-bo/README.md)

Template for UPSA Bolivia (Universidad Privada de Santa Cruz de la Sierra) documents (thesis/graduation project and feasibility study).

### [LaTeX Standard Classes](./latex-standard/README.md) (WIP)

LaTeX standard classes: article, report, book, and letter.

#### [LaTeX Letter](./latex-letter/README.md) (WIP)

LaTeX standard letter class.

### [KOMA-Script](./koma-script/README.md) (WIP)

KOMA-Script class (article/report/book).

### [Butterick's Résumé](./butterick-resume/README.md)

Résumé template based on Matthew Butterick's résumé guide in *Practical Typography*.

## Usage

You can use these templates in your projects in several ways, depending on your experience and needs:

### Download or Copy

If you don't use Git, you can simply:

- Click the green "Code" button on GitHub and select "Download ZIP".
- Extract the ZIP file and copy the template folder(s) you want into your project.

### Using Git

#### Cloning the Repository

If you want all templates, run:

```sh
git clone https://github.com/jassielof/typst-templates.git template
```

This creates a folder called `template` with all templates inside.

> **Note:** If your project is also a Git repository, avoid copying the `.git/` directory from the template to prevent conflicts.

#### Using Submodules

If your project is already a Git repository and you want to keep the template updated easily, add it as a submodule:

```sh
git submodule add https://github.com/jassielof/typst-templates.git template
```

This links the template folder to this repository.

**To update the template later, run:**

```sh
git submodule update --remote --merge
```

in your project root.
This fetches the latest changes from the template repository.

**If you clone a project that already uses this submodule, use:**

```sh
git clone --recurse-submodules <your-repo-url>
```

or, if you already cloned:

```sh
git submodule update --init --recursive
```

> **Tip:** After updating a submodule, always commit the submodule pointer in your main repository:
>
> ```sh
> git add template
> git commit -m "Update template submodule"
> ```

## Troubleshooting & Tips

- If you see a "detached HEAD" warning in the submodule, you can checkout to the main branch inside the submodule:

  ```sh
  cd template
  git checkout main
  ```

- For more on submodules, see [Git Tools - Submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules).
- If you have questions or issues, feel free to open an issue on this repository!
