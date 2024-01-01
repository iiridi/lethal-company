.PHONY: run build watch fmt clean test

run: build
	@ dune exec ./bin/lc.exe

watch:
	@ dune build @install --watch

build:
	@ dune build

test:
	@ dune runtest

accept:
	@ dune promote

fmt:
	@ dune build @fmt --auto-promote --watch
