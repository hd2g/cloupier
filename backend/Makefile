.PHONY: all build test repl download fmt

all: build test

build:
	@cabal build

test:
	@cabal test

repl:
	@cabal repl

download:
	@cabal build --only-download

fmt:
	@stylish-haskell -i -r src app test
