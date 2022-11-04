DOCNAME = C15

tex = $(wildcard *.tex)

export TEXMFHOME ?= lsst-texmf/texmf

#asp tex is a bit odd so latexml fails ..
$(DOCNAME).pdf: $(tex) authors.tex $(DOCNAME).bib
	latex $(DOCNAME)
	bibtex $(DOCNAME)
	latex $(DOCNAME)
	latex $(DOCNAME)
	dvipdfm $(DOCNAME)
	dvipdf $(DOCNAME)

authors.tex:  authors.yaml
	python3 $(TEXMFHOME)/../bin/db2authors.py --mode adass > authors.tex

.PHONY: clean
clean:
	latexmk -c
	rm -f $(DOCNAME).bbl
	rm -f $(DOCNAME).dvi
	rm -f $(DOCNAME).pdf
	rm -f authors.tex
