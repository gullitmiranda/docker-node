#!/usr/bin/env bats

load ./test_helper
VERSION=0.12
NPM_VERSION=2.11.3
IMAGE=azukiapp/node:$VERSION

@test "node version is correct" {
  run docker run "$IMAGE" node --version
  [ $status -eq 0 ]
  assert_match  "^v$VERSION"
}

@test "npm version is correct" {
  run docker run "$IMAGE" npm --version
  [ $status -eq 0 ]
  assert_match  "$NPM_VERSION"
}
