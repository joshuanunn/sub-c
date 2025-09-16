BIN := subc

SRC := \
	bin/dune \
	bin/main.ml \
	lib/dune \
	$(wildcard lib/*.ml) \
	$(wildcard lib/*.mll) \
	$(wildcard lib/*.mly)

.PHONY: all test_unit test_e2e test_lex test_parse test_exe clean

all: $(BIN)

$(BIN): $(SRC)
	dune build
	dune install

test_unit:
	dune runtest

test_e2e: $(BIN)
	bash test_e2e/_runner.sh

test_lex: $(BIN)
	bash test_e2e/_runner.sh --phase lex

test_parse: $(BIN)
	bash test_e2e/_runner.sh --phase parse

test_exe: $(BIN)
	bash test_e2e/_runner.sh --phase exe

clean:
	dune clean
