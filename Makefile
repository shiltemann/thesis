thesis: clean frontmatter/images/cover-puzzle.png
	latexmk -xelatex dissertation.tex

frontmatter/images/cover-puzzle.png:
	convert frontmatter/images/cover-puzzle.svg frontmatter/images/cover-puzzle.png

view:
	okular dissertation.pdf &

watch:
	while inotifywait -r -e modify --exclude  '(frontmatter/images/.*|\.git/.*|cronout.txt|.*(\.swp|\.swo|\.swn|\.fdb_latexmk|~))'  . ; do $(MAKE) thesis; done

check:
	lacheck dissertation.tex

clean:
	@# Should do the same thing as below, but keeping both in case.
	latexmk -c
	@#rm **/*.aux **/*.blg **/*.bbl *.aux *.log *.out *.toc
