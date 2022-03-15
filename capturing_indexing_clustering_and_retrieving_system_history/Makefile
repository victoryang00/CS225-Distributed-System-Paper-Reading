#
# Makefile for acmart package
#
# This file is in public domain
#
# $Id: Makefile,v 1.10 2016/04/14 21:55:57 boris Exp $
#

PACKAGE=capturing_indexing_clustering_and_retrieving_system_history 


PDF = $(PACKAGE).pdf 

all:  ${PDF}


$(PACKAGE).pdf: 
	pdflatex $(PACKAGE).tex
	- bibtex $(PACKAGE)
	pdflatex $(PACKAGE).tex
	- makeindex -s gind.ist -o $*.ind $*.idx
	- makeindex -s gglo.ist -o $*.gls $*.glo
	pdflatex $(PACKAGE).tex
	while ( grep -q '^LaTeX Warning: Label(s) may have changed' $*.log) \
	do pdflatex $(PACKAGE).tex; done

docclean:
	$(RM)  *.log *.aux \
	*.cfg *.glo *.idx *.toc \
	*.ilg *.ind *.out *.lof \
	*.lot *.bbl *.blg *.gls *.cut *.hd \
	*.dvi *.ps *.thm *.tgz *.zip *.rpi \
	samples/$(PACKAGE).cls samples/ACM-Reference-Format.bst \
	samples/*.log samples/*.aux samples/*.out \
	samples/*.bbl samples/*.blg samples/*.cut 



clean: docclean
	$(RM)  $(PACKAGE).cls $(PACKAGE).pdf 

distclean: clean
	$(RM)  *.pdf samples/sample-*.pdf

#
# Archive for the distribution. Includes typeset documentation
#
archive:  all clean
	COPYFILE_DISABLE=1 tar -C .. -czvf ../$(PACKAGE).tgz --exclude '*~' --exclude '*.tgz' --exclude '*.zip'  --exclude CVS --exclude '.git*' $(PACKAGE); mv ../$(PACKAGE).tgz .

zip:  all clean
	zip -r  $(PACKAGE).zip * -x '*~' -x '*.tgz' -x '*.zip' -x CVS -x 'CVS/*'

documents.zip: all docclean
	zip -r $@ *.pdf *.cls ACM-Reference-Format.*

.PHONY: all docclean clean distclean archive zip
