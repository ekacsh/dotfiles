#!/usr/bin/env bash
set -euo pipefail

TOOLS=(
  zsh
  ripgrep
  direnv
)

log() {
  printf "\n\033[1;32m==> %s\033[0m\n" "$1"
}

command_exists() {
  command -v "$1" >/dev/null 2>&1
}

install_with_apt() {
  log "Using apt"
  sudo apt update
  sudo apt install -y \
    ${TOOLS[*]}
}

install_fzf() {
  if [[ -d "$HOME/.fzf" ]]; then
    log "fzf already installed (upstream)"
    return
  fi

  log "Installing latest fzf from upstream"
  git clone --depth 1 https://github.com/junegunn/fzf.git "$HOME/.fzf"
  "$HOME/.fzf/install" --key-bindings --completion --no-update-rc
}

install_zoxide() {
  if command_exists zoxide; then
    log "zoxide already installed"
    return
  fi

  log "Installing zoxide (upstream)"
  curl -fsSL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh \
    | sh
}

install_starship() {
  if command_exists starship; then
    log "starship already installed"
    return
  fi

  log "Installing starship (upstream)"
  curl -fsSL https://starship.rs/install.sh \
    | sh -s -- --yes
}

install_zinit() {
  if [[ -d "$HOME/.zinit" ]]; then
    log "zinit already installed"
    return
  fi

  log "Installing zinit"
  mkdir -p "$HOME/.zinit"
  git clone https://github.com/zdharma-continuum/zinit.git "$HOME/.zinit/bin"
}

# Package manager detection and installation
if command_exists apt; then
  install_with_apt
else
  echo "No supported package manager found"
  exit 1
fi

# Custom installations
install_fzf
install_zoxide
install_starship
install_zinit