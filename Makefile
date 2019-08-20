PACKER_VERSION = 1.4.3
IMAGE_NAME ?= contino/packer:$(PACKER_VERSION)
TAG = $(PACKER_VERSION)

.PHONY: build
build:
	docker build -t $(IMAGE_NAME) .

.PHONY: test
test:
	@docker run --rm --entrypoint=packer $(IMAGE_NAME) --version
	@docker run --rm --entrypoint=aws $(IMAGE_NAME) --version

.PHONY: shell
shell:
	docker run --rm --entrypoint=bash -it -v ~/.aws:/root/.aws -v ${PWD}:/opt/app $(IMAGE_NAME)

.PHONY: gitTag
gitTag:
	-git tag -d $(TAG)
	-git push origin :refs/tags/$(TAG)
	git tag $(TAG)
	git push origin $(TAG)<Paste>
