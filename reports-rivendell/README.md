# rivendell

AASTeX-style reports (the ApJ/PASP "default" look) on top of the standard
`article` class, with an ICLR-style running head and a page number in the footer.

## Use it in a project

Copy these next to your `.tex` file:

- `rivendell.sty` (required)
- `rivendell.bst` (if you cite from a `.bib` file; author–year, AAS-style reference list)
- `.latexmkrc` (optional; `latexmk` then builds into `build/`)

```latex
\documentclass[10pt,a4paper]{article}
\usepackage{rivendell}

\course{CS7.401: Some Course}
\assignment{Assignment 1}
\title{Report Title}
\author[1]{Your Name}
\affil[1]{IIIT Hyderabad}
\email{you@example.com}

\begin{document}
\maketitle
\begin{abstract} ... \end{abstract}
\keywords{one; two; three}
\section{Introduction}
...
\bibliographystyle{rivendell}
\bibliography{references}
\end{document}
```

See `example.tex` for every feature.

## Package options

| Option | Effect |
|---|---|
| `times` | Times text and math fonts (newtx) instead of Latin Modern |
| `numbers` | numeric citations `[1]` instead of author–year |
| `nonatbib` | skip natbib and the bibliography styling (for biblatex) |
| `nohyperref` | don't load hyperref |
| `draft` | diagonal DRAFT watermark; `\todo{...}` notes become visible |
| `trackchanges` | `\added`, `\deleted`, `\replaced` are marked in colour |

## Commands

| Command | Purpose |
|---|---|
| `\course{}`, `\assignment{}` | running head, shown as "course: assignment" |
| `\headertext{}` | replaces the running head text entirely |
| `\shorttitle{}` | right side of the running head |
| `\author[1,2]{}`, `\affil[1]{}` | authors and affiliations (authblk) |
| `\email{}` | listed at the foot of page 1; repeatable |
| `\collaboration{}` | a small-caps line under the authors |
| `\date{}` | under the authors; defaults to `\today`, `\date{}` hides it |
| `\keywords{}` | right after the abstract |
| `acknowledgments` env | unnumbered, unindented section |
| `\appendix` | "APPENDIX" heading; sections A, B, …; equations (A1) |
| `\tablenote[width]{}` | "NOTE—…" under a table |
| `\cref{}`, `\Cref{}` | "Figure 1", "Equation (2)", "Appendix A", … |
| `lstlisting` env | code with a grey background and line numbers |
| `\todo{}` | inline note; only shown with `draft` |
| `\added{new}`, `\deleted{old}`, `\replaced{new}{old}` | revision markup; only shown with `trackchanges` |

Tables: use `booktabs` rules (`\toprule`, `\midrule`, `\bottomrule`).

## Build

```sh
latexmk              # uses .latexmkrc: pdflatex + bibtex, output in build/
latexmk -C           # clean
```

## Notes

- Layout: 7.1in text width, as in AASTeX. On A4 this leaves about 1.5 cm side
  margins. Change it with `\geometry{...}` after loading the package.
- hyperref and cleveref are loaded inside the package, so load other packages
  before `rivendell` if they must come before hyperref.
- The look is taken from the AASTeX v7.0.1 PASP sample template; `rivendell.bst`
  is derived from its `aasjournalv7.bst` (changes are listed in the file's header).
