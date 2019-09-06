thesis: clean frontmatter/images/cover-puzzle.png
	latexmk -xelatex dissertation.tex

frontmatter/images/cover-puzzle.png:
	convert -density 240 frontmatter/images/cover-puzzle.svg frontmatter/images/cover-puzzle.png

view:
	okular dissertation.pdf &

watch:
	while inotifywait -r -e modify --exclude  '(frontmatter/images/.*|\.git/.*|cronout.txt|.*(\.swp|\.swo|\.swn|\.fdb_latexmk|~))'  . ; do $(MAKE) thesis; done

frontmatter/images/cover-puzzle.svg:
	cd frontmatter/images/ && ./build.sh

frontmatter/images/inter/border.png:
	convert -density 240 frontmatter/images/inter/border.svg frontmatter/images/inter/border.png

frontmatter/images/inter/border-2.png:
	convert -density 240 frontmatter/images/inter/border-2.svg frontmatter/images/inter/border-2.png

check:
	lacheck dissertation.tex

clean:
	@# Should do the same thing as below, but keeping both in case.
	latexmk -c
	@#rm **/*.aux **/*.blg **/*.bbl *.aux *.log *.out *.toc
