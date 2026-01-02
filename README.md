# Dotfiles

Personal dotfiles and machine bootstrap managed with chezmoi.

## Prerequisites

- Install `chezmoi` (https://github.com/twpayne/chezmoi).
- `git` and a POSIX shell (`bash` or `zsh`) available.

## Quick start

Run the included bootstrap script to install the necessary packages:

```bash
./scripts/bootstrap.sh
```

Apply the dotfiles managed by `chezmoi`:

```bash
chezmoi init --apply https://github.com/ekacsh/dotfiles
chezmoi apply -v
```

## Editing your dotfiles

Use `chezmoi` to safely edit and manage files under version control. Example:

```bash
chezmoi edit <path/to/target>
chezmoi apply
```

## License

See the `LICENSE` file for license details.

