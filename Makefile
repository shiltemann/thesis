thesis:
	xelatex dissertation.tex
	bibtex chapters/introduction
	bibtex chapters/chapter1
	bibtex chapters/chapter2
	bibtex chapters/chapter3
	bibtex chapters/chapter4
	bibtex chapters/chapter5
	bibtex chapters/discussion
	xelatex dissertation.tex
	xelatex dissertation.tex
view:
	okular dissertation.pdf &

watch:
	while inotifywait -r -e modify . ; do make thesis; done

clean:
	rm **/*.aux **/*.blg **/*.bbl *.aux *.log *.out *.toc
