SHELL=/bin/bash -o pipefail
REPORTS=$(patsubst tests/%,report/%,$(wildcard tests/*.test))

test: $(REPORTS)

report/%: tests/% git-lad
	mkdir -p "$$(dirname "$@")"
	./run-test "$<" 2>&1 | tee "$@"

clean:
	rm -rf report/

.PHONY: test clean

.DELETE_ON_ERROR: $(REPORTS)
