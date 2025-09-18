BIN := subc

SRC := \
	bin/dune \
	bin/main.ml \
	lib/dune \
	$(wildcard lib/*.ml) \
	$(wildcard lib/*.mll) \
	$(wildcard lib/*.mly)

.PHONY: all test_unit test_e2e test_lex test_parse test_exe regenerate_oracles clean

all: $(BIN)

$(BIN): $(SRC)
	dune fmt || true
	dune build
	dune install

test_unit: $(BIN)
	dune runtest

test_e2e: $(BIN)
	bash test_e2e/_runner.sh

test_lex: $(BIN)
	bash test_e2e/_runner.sh --phase lex

test_parse: $(BIN)
	bash test_e2e/_runner.sh --phase parse

test_exe: $(BIN)
	bash test_e2e/_runner.sh --phase exe

regenerate_oracles: $(BIN)
	bash test_e2e/_regenerate_oracles.sh

clean:
	dune clean
