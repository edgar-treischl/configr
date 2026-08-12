.PHONY: restore build upload publish check test document site release

# Makefile for R package development and deployment
PKG_NAME = $(shell Rscript -e "cat(desc::desc_get('Package'))")
PKG_VERSION = $(shell Rscript -e "cat(desc::desc_get('Version'))")
PKG_FILE = $(PKG_NAME)_$(PKG_VERSION).tar.gz

# Replace this with your actual project ID or set as an env variable
CENTRAL_REPO_ID ?= 214893


# Restore the project dependencies from renv.lock
restore:
	Rscript -e "renv::restore()"

# Build the R package into a .tar.gz file
build:
	Rscript -e 'devtools::build(path = ".")'

# Upload the built tar.gz file to GitLab Generic Package Registry
upload:
	curl --location --header "PRIVATE-TOKEN: ${GITLAB_PAT}" \
	     --upload-file "$(PKG_FILE)" \
	     "https://gitlab.lrz.de/api/v4/projects/$(CENTRAL_REPO_ID)/packages/generic/$(PKG_NAME)/$(PKG_VERSION)/$(PKG_FILE)"

# Publish includes build and upload
publish: build upload

# Run R CMD check via devtools
check:
	Rscript -e "devtools::check(error_on = 'error')"

# Run unit tests
test:
	Rscript -e "testthat::test_dir('tests/testthat', reporter = 'summary')"

# Install the package in the current R session
document:
	Rscript -e "devtools::document()"

# Build the pkgdown site
site:
	Rscript -e "pkgdown::build_site()"