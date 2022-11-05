export TEXMFHOME = lsst-texmf/texmf

#asp tex is a bit odd so latexml fails ..
C15.pdf: C15.tex C15.bib
	latex C15
	bibtex C15
	latex C15
	latex C15
	dvipdfm C15
	dvipdf C15

authors.tex:  authors.yaml
	python3 $(TEXMFHOME)/../bin/db2authors.py --mode adass > authors.tex

.PHONY: clean
clean:
	latexmk -c
	rm -f C15.bbl
	rm -f C15.dvi
	rm -f C15.pdf
	rm -f authors.tex

.PHONY: check
check:
	python3 PaperCheck.py C15 Mueller

PID_URL   = "https://www.canfar.net/storage/vault/list/adass2022/upload/C15"
TAR_FILE  = C15.tar.gz
FILESPDF  = C15.pdf copyrightForm_C15_Mueller.pdf
FILESTEX  = C15.tex C15.bib makedefs newKeywords.txt
FILES4AR  = $(FILESTEX) $(FILESPDF)

.PHONY: tar
tar: $(FILES4AR)
	tar zcf $(TAR_FILE) $(FILES4AR)
	@echo "Login and upload $(TAR_FILE) at $(PID_URL)"
