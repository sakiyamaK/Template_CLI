MAKEFILE_DIR := $(shell basename $(shell pwd))

setup:
	./script/setup.sh $(strip $(MAKEFILE_DIR))

.PHONY: setup


debug:
	swift build

.PHONY: debug


release:
	swift build -c release

.PHONY: release


run:
	swift run 

.PHONY: run


clean:
	./script/clean.sh

.PHONY: clean
