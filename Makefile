all: build/limesurvey.pdf

texoptions = \
	     --lualatex \
	     --interaction=nonstopmode \
	     --halt-on-error \
	     --output-directory=build 


build/limesurvey.pdf: FORCE | build
	latexmk $(texoptions) limesurvey.tex

preview: FORCE | build
	BIBINPUTS=build: \
	latexmk $(texoptions) -pvc limesurvey.tex

FORCE:

build:
	mkdir -p build

clean:
	rm -r build
