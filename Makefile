thesis:
	latexmk -xelatex dissertation.tex

clean: # Removes all .aux/etc files
	latexmk -c

view:
	okular dissertation.pdf &

watch:
	while inotifywait -r -e modify --exclude  '.*(\.swp|\.swo|~)' . ; do $(MAKE) thesis; done

clean:
	rm **/*.aux **/*.blg **/*.bbl *.aux *.log *.out *.toc
