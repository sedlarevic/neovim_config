# Dotfiles

Personal configuration for Neovim, tmux, zsh, and AeroSpace.

## Repository structure

```text
dotfiles/
├── aerospace/
│   └── .aerospace.toml
├── nvim/
│   ├── init.lua
│   ├── lazy-lock.json
│   └── lua/
├── scripts/
│   ├── setup-macos.sh
│   └── setup-windows.ps1
├── tmux/
│   └── .tmux.conf
└── zsh/
    └── .zshrc
```

The setup scripts determine the repository location from their own location,
so the repository can be cloned into any directory.

## macOS setup

```bash
git clone https://github.com/sedlarevic/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x scripts/setup-macos.sh
./scripts/setup-macos.sh
```

The macOS script links the following configurations:

| Repository path | System path |
| --- | --- |
| `nvim` | `~/.config/nvim` |
| `tmux/.tmux.conf` | `~/.tmux.conf` |
| `zsh/.zshrc` | `~/.zshrc` |
| `aerospace/.aerospace.toml` | `~/.aerospace.toml` |

If a file or directory already exists at one of the target paths, the script
moves it to a timestamped backup before creating the symbolic link.

## Windows setup

Run the following commands from PowerShell:

```powershell
git clone https://github.com/sedlarevic/dotfiles.git "$HOME\dotfiles"
Set-Location "$HOME\dotfiles"
powershell -ExecutionPolicy Bypass -File ".\scripts\setup-windows.ps1"
```

The Windows script creates a junction from `%LOCALAPPDATA%\nvim` to the `nvim`
directory in this repository. A junction does not require Developer Mode or
administrator privileges.

AeroSpace is only available on macOS. The zsh and tmux configurations are not
activated by the Windows script; they can be used separately inside WSL.

## Requirements

The scripts link configuration files but do not install applications. Install
the applications and command-line tools you want to use before or after running
the appropriate setup script.

