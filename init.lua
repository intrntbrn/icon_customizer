local wibox = require("wibox")
local gears = require("gears")
local awful = require("awful")
local theme = require("beautiful")
local dpi = theme.xresources.apply_dpi

local module = {}

local function set_icon(c, icon)
	if not c then return end
	icon = gears.surface(icon)
	c.icon = icon and icon._native or nil
end

local function new(config)
	local cfg = config or {}
end

return setmetatable(module, { __call = function(_, ...)
	new(...)
	return module
end })
