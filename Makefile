thesis:
	xelatex dissertation.tex
	bibtex chapters/introduction
	bibtex chapters/galaxy
	bibtex chapters/ireport
	bibtex chapters/training-materials
	bibtex chapters/ifuse
	bibtex chapters/vcap-chromothripsis
	bibtex chapters/cgtag
	bibtex chapters/virtual-normal
	bibtex chapters/gmt
	bibtex chapters/mycrobiota
	bibtex chapters/discussion
	xelatex dissertation.tex
	xelatex dissertation.tex
view:
	okular dissertation.pdf &

watch:
	while inotifywait -r -e modify --exclude ".*.sw." --exclude ".git/*" . ; do make thesis; done

clean:
	rm **/*.aux **/*.blg **/*.bbl *.aux *.log *.out *.toc
