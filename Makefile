latex_flags=-outdir=build_latex -silent -pdflatex="pdflualatex --shell-escape" -cd src/


.PHONY: all clean

all: prep main

clean:
	@rm $(shell find build_latex/ ! -name *.pdf ! -type d)

prep:
	@bash -c "mkdir -p build_latex/examples/title"
	@bash -c "mkdir -p build_latex/examples/structure"
	@bash -c "mkdir -p build_latex/exercices/1"
	@bash -c "mkdir -p build_latex/exercices/2"
	@bash -c "mkdir -p build_latex/exercices/3"
	@bash -c "mkdir -p build_latex/exercices/bib"


main:  build_latex/main.pdf                 \
	build_latex/examples/structure/main.pdf \
	build_latex/examples/title/main.pdf     \
	build_latex/exercices/1/main.pdf        \
	build_latex/exercices/2/main.pdf        \
	build_latex/exercices/3/main.pdf        \
	build_latex/exercices/bib/main.pdf

build_latex/%.pdf: src/%.tex
	latexmk $(latex_flags) $<

build_latex/examples/structure/%.pdf: src/%.tex
	latexmk $(latex_flags) $<

build_latex/examples/title/%.pdf: src/%.tex
	latexmk $(latex_flags) $<

build_latex/exercices/1/%.pdf: src/%.tex
	latexmk $(latex_flags) $<

build_latex/exercices/2/%.pdf: src/%.tex
	latexmk $(latex_flags) $<

build_latex/exercices/3/%.pdf: src/%.tex
	latexmk $(latex_flags) $<

build_latex/exercices/bib/%.pdf: src/%.tex
	latexmk $(latex_flags) $<


