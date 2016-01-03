# Charles McEachern

# Fall 2015

# Note: This document wraps at column 80. 

# In the terminal, "make" is interpreted as "make resume.pdf". 
all: bloodlines.pdf

# If the makefile or LaTeX file has changed, create a new PDF. 
bloodlines.pdf: bloodlines.tex makefile
	latexmk -pdf bloodlines.tex

# Delete all regeneratable files, excluding the PDF, and any temporary files. 
# Note that "rm *~" will throw errors if there are no temporary files to
# delete. It also returns false to make, which causes make to throw another
# error. We don't need to see that. Output is redirected (with "> /dev/null"),
# we guarantee that "true" is always returned to the make command
# (with "|| true"), and we silence the command itself ("@-") so we don't have
# to look at the monstrosity we just created. 
clean:
	latexmk -c bloodlines.tex
	@-rm *~ > /dev/null || true
