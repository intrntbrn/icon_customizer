local gears = require("gears")
local awful = require("awful")

local module = {}

local client = client

local icons
local dynamic_icons
local dynamic_classes
local delay

local function len(T)
	local count = 0
	for _ in pairs(T) do count = count + 1 end
	return count
end

local function contains(T, V)
	for _, v in ipairs(T) do
		if v == V then
			return true
		end
	end
	return false
end

local function set_icon(c, icon)
	if c and c.valid then
		if not c.icon_backup then
			c.icon_backup = icons[c.class] and gears.surface(icons[c.class]) or gears.surface(c.icon)
		end
		if icon then
			icon = gears.surface(icon)
			c.icon = icon and icon._native or nil
		end
	end
end

local function set_dynamic_icon(c)
	for regex, icon in pairs(dynamic_icons) do
		if string.find(c.name, regex) then
			set_icon(c, icon)
			return
		end
	end

	if c.icon_backup then
		c.icon = c.icon_backup and c.icon_backup._native or nil
	end
end

local function setup(config)
	local cfg = config or {}

	icons = cfg.icons or {}
	dynamic_icons = cfg.dynamic_icons or {}
	dynamic_classes = cfg.dynamic_classes or {}
	delay = cfg.delay or 0.5

	if type(icons) ~= 'table' then icons = {} end
	if type(dynamic_icons) ~= 'table' then dynamic_icons = {} end
	if type(dynamic_classes) ~= 'table' then dynamic_classes = {} end
	if type(delay) ~= 'number' then delay = 0.5 end

	client.connect_signal("manage", function(c)
		-- set icon based on c.class
		awful.spawn.easy_async_with_shell("sleep " .. delay, function()
			if c and c.valid and icons[c.class] then
				set_icon(c, icons[c.class])
			end
		end)

		if len(dynamic_icons) == 0 then
			-- user has not defined any dynamic_icons; exit
			return
		end

		-- dynamic classes are only being checked if defined explicitly by the user
		if len(dynamic_classes) > 0 then
			if not contains(dynamic_classes, c.class) then
				-- client is not in dynamic_classes; exit
				return
			end
		end

		-- the client name is now being monitored
		c:connect_signal("property::name", set_dynamic_icon)
	end)
end

return setmetatable(module, { __call = function(_, ...)
	setup(...)
	-- we have to update all clients icons manually when the user restarts awesomewm
	-- since there is no "manage" signal emitted by already running clients.
	-- we also have to manually emit a fake "property::name" signal to update dynamic icons.
	awful.spawn.easy_async_with_shell("sleep " .. delay, function()
		for _, c in ipairs(client.get()) do
			if c and c.valid and icons[c.class] then
				set_icon(c, icons[c.class])
				c:emit_signal("property::name")
			end
		end
	end)
end })
