#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd -P)"
bootstrap="$repo_root/bootstrap"

fail() {
  printf 'FAIL: %s\n' "$1" >&2
  exit 1
}

assert_eq() {
  local actual="$1"
  local expected="$2"
  local message="$3"
  if [[ "$actual" != "$expected" ]]; then
    fail "$message (expected '$expected', got '$actual')"
  fi
}

write_stub() {
  local stub_path="$1"
  local body="$2"
  printf '#!/bin/sh\n%s\n' "$body" > "$stub_path"
  chmod +x "$stub_path"
}

test_bootstrap_clones_taps_and_runs_prater_bootstrap() {
  [[ -x "$bootstrap" ]] || fail "bootstrap endpoint should be executable"

  local tmpdir
  tmpdir="$(mktemp -d)"

  local home="$tmpdir/home"
  local dotfiles="$home/dotfiles"
  local fakebin="$tmpdir/fakebin"
  mkdir -p "$home" "$fakebin"

  write_stub "$fakebin/git" "printf '%s\n' \"\$*\" >> '$tmpdir/git.log'; mkdir -p \"\$3/.git\""
  write_stub "$fakebin/brew" "printf '%s\n' \"\$*\" >> '$tmpdir/brew.log'; [ \"\$1\" = shellenv ] && printf 'export PATH=%s:\$PATH\n' '$fakebin'; exit 0"

  (
    export HOME="$home"
    export PATH="$fakebin:/usr/bin:/bin"
    export DOTFILES_HOME="$dotfiles"
    "$bootstrap" gitpersonal:stephenprater/dotfiles
  )

  assert_eq "$(<"$tmpdir/git.log")" "clone gitpersonal:stephenprater/dotfiles $dotfiles" "bootstrap should clone the provided dotfiles remote"
  assert_eq "$(<"$tmpdir/brew.log")" "shellenv
tap --custom-remote prater/dotfiles $dotfiles
prater bootstrap" "bootstrap should tap the local checkout and run the brew command"
}

test_bootstrap_clones_taps_and_runs_prater_bootstrap
printf 'PASS: bootstrap tests\n'
