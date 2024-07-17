do
	local GLOBAL = GLOBAL
	local modEnv = GLOBAL.getfenv(1)
	local rawget, setmetatable = GLOBAL.rawget, GLOBAL.setmetatable
	setmetatable(modEnv, {
		__index = function(self, index)
			return rawget(GLOBAL, index)
		end,
		-- lack of __newindex means it defaults to modEnv, so we don't mess up globals.
	})

	_G = GLOBAL
end

Assets = {
	Asset("IMAGE", "images/hot_reload.tex"),
	Asset("ATLAS", "images/hot_reload.xml"),
}

modimport("init/indicator")












if not jit then
	return
end

local jit = require("jit") or nil

if not IsWin32() then
	print("Hot Reload only support window")
	return
end

global("HotReloading")

require("hotreload/update_module")
require("hotreload/update_module") -- call again for watch

require("hotreload/update_modmodule")
require("hotreload/update_translate")
require("hotreload/update_prefab")
