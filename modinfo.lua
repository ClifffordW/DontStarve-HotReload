name = "Hot Reload LuaJit"
author = "Jerry"
description = "Combines Hot Reload and LuaJit into one mod. Requires LuaJit installed. Comes with handy indicator"

version = "1.0.0"
forumthread = ""

api_version = 6
api_version = 10

dst_compatible = true
all_clients_require_mod = false
client_only_mod = true

icon_atlas = "modicon.xml"
icon = "modicon.tex"

priority = 1.7976931348623157e+306

server_filter_tags = {}

local lc = locale
local function translate(t)
	t.zhr = t.zh
	t.zht = t.zht or t.zh
	return t[lc] or t.en
end

configuration_options = {
	{
		name = "skipanim",
		label = translate({ en = "Load in Animation", zh = "加载动画" }),
		hover = translate({
			en = "Turn off if you want to skip the ingame showing animation",
			zh = "如果您想跳过游戏内显示动画，请关闭",
		}),
		options = {
			{ description = "On", data = true },
			{ description = "Off", data = false },
		},
		default = true,
	},

	{
		name = "EnabledJIT",
		label = translate({ en = "EnabledJIT", zh = "开启JIT模式" }),
		hover = translate({
			en = "It is recommended to turn off if the lag is severe in the game",
			zh = "在游戏中卡顿现象很严重的建议关闭",
		}),
		options = {
			{ description = "On", data = true },
			{ description = "Off", data = false },
		},
		default = true,
	},
	{
		name = "JitOpt",
		label = translate({ en = "JitOpt", zh = "JIT优化选项" }),
		hover = translate({
			en = "maybe faster, maybe slower.",
			zh = "可能更快, 可能更慢.",
		}),
		options = {
			{ description = "On", data = true },
			{ description = "Off", data = false },
		},
		default = true,
	},
	{
		name = "ModBlackList",
		label = translate({ en = "ModJitBlackList", zh = "MODJit黑名单" }),
		hover = translate({
			en = "some mod is't not appropriate",
			zh = "有些mod可能写的特别,不合适jit模式",
		}),
		options = {
			{ description = "On", data = true },
			{ description = "Off", data = false },
		},
		default = true,
	},
}
