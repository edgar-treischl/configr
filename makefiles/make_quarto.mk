.PHONY: all render preview clean freeze-reset check

# Default build
all: render

# Render the Quarto site (honors freeze settings)
render:
	quarto render

# Live preview the Quarto site
preview:
	quarto preview

# Clean output and cache
clean:
	rm -rf _site _freeze

# Force re-render by clearing freeze metadata
freeze-reset:
	rm -rf _freeze

# Check all .qmd files for formatting and execution issues
check:
	quarto check
