# Association for Computing Machinery (ACM) Template Suite

A Typst template suite port of the ACM LaTeX document classes ([ACM Article]("https://ctan.org/pkg/acmart")).

This template suite includes support for the following formats:

- **Manuscript (default)**
- Cover Page (*CP*)
- Large
- Small
- Engage Computer Science Education (*EngageCSEdu*)
- Special Interest Group Conference (*SIGCONF*)
- Special Interest Group on Programming Languages (*SIGPLAN*)
- Transactions on Graphics (*TOG*)

Other formats aren't covered as they were deprecated or simply no longer mentioned in the original documentation.

## Prerequisites

### Fonts

- Sans, sans-serif, and math: [Linux Libertine](https://sourceforge.net/projects/linuxlibertine/)
  - It falls back to the newer fork ([Libertinus](https://github.com/alerque/libertinus)), which is actively maintained and compatible.
- Monospace: [Inconsolata](https://levien.com/type/myfonts/inconsolata.html)
  - It falls back to Typst's built-in DejaVu Sans Mono.

## Credits

- [The original ACM Article LaTeX document class repository](https://github.com/borisveytsman/acmart)
- [Clean ACM Article](https://github.com/vtta/clean-acmart), as a reference work for some designs and patterns.

### Assets

Any assets included in the template are taken from original ACM Article repository.

## License

Licensed under Mozilla Public License 2.0. See [LICENSE](./LICENSE.txt) for details.
