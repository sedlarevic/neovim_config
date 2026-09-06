#!/usr/bin/env bash

set -euo pipefail

if [[ "$(uname -s)" != "Darwin" ]]; then
  printf 'This script is intended for macOS.\n' >&2
  exit 1
fi

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
repo_dir="$(cd -- "${script_dir}/.." && pwd)"
backup_suffix="backup-$(date +%Y%m%d-%H%M%S)"

link_config() {
  local source_path="$1"
  local target_path="$2"

  if [[ ! -e "${source_path}" ]]; then
    printf 'Source does not exist: %s\n' "${source_path}" >&2
    exit 1
  fi

  mkdir -p -- "$(dirname -- "${target_path}")"

  if [[ -L "${target_path}" ]] && [[ "$(readlink "${target_path}")" == "${source_path}" ]]; then
    printf 'Already linked: %s\n' "${target_path}"
    return
  fi

  if [[ -e "${target_path}" || -L "${target_path}" ]]; then
    local backup_path="${target_path}.${backup_suffix}"
    mv -- "${target_path}" "${backup_path}"
    printf 'Backed up: %s -> %s\n' "${target_path}" "${backup_path}"
  fi

  ln -s -- "${source_path}" "${target_path}"
  printf 'Linked: %s -> %s\n' "${target_path}" "${source_path}"
}

link_config "${repo_dir}/nvim" "${HOME}/.config/nvim"
link_config "${repo_dir}/tmux/.tmux.conf" "${HOME}/.tmux.conf"
link_config "${repo_dir}/zsh/.zshrc" "${HOME}/.zshrc"
link_config "${repo_dir}/aerospace/.aerospace.toml" "${HOME}/.aerospace.toml"

printf '\nDotfiles were linked successfully.\n'

for command_name in git nvim tmux; do
  if ! command -v "${command_name}" >/dev/null 2>&1; then
    printf 'Note: "%s" is not installed or is not available in PATH.\n' "${command_name}"
  fi
done
