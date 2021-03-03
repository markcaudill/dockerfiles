SHELL := bash
.ONESHELL:
.SHELLFLAGS := -eu -o pipefail -c
.DELETE_ON_ERROR:
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules

help :  ## This message
	@grep -E '^[^>]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
.PHONY: help

lint-% : %/Dockerfile  ## Lint %/Dockerfile
	@echo "+ $@"
	docker run --rm -i hadolint/hadolint < $<
.PHONY: lint-%

REPO="markcaudill"

build-% : lint-%  ## Build image
	@echo "+ $@"
	docker build -t $(REPO)/$*:latest $*
.PHONY: build-%

push-% : build-%  ## Push image
	@echo "+ $@"
	docker push $(REPO)/$*
.PHONY: push-%
