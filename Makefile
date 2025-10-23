# Makefile for SPAR LaTeX Report Template
# Uses latexmk for all compilation (automatically handles bibliography, reruns, etc.)
#
# Usage:
#   make          - Full compile with latexmk (default)
#   make watch    - Watch mode (recompile on changes)
#   make clean    - Remove auxiliary files
#   make cleanall - Remove all generated files including PDF

# Main LaTeX file (change if using a different filename)
MAIN = spar-report
EXAMPLE = example

# Use latexmk for everything
LATEXMK = latexmk
LATEXMK_FLAGS = -pdf -interaction=nonstopmode

# Default target: full compile with latexmk
.PHONY: all
all:
	$(LATEXMK) $(LATEXMK_FLAGS) $(MAIN).tex

# Build example report
.PHONY: example
example:
	$(LATEXMK) $(LATEXMK_FLAGS) $(EXAMPLE).tex

# Watch mode: automatically recompile when files change
.PHONY: watch
watch:
	$(LATEXMK) $(LATEXMK_FLAGS) -pvc $(MAIN).tex

# Watch mode for example
.PHONY: example-watch
example-watch:
	$(LATEXMK) $(LATEXMK_FLAGS) -pvc $(EXAMPLE).tex

# Clean auxiliary files but keep PDF
.PHONY: clean
clean:
	$(LATEXMK) -c $(MAIN).tex
	$(LATEXMK) -c $(EXAMPLE).tex

# Clean all generated files including PDF
.PHONY: cleanall
cleanall:
	$(LATEXMK) -C $(MAIN).tex
	$(LATEXMK) -C $(EXAMPLE).tex

# Force rebuild (clean + compile)
.PHONY: rebuild
rebuild: clean all

# Show help
.PHONY: help
help:
	@echo "SPAR LaTeX Report Template - Makefile"
	@echo ""
	@echo "Available targets:"
	@echo "  make          - Full compile with latexmk (default)"
	@echo "  make watch    - Watch mode (recompile on changes)"
	@echo "  make clean    - Remove auxiliary files"
	@echo "  make cleanall - Remove all generated files including PDF"
	@echo "  make rebuild  - Clean and rebuild everything"
	@echo "  make help     - Show this help message"
	@echo ""
	@echo "Note: latexmk automatically handles bibliography, reruns, etc."
