# matse-spicker/tex

## TODO

This directory structure mimics a TDS structure such that we can copy the structure to a container image or the user's home directory for local installation.

To build the documentation PDF, run `pdflatex -interaction=nonstopmode spicker.dtx`. Clean up using e.g. `latexmk -c spicker.dtx`.

To publish new versions of the package, bundle a zip file of the `spicker` directory in the following structure:

```text
spicker-vX.Y.Z.zip
  spicker/
    README.md
    spicker.dtx
    spicker.ins
    spicker.pdf
```

When there's nothing else in the directory, run `zip -r spicker-vX.Y.Z.zip spicker` from the `tex/latex` directory.