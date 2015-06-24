DOCKER=$(shell if [ "$(which adocker)" ]; then which adocker; else which docker; fi)

all:
	${DOCKER} build -t azukiapp/node 0.12
	${DOCKER} build -t azukiapp/node:0.12 0.12
	${DOCKER} build -t azukiapp/node:0.11 0.11
	${DOCKER} build -t azukiapp/node:0.10 0.10

no-cache:
	${DOCKER} build --rm --no-cache -t azukiapp/node 0.12
	${DOCKER} build --rm --no-cache -t azukiapp/node:0.12 0.12
	${DOCKER} build --rm --no-cache -t azukiapp/node:0.11 0.11
	${DOCKER} build --rm --no-cache -t azukiapp/node:0.10 0.10

TEST_FILES=$(shell find test -name '*.bats' -type f -print0 | xargs -0n1 | sort -u)

bats:
	bats $(TEST_FILES)

test: all bats
	# Restart and run a tests
	# azk shell alpine -c "test"

.PHONY: bats test no-cache all
