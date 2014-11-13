# Output Names
NAME := bloodlines
HTML_FILE := $(NAME).html
PDF_FILE := $(NAME).pdf
ODT_FILE := $(NAME).odt

# File types
MARKDOWN_TYPE := markdown

# Pandoc base command
BASE_COMMAND := pandoc --from=$(MARKDOWN_TYPE)

# List of the chapters, which start with two numbers and end with .md for
# "markdown"
CHAPTERS := $(wildcard [0-9][0-9]*.md)

# .PHONY is a special target that tells make to run certain targets (for
# example, "clean") if asked, even if a file with that same name already exists
# and hasn't been modified recently
.PHONY: clean clean-html clean-pdf clean-odt

# Make all targets
all: html pdf odt

# Clean up all output files
clean: clean-html clean-pdf clean-odt

# Make an HTML Page
html: $(CHAPTERS)
	$(BASE_COMMAND) $(CHAPTERS) --to=html5 -o $(HTML_FILE)

clean-html:
	rm -f $(HTML_FILE)

# Make a PDF via LaTeX
pdf: $(CHAPTERS)
	$(BASE_COMMAND) $(CHAPTERS) --smart -o $(PDF_FILE)

clean-pdf:
	rm -f $(PDF_FILE)

# Make an OpenOffice Document
odt: $(CHAPTERS)
	$(BASE_COMMAND) $(CHAPTERS) --to=odt -o $(ODT_FILE)

clean-odt:
	rm -f $(ODT_FILE)
