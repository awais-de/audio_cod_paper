FILE = main
BUILD = build
DATE := $(shell /bin/date +%F)
NAME = $(FILE)_$(DATE).tgz

compile:
	mkdir -p $(BUILD)
	pdflatex -output-directory=$(BUILD) $(FILE).tex
	makeglossaries -d $(BUILD) $(FILE)
	bibtex $(BUILD)/$(FILE)
	pdflatex -output-directory=$(BUILD) $(FILE).tex
	pdflatex -output-directory=$(BUILD) $(FILE).tex

backup:
	tar cfvz $(DIR)/$(NAME) *

all: compile backup

clean:
	rm -rf $(BUILD)
