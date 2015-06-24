.PHONY: all
all:
	./adocker build -t azukiapp/node 0.12
	./adocker build -t azukiapp/node:0.12 0.12
	./adocker build -t azukiapp/node:0.11 0.11
	./adocker build -t azukiapp/node:0.10 0.10

.PHONY: no-cache
no-cache:
	./adocker build --rm --no-cache -t azukiapp/node 0.12
	./adocker build --rm --no-cache -t azukiapp/node:0.12 0.12
	./adocker build --rm --no-cache -t azukiapp/node:0.11 0.11
	./adocker build --rm --no-cache -t azukiapp/node:0.10 0.10

TEST_FILES=$(shell find test -name '*.bats' -type f -print0 | xargs -0n1 | sort -u)
.PHONY: test
test:
	bats $(TEST_FILES)
