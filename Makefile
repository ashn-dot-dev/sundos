.POSIX:
.SUFFIXES:
.PHONY: \
	all \
	init \
	build \
	run \
	clean
.SILENT: clean

all: build run

init:
	sh sundos-init.sh

build:
	sh sundos-build.sh

run:
	sh sundos-run.sh

clean:
	sh sundos-clean.sh
