#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd -P)"
vm="${LIMA_INSTANCE:-dotfiles-dev}"
guest_tmp="$(limactl shell "$vm" -- mktemp -d)"

cleanup() {
  limactl shell "$vm" -- bash -lc \
    'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"; brew tap --custom-remote prater/dotfiles "$HOME/dotfiles"'
  limactl shell "$vm" -- rm -rf "$guest_tmp"
}
trap cleanup EXIT

limactl copy "$repo_root/bootstrap" "$vm:$guest_tmp/bootstrap"
limactl shell "$vm" -- bash -s -- "$guest_tmp" <<'GUEST'
set -euo pipefail
guest_tmp="$1"
trap 'cat "$guest_tmp/bootstrap.log" >&2' ERR

printf '%s\n' \
  'Host github.com' \
  '  HostName 127.0.0.1' \
  '  Port 1' \
  '  User git' \
  'Host gitpersonal' \
  '  HostName github.com' \
  '  User git' \
  '  IdentityFile ~/.ssh/gitpersonal.pub' \
  '  IdentitiesOnly yes' \
  '  StrictHostKeyChecking accept-new' > "$guest_tmp/ssh.config"

timeout 60 env \
  DOTHOME="$guest_tmp/dotfiles" \
  GIT_SSH_COMMAND="ssh -F $guest_tmp/ssh.config" \
  GIT_TRACE=1 \
  bash "$guest_tmp/bootstrap" prater/mise-bootstrap \
  2>&1 \
  | tee "$guest_tmp/bootstrap.log" \
  | grep -m1 -F '[dotfiles] running repository bootstrap' >/dev/null || true

canonical_line="$(grep -n -m1 -F 'git@github.com:stephenprater/dotfiles.git' "$guest_tmp/bootstrap.log" | cut -d: -f1)"
fallback_line="$(grep -n -m1 -F 'ssh://gitpersonal/stephenprater/dotfiles.git' "$guest_tmp/bootstrap.log" | cut -d: -f1)"

test "$canonical_line" -lt "$fallback_line"
test "$(git -C "$guest_tmp/dotfiles" remote get-url origin)" = 'ssh://gitpersonal/stephenprater/dotfiles.git'
grep -q -F '[dotfiles] running repository bootstrap' "$guest_tmp/bootstrap.log"
GUEST

printf 'PASS: bootstrap fallback test\n'
