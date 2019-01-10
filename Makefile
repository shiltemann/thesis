thesis:
	latexmk -xelatex dissertation.tex

view:
	okular dissertation.pdf &

watch:
	while inotifywait -r -e modify --exclude  '(\.git/.*|cronout.txt|.*(\.swp|\.swo|\.swn|\.fdb_latexmk|~))'  . ; do $(MAKE) thesis; done

clean:
	@# Should do the same thing as below, but keeping both in case.
	latexmk -c
	rm **/*.aux **/*.blg **/*.bbl *.aux *.log *.out *.toc
