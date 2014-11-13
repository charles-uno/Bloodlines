# Output Names
NAME := bloodlines
HTML_FILE := $(NAME).html
PDF_FILE := $(NAME).pdf

# File types
MARKDOWN_TYPE := markdown

# Pandoc base command
BASE_COMMAND := pandoc --from=$(MARKDOWN_TYPE)

# List of the chapters, which start with two numbers and end with .md for
# "markdown"
CHAPTERS := $(wildcard [0-9][0-9]*.md)

# .PHONY is a special target that tells make to run clean if asked, even if a
# file named "clean" exists and hasn't been modified recently
.PHONY: clean

# Make all targets
all: html pdf

# Clean up all output files
clean: | clean-html clean-pdf

# Make an HTML Page
html: $(CHAPTERS)
	$(BASE_COMMAND) $(CHAPTERS) --to=html5 -o $(HTML_FILE)

clean-html:
	rm $(HTML_FILE)

# Make a PDF via LaTeX
pdf: $(CHAPTERS)
	$(BASE_COMMAND) $(CHAPTERS) --smart -o $(PDF_FILE)

clean-pdf:
	rm $(PDF_FILE)
