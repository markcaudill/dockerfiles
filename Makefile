SHELL := bash
.ONESHELL:
.SHELLFLAGS := -eu -o pipefail -c
.DELETE_ON_ERROR:
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules

BUILDS_DIR = builds
BUILDS := $(shell dirname */*/Dockerfile)
DOCKER = docker
REPO = markcaudill

help :  ## This message
	@grep -E '^[^>]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
.PHONY: help

$(BUILDS_DIR) :
	@echo "+ $@"
	mkdir -p $@

$(BUILDS_DIR)/% : %/Dockerfile | $(BUILDS_DIR)  ## Build an image
	@echo "+ $@"
	tag=$(REPO)/$(shell dirname $< | sed 's/\//:/g')
	@echo "++ lint"
	$(DOCKER) run --rm -i hadolint/hadolint < $<
	@echo "++ build"
	$(DOCKER) build -t $$tag $(<D)
	@echo "++ save id"
	mkdir -p $(@D)
	$(DOCKER) inspect --format='{{.Id}}' $$tag | tee $@

build-all : $(addprefix $(BUILDS_DIR)/,$(BUILDS))  ## Build all images
	@echo "+ $@"

push/% : $(BUILDS_DIR)/%  ## Push an image
	@echo "+ $@"
	tag=$(REPO)/$(shell dirname $< | sed 's/\//:/g')
	$(DOCKER) push $$tag
.PHONY: push/%

push-all : $(addprefix push/,$(BUILDS))  ## Push all images
	@echo "+ $@"
	@echo $*

clean :
	rm -rf $(BUILDS_DIR)
