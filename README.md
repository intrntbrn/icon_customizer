icon_customizer for awesomewm
==================

<p align="center">
  <img src="https://s7.gifyu.com/images/smart_border_github.gif">
</p>

Features:
------------
- Define your own icons
- Set custom icons for terminal applications

Prerequisite:
------------
You need to configure your shell and terminal to support dynamic titles.

Installation:
------------

Clone the repo and import the module:

1. `git clone https://github.com/intrntbrn/icon_customizer ~/.config/awesome/icon_customizer`
1. `echo "require('icon_customizer'){}" >> ~/.config/awesome/rc.lua`

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

