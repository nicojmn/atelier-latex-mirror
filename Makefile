# Before runnig this Makefile, be sure to have all the required tex packages
# We recommand you to install texlive-full (package may have a different name depending of your distro)
# In case of 'french' babel error you'll need to install texlive-langfrench

# Here are the flags we use at LLNux to make our presentation, change them at your need
LATEX_FLAGS := -pdf -lualatex -cd -silent -shell-escape

.PHONY: all main open clean clean_aux

# Default target
all: open

open: main
	@xdg-open build_latex/main.pdf 2>/dev/null 1>/dev/null &

main: build_latex/examples/structure/main.pdf \
	build_latex/examples/title/main.pdf       \
	build_latex/examples/biblio/main.pdf      \
	build_latex/exercices/1/main.pdf          \
	build_latex/exercices/2/main.pdf          \
	build_latex/exercices/3/main.pdf          \
	build_latex/exercices/bib/main.pdf        \
	build_latex/main.pdf

clean:
	rm -r build_latex/*

# Delete everything in build_latex/ except the main pdf for the workshop
clean-aux:
	rm $(shell find build_latex/* -not -type d -not -path build_latex/main.pdf)


# The following targets compile each tex file into a pdf into build_latex/ directory
build_latex/examples/structure/main.pdf: src/examples/structure/main.tex
	@echo -e "\e[1;7;32m[=]\e[27m Compiling $< to $@ ...\e[0m"
	latexmk $(LATEX_FLAGS) $(LATEX_OPT) -outdir=$(PWD)/$(@D) $< $(BASH_POSTPROCESSING)

build_latex/examples/title/main.pdf: src/examples/title/main.tex
	@echo -e "\e[1;7;32m[=]\e[27m Compiling $< to $@ ...\e[0m"
	latexmk $(LATEX_FLAGS) $(LATEX_OPT) -outdir=$(PWD)/$(@D) $< $(BASH_POSTPROCESSING)

build_latex/examples/biblio/main.pdf: src/examples/biblio/main.tex
	@echo -e "\e[1;7;32m[=]\e[27m Compiling $< to $@ ...\e[0m"
	latexmk $(LATEX_FLAGS) $(LATEX_OPT) -outdir=$(PWD)/$(@D) $< $(BASH_POSTPROCESSING)

build_latex/exercices/1/main.pdf: src/exercices/1/main.tex
	@echo -e "\e[1;7;32m[=]\e[27m Compiling $< to $@ ...\e[0m"
	latexmk $(LATEX_FLAGS) $(LATEX_OPT) -outdir=$(PWD)/$(@D) $< $(BASH_POSTPROCESSING)

build_latex/exercices/2/main.pdf: src/exercices/2/main.tex
	@echo -e "\e[1;7;32m[=]\e[27m Compiling $< to $@ ...\e[0m"
	latexmk $(LATEX_FLAGS) $(LATEX_OPT) -outdir=$(PWD)/$(@D) $< $(BASH_POSTPROCESSING)

build_latex/exercices/3/main.pdf: src/exercices/3/main.tex
	@echo -e "\e[1;7;32m[=]\e[27m Compiling $< to $@ ...\e[0m"
	latexmk $(LATEX_FLAGS) $(LATEX_OPT) -outdir=$(PWD)/$(@D) $< $(BASH_POSTPROCESSING)

build_latex/exercices/bib/main.pdf: src/exercices/bib/main.tex
	@echo -e "\e[1;7;32m[=]\e[27m Compiling $< to $@ ...\e[0m"
	latexmk $(LATEX_FLAGS) $(LATEX_OPT) -outdir=$(PWD)/$(@D) $< $(BASH_POSTPROCESSING)

build_latex/main.pdf: src/main.tex src/tex/*
	@echo -e "\e[1;7;32m[=]\e[27m Compiling $< to $@ ...\e[0m"
	latexmk $(LATEX_FLAGS) $(LATEX_OPT) -outdir=$(PWD)/$(@D) $< $(BASH_POSTPROCESSING)


