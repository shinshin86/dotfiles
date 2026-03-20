# dotfiles
dotfiles

## WezTerm setup on macOS

```sh
# install nightly
brew install --cask wezterm@nightly
mkdir -p ~/.config/wezterm
curl -fsSL https://raw.githubusercontent.com/shinshin86/dotfiles/master/.config/wezterm/wezterm.lua -o ~/.config/wezterm/wezterm.lua
curl -fsSL https://raw.githubusercontent.com/shinshin86/dotfiles/master/.config/wezterm/keybinds.lua -o ~/.config/wezterm/keybinds.lua
```

## When you first start Vim.

After setting up `.vimrc`, the following command must be executed the first time Vim is started.

```
:PlugInstall
```
