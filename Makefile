MAKEFILE_DIR := $(shell basename $(shell pwd))

setup:
		./script/setup.sh $(MAKEFILE_DIR)

.PHONY: setup


clean:
	./script/clean.sh

.PHONY: clean
