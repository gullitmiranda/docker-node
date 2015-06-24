all:
	adocker build -t azukiapp/node 0.12
	adocker build -t azukiapp/node:0.12 0.12
	adocker build -t azukiapp/node:0.11 0.11
	adocker build -t azukiapp/node:0.10 0.10

no-cache:
	adocker build --rm --no-cache -t azukiapp/node 0.12
	adocker build --rm --no-cache -t azukiapp/node:0.12 0.12
	adocker build --rm --no-cache -t azukiapp/node:0.11 0.11
	adocker build --rm --no-cache -t azukiapp/node:0.10 0.10

TEST_FILES=$(shell find test -name '*.bats' -type f -print0 | xargs -0n1 | sort -u)

bats:
	bats $(TEST_FILES)

test: all bats
	# Restart and run a tests
	# azk shell alpine -c "test"

.PHONY: bats test no-cache all
