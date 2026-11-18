# Gondolin beamer theme

A minimal Montpellier-like layout in the warm gruvbox-light palette of my
website: a cosmic-latte (`#FFF8E7`) canvas, parchment blocks, indigo links and
gruvbox-dark title and divider slides. Fonts follow Arguelles (Alegreya,
Alegreya Sans, Inconsolata for code); maths is default Computer Modern. The headline is one line: "Section › Subsection" on the left, the short
talk title on the right. 16:9.

## Use it

Copy `beamerthemeGondolin.sty` next to your slides. Add `rivendell.bst` (shared
with the rivendell report package) if you cite from a `.bib` file, and `.latexmkrc` if you build with latexmk.

```latex
\documentclass[aspectratio=169,11pt]{beamer}
\usetheme{Gondolin}

\title{...}  \subtitle{...}  \author{...}  \institute{...}
\email{...}  \event{...}     \date{\today}

\begin{document}
\titleframe                        % dark title slide, not counted
\section{Intro}                    % dark divider slide appears here
\begin{frame}{Title}{optional subtitle} ... \end{frame}
\begin{frame}[standout] One big statement. \end{frame}

\appendix                          % backup slides start here
\begin{frame}{References}
  \bibliographystyle{rivendell}  % or plainnat
  \bibliography{refs}
\end{frame}
\end{document}
```

`slides.tex` shows every feature.

## Options

| Option | Effect |
|---|---|
| `sans` | Alegreya Sans for body text (default is Alegreya serif) |
| `accent=<colour>` | accent for bullets, links, citations, example blocks, code keywords and divider labels, from gruvbox: `indigo` (default, the site's link colour), `red`, `orange`, `yellow`, `green`, `aqua`, `blue`, `purple`, or `gray` for none |
| `nodividers` | no dark divider slide at each `\section` |
| `sectionpages` | an outline slide at the start of every section |
| `noframeno` | no `n / N` frame number |
| `nonatbib` | don't load natbib (for biblatex) |
| `sharednumbering` | one counter for all theorem-like blocks, as in plain beamer (Fact 1, Remark 2, …); by default each type counts on its own |

## Features

| Feature | How |
|---|---|
| Title slide | `\titleframe` |
| Section dividers | automatic at every `\section` (before `\appendix`) |
| Statement slide | `\begin{frame}[standout]` |
| Image beside text | `\imagetext[left, width=.45, height=.75, caption=..., align=T]{file}{text}`: text left, image right by default |
| Full-slide image | `\begin{frame}[bg=photo.jpg]`, cropped to fill, not stretched |
| Backup slides | everything after `\appendix`: one divider, footer reads "Backup k", and the main "n / N" total ignores them (correct from the second run) |
| Theorems | `theorem`, `lemma`, `proposition`, `corollary`, `fact`, `definition`, `remark`, `example`, `proof`: numbered blocks, each type with its own counter. `proposition` and `remark` are only added if your deck doesn't define them |
| Code | `lstlisting` in a `[fragile]` frame; `\lstinline|...|` inline |
| References | natbib author–year, `\citet` / `\citep`, two columns in small type |
| Speaker notes | `\note{...}` inside a frame (see below) |

## Handouts and notes

- **Handout:** add `handout` to the class options. Overlays collapse to one page
  per frame. Without editing the file:
  `latexmk -pdf -jobname=slides-handout -usepretex='\PassOptionsToClass{handout}{beamer}' slides.tex`
- **Notes for pdfpc:** `\setbeameroption{show notes on second screen=right}` in
  the preamble, then `pdfpc --notes=right slides.pdf`.
- **Printable script:** `\setbeameroption{show only notes}`.

## Requirements

Builds with pdflatex. Needs `Alegreya`, `AlegreyaSans`, `mathalpha`, `zi4`,
`tcolorbox`, `listings` and `natbib`, all in TeX Live full.
