INPUTS := $(wildcard /org-files/*.org)

# Create a list of all the output files you want to generate
OUTPUTS := $(patsubst /org-files/%.org,/usr/share/nginx/html/%.html,$(INPUTS))

# The default is to build all the OUTPUTS files
all: $(OUTPUTS)

# Tell make how to build a single output file
/usr/share/nginx/html/%.html : /org-files/%.org
	pandoc -f org -t html -s $^ -o $@
