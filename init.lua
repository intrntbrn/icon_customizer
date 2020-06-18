local wibox = require("wibox")
local gears = require("gears")
local awful = require("awful")
local theme = require("beautiful")
local dpi = theme.xresources.apply_dpi

local module = {}

local function new(config)
	local cfg = config or {}
end

return setmetatable(module, { __call = function(_, ...)
	new(...)
	return module
end })
