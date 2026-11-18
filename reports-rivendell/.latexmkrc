# latexmk config: `latexmk` builds every .tex here to PDF with pdflatex + bibtex.
$pdf_mode = 1;
$bibtex_use = 2;          # run bibtex when there is a .bib; clean .bbl on -C
$pdflatex = 'pdflatex -interaction=nonstopmode -synctex=1 %O %S';
$out_dir = 'build';
@default_files = ('*.tex');
