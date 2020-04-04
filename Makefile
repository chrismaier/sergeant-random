# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line, and also
# from the environment for the first two.
SPHINXOPTS    ?=
SPHINXBUILD   ?= sphinx-build
SOURCEDIR     = source
BUILDDIR      = build
DEPLOYDIR     = /var/www/html/

SPHINXBUILD   = sphinx-build
ALLSPHINXOPTS   = -d $(BUILDDIR)/doctrees $(PAPEROPT_$(PAPER)) $(SPHINXOPTS) source

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help Makefile

deploy:
	$(SPHINXBUILD) -b html $(ALLSPHINXOPTS) $(BUILDDIR)/
	@echo
	@echo "Build finished. A copy of the HTML pages are in $(BUILDDIR)/."
	@echo "Attempting to deploy the HTML files to $(DEPLOYDIR) (sudo access required)."
	@echo " *** WARNING *** "
	@echo "This deploy will remove all content currently in $(DEPLOYDIR)."
	sudo rm -rf $(DEPLOYDIR)* 
	sudo cp -R $(BUILDDIR)/* $(DEPLOYDIR) 


# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
