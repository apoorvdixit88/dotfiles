# dotfiles

My personal configuration files, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Layout

Everything lives in a single Stow package called `home`, whose inner structure
mirrors `$HOME`:

```
dots/
├── home/                                 ← the one package you stow
│   ├── .config/
│   │   ├── wezterm/wezterm.lua           → ~/.config/wezterm/wezterm.lua
│   │   ├── tmux/tmux.conf                → ~/.config/tmux/tmux.conf
│   │   └── nvim/init.lua                 → ~/.config/nvim/init.lua
│   └── .zshrc                            → ~/.zshrc
├── bootstrap-zsh.sh                      # re-clones external oh-my-zsh plugins
├── README.md
└── .gitignore
```

## Fresh machine setup

```sh
# 1. Install prerequisites
brew install stow tmux
# oh-my-zsh:
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 2. Clone this repo
git clone <your-repo-url> ~/dots
cd ~/dots

# 3. Re-install external zsh plugins
./bootstrap-zsh.sh

# 4. Symlink everything into place
stow home
```

## Everyday use

- **Edit a config** — edit the file inside `~/dots/home` (your live config is a symlink to it), then commit + push.
- **Add a new app** — drop its config under `home/.config/<app>/…`, then re-run `stow home`.
- **Unlink** — `stow -D home`.
- **Relink after adding files** — `stow -R home`.

## Notes

- Built-in oh-my-zsh plugins (`git`, `vscode`, `dirhistory`, `jsontools`) ship with oh-my-zsh — no cloning needed.
- Only external plugins live in `bootstrap-zsh.sh` (currently `zsh-autosuggestions`).
