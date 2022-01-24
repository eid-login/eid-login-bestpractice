#!/bin/bash

# For a table of contents, use the --toc option.
# To have the top headings rendered as chapters on new pages, use the documentclass=report.
# To add section numbers, use the -N option.
# Parameter -V KEY[=VAL]: Set the template variable KEY to the value VAL.
# Option `standalone` is set automatically for pdf.

pandoc *.md \
    --toc \
    --template=./template.latex \
     -V documentclass=report \
    -N \
    -V urlcolor=NavyBlue \
    -V geometry:"top=2cm, bottom=1.5cm, left=2cm, right=2cm" \
    -o eID-Templates-Best-Practices_de.pdf
