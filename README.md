icon_customizer for awesomewm
==================

<p align="center">
  <img src="https://s7.gifyu.com/images/custom_icons.gif">
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

Example Configuration: 
------------
Define your custom icons in `theme.lua`:
```
local icon_dir = os.getenv("HOME") .. "/.config/awesome/icons/"
theme.ic_icons = {
	["Chromium"] = icon_dir .. "chromium.png",
	["firefox"] = icon_dir .. "firefox.png",
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
	["^spt$"] = icon_dir .. "spotify.png",
	["^googler$"] = icon_dir .. "google.png",
	["- rtv"] = icon_dir .. "reddit.png"
}

```

Get application class names or titles by using `xprop`.

Limitations:
------------
It is not possible to set custom icons for applications that are constantly updating the icon themselves (e.g. `Gimp`).

Related Work:
------------

* icons: [numix circle](https://github.com/numixproject/numix-icon-theme-circle)
* awesomewm taglist: [fancy_taglist](https://gist.github.com/intrntbrn/08af1058d887f4d10a464c6f272ceafa)
