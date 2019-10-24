COLOR_REPLACE_SETTINGS := 0.6 0.9 1 0.6 0.8 5

all: cover-puzzle.png inter/border.png inter/border-2.png  chapter-header-1.png chapter-header-2.png chapter-header-3.png chapter-header-4.png chapter-header-5.png

chapter-header-%.svg: chapter-header-base-%.svg
	python3 inter/colour-replace.py $< $(COLOR_REPLACE_SETTINGS) > $@

chapter-header-%.png: chapter-header-%.svg
	convert -density 240 $< $@

cover-puzzle.png: cover-puzzle.svg
	convert -density 240 cover-puzzle.svg cover-puzzle.png

cover-puzzle.svg:
	python3 inter/colour-replace.py cover-puzzle-ColorReplaceBase-v2.svg $(COLOR_REPLACE_SETTINGS)  > cover-puzzle.svg

inter/border.png:
	convert -density 240 inter/border.svg inter/border.png

inter/border-2.png:
	convert -density 240 inter/border-2.svg inter/border-2.png
