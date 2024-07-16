local lc = locale
local function translate(t)
	t.zhr = t.zh
	t.zht = t.zht or t.zh
	return t[lc] or t.en
end



--Beta, Final, or leave for no name
versiontype = ""
name = "Hot Reload (LuaJIT)"

author = "Jerry"

version = "1.0"

config = true
Language = locale

contributors = ""
write_contributors = false
credits_only = false

main_icon = "modicon"

priority = 1.7976931348623157e+306

api_version = 10

dst_compatible = true
dont_starve_compatible = false
reign_of_giants_compatible = false
shipwrecked_compatible = false

all_clients_require_mod = false
client_only_mod = true
server_only_mod = false













local scales = {}

for i = 1, 20 do
	scales[i] = { description = "x" .. i / 10, data = i / 10 }
end

local pos = {
	[1] = { description = "Default", data = 0 },
}

for i = 2, 15 do
	pos[i] = { description = "+" .. i .. "0", data = i * 10 }
end

local opt_Empty = { { description = "", data = 0 } }
local function Title(title, hover)
	return {
		name = title,
		hover = hover,
		options = opt_Empty,
		default = 0,
	}
end

local SEPARATOR = Title("")

modinfo_ver = "2.2"
if config == true then
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


		
	}
end

icon_atlas = main_icon .. ".xml"
icon = main_icon .. ".tex"

versiontypes = {
	final = "[Final]",
	beta = "[Beta]",
	disc = "[Discontinued]",
	redux = "[Redux]",
}
versiontype = versiontypes[versiontype] or ""

modinfo_ver = modinfo_ver

if versiontype == "" then
	name = name
else
	name = name .. " \n" .. versiontype .. ""
end

folder_name = folder_name or "workshop-"
if not folder_name:find("workshop-") then
	name = name .. " - GitHub Ver."
end

old_author = author
if contributors == "" or contributors == nil then
	author = author
elseif write_contributors == true then
	author = author .. " and " .. " " .. contributors
end

-- Description Components
versiontypes = {
	final = "[Final]",
	beta = "[Beta]",
	disc = "[Discontinued]",
	redux = "[Redux]",
}
versiontype = versiontypes[versiontype] or ""

modinfo_ver = modinfo_ver

if versiontype == "" then
	name = name
else
	name = name .. " \n" .. versiontype .. ""
end

folder_name = folder_name or "workshop-"
if not folder_name:find("workshop-") then
	name = name .. " - GitHub Ver."
end

old_author = author
if contributors == "" or contributors == nil then
	author = author
elseif write_contributors == true then
	author = author .. " and " .. " " .. contributors
end

-- Description Components
local descriptions = {
	en = {
		name = "Hot Reload",
		desc = [[This mod allows you to save code you are working on, updating it in real time. Documentation will be available]],
		changelog = [[󰀏 What's New:

		󰀈 Hot Reload

		]],
		credits = "󰀭 Credits: " .. contributors,
		mark2 = "󰀩 Modinfo Version: " .. modinfo_ver
	},
	zh = {
		name = "热重载",
		desc = [[ Insert Here Jerry ]],
		changelog = [[󰀏 更新内容：

		󰀈 热重载

		]],
		credits = "󰀭 致谢: " .. contributors,
		mark2 = "󰀩 模组信息版本: " .. modinfo_ver
	},
	zht = {
		name = "熱重載 (LuaJIT)",
		desc = [[ Insert Here Jerry ]],
		changelog = [[󰀏 更新內容：

		󰀈 熱重載

		]],
		credits = "󰀭 致謝: " .. contributors,
		mark2 = "󰀩 模組信息版本: " .. modinfo_ver
	}
}

local lang = Language or "en"


name = descriptions[lang].name
local desc = descriptions[lang].desc
local changelog = descriptions[lang].changelog
local credits = descriptions[lang].credits
local mark2 = descriptions[lang].mark2

if write_contributors == true or credits_only == true and contributors ~= "" then
	descfill = desc .. "\n\n󰀝 " .. (lang == "zh" and "模组版本: " or lang == "zht" and "模組版本: " or "Mod Version: ") .. version .. "\n" .. changelog .. "\n\n" .. credits .. "\n\n" .. mark2
else
	descfill = desc .. "\n\n" .. changelog .. "\n󰀝 " .. (lang == "zh" and "版本: " or lang == "zht" and "版本: " or "Version: ") .. version .. "\n\n" .. mark2
end

description = descfill


local lang = Language or "en"
local desc = descriptions[lang].desc
local changelog = descriptions[lang].changelog
local credits = descriptions[lang].credits
local mark2 = descriptions[lang].mark2

if write_contributors == true or credits_only == true and contributors ~= "" then
	descfill = desc .. "\n\n󰀝 " .. (lang == "zh" and "模组版本: " or lang == "zht" and "模組版本: " or "Mod Version: ") .. version .. "\n" .. changelog .. "\n\n" .. credits .. "\n\n" .. mark2
else
	descfill = desc .. "\n\n" .. changelog .. "\n󰀝 " .. (lang == "zh" and "版本: " or lang == "zht" and "版本: " or "Version: ") .. version .. "\n\n" .. mark2
end


description = descfill

