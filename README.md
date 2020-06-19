icon_customizer for awesomewm
==================

<p align="center">
  <img src="https://s7.gifyu.com/images/smart_border_github.gif">
</p>

Features:
------------
- Define your own icons for applications
- Set custom icons for terminal applications by using regular expressions

Prerequisite:
------------
You need to configure your shell and terminal to support dynamic titles.
Verify your setup by typing `sleep 5` in your terminal. If the title  (`WM_NAME`) of the terminal changes while sleep is running, you are good to go.
Otherwise your shell is most likely not configured to show dynamic titles.

Minimal configurations are provided for `bash` and `zsh`:

```
echo "source ~/.config/awesome/icon_customizer/dynamictitles.bash" >> ~/.bashrc
echo "source ~/.config/awesome/icon_customizer/dynamictitles.zsh" >> ~/.zshrc
```


Installation:
------------

Clone the repo and import the module:

1. `git clone https://github.com/intrntbrn/icon_customizer ~/.config/awesome/icon_customizer`
1. `echo "require('icon_customizer'){}" >> ~/.config/awesome/rc.lua`

Customization:
------------

| name | default | description |
|---|---|---|
| `positions` | { "left", "right", "top", "bottom" } | border positions
| `button_positions` | { "top" } | button positions |

Example Configuration: 
------------
Define your custom icons in `theme.lua`:
```
local icon_dir = os.getenv("HOME") .. "/.config/awesome/icons/"
theme.ic_icons = {
	["Chromium"] = icon_dir .. "chromium.png",
	["firefox"] = icon_dir .. "firefox.png",
	["code-oss"] = icon_dir .. "visualstudiocode.png",
	["feh"] = icon_dir .. "image-viewer.png",
	["vlc"] = icon_dir .. "vlc.png",
	["Zathura"] = icon_dir .. "zathura.png",
	["Steam"] = icon_dir .. "steam.png",
	["discord"] = icon_dir .. "discord.png",
	["Alacritty"] = icon_dir .. "terminal.png",
	["kitty"] = icon_dir .. "terminal.png"
}

theme.ic_dynamic_classes = { "Alacritty", "kitty", "St", "URxvt", "Termite" }
theme.ic_dynamic_icons = {
	["- NVIM$"] = icon_dir .. "vim.png",
	["- VIM$"] = icon_dir .. "vim.png",
	["- TMUX$"] = icon_dir .. "tmux.png",
	["^ranger$"] = icon_dir .. "file-manager.png",
	["^cd$"] = icon_dir .. "file-manager.png",
	["^neomutt$"] = icon_dir .. "gmail.png",
	["^spt$"] = icon_dir .. "spotify.png",
	["^lazygit$"] = icon_dir .. "git.png",
	["^googler$"] = icon_dir .. "google.png",
	["- rtv"] = icon_dir .. "reddit.png"
}

```

Limitations:
------------
It is not possible to set custom icons for applications that are constantly updating the icon themselves (e.g. `Gimp`).
