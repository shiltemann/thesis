COLOR_REPLACE_SETTINGS := 0.6 0.9 1 0.6 0.8 5

all: cover-puzzle.png border-1.png border-2.png  chapter-header-technical.png chapter-header-training.png chapter-header-fusion.png chapter-header-variants.png chapter-header-microbiota.png chapter-header-discussion.png

chapter-header-%.svg: chapter-header-base-%.svg
	python3 inter/colour-replace.py $< $(COLOR_REPLACE_SETTINGS) > $@

chapter-header-%.png: chapter-header-%.svg
	convert -density 240 $< $@

cover-puzzle.svg: cover-puzzle-base.svg
	python3 inter/colour-replace.py $< $(COLOR_REPLACE_SETTINGS)  > $@

cover-puzzle.png: cover-puzzle.svg
	convert -density 240 cover-puzzle.svg cover-puzzle.png

border-%.svg: border-base.svg
	python3 inter/colour-replace.py $< $(COLOR_REPLACE_SETTINGS)  > $@

border-%.png: border-%.svg
	convert -density 240 $< $@

clean: rm *.png
