.PHONY: build watch clean

build:
	mkdir -p build
	typst compile --font-path fonts main.typ build/thesis.pdf

watch:
	mkdir -p build
	typst watch --font-path fonts main.typ build/thesis.pdf

clean:
	rm -f build/thesis.pdf
