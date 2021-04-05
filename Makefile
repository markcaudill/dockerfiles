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
	image=$(word 2,$(subst /, ,$@))
	tag=$(word 3,$(subst /, ,$@))
	@echo "++ lint"
	$(DOCKER) run --rm -i hadolint/hadolint < $<
	@echo "++ build"
	$(DOCKER) build -t $(REPO)/$$image:$$tag $(<D)
	@echo "++ save id"
	mkdir -p $(@D)
	$(DOCKER) inspect --format='{{.Id}}' $(REPO)/$$image:$$tag | tee $@

build-all : $(addprefix $(BUILDS_DIR)/,$(BUILDS))  ## Build all images
	@echo "+ $@"

push/% : $(BUILDS_DIR)/%  ## Push an image
	@echo "+ $@"
	image=$(word 2,$(subst /, ,$@))
	tag=$(word 3,$(subst /, ,$@))
	$(DOCKER) push $(REPO)/$$image:$$tag
.PHONY: push/%

push-all : $(addprefix push/,$(BUILDS))  ## Push all images
	@echo "+ $@"
	@echo $*

clean :
	rm -rf $(BUILDS_DIR)
