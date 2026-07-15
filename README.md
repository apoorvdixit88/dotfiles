# dotfiles

My personal configuration files, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Layout

Everything lives in a single Stow package called `home`, whose inner structure
mirrors `$HOME`:

```
dotfiles/
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
# 1. Install prerequisites (stow + terminal + tmux + the Nerd Font)
brew install stow tmux
brew install --cask wezterm font-meslo-lg-nerd-font
# oh-my-zsh (this creates a default ~/.zshrc — we remove it in step 3):
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 2. Clone this repo
git clone <your-repo-url> ~/dotfiles
cd ~/dotfiles

# 3. Remove oh-my-zsh's default ~/.zshrc so Stow can link ours
#    (Stow refuses to overwrite an existing real file.)
rm -f ~/.zshrc

# 4. Re-install external zsh plugins
./bootstrap-zsh.sh

# 5. Symlink everything into place
stow home
```

Then open a fresh terminal and fully restart WezTerm so all configs load.

## Everyday use

- **Edit a config** — edit the file inside `~/dotfiles/home` (your live config is a symlink to it), then commit + push.
- **Add a new app** — drop its config under `home/.config/<app>/…`, then re-run `stow home`.
- **Unlink** — `stow -D home`.
- **Relink after adding files** — `stow -R home`.

## Notes

- Built-in oh-my-zsh plugins (`git`, `vscode`, `dirhistory`, `jsontools`) ship with oh-my-zsh — no cloning needed.
- Only external plugins live in `bootstrap-zsh.sh` (currently `zsh-autosuggestions`).
- WezTerm uses the `MesloLGS Nerd Font Mono` font — installed via `font-meslo-lg-nerd-font` above.
