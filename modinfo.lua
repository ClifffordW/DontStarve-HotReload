-- Translate Function

local function translate(texts)
	local lang = locale or "en"
	return texts[lang] or texts["en"]
end

-- Basic Information
name = "Hot Reload"
author = "Jerry"
version = "1.0.0"

--Contributors
contributors = ""
write_contributors = false
credits_only = false

priority = -100

--Modicon
main_icon = "modicon"

--Modinfo
modinfo_ver = "1.5"
config = true

-- Compatibility
dst_compatible = true
dont_starve_compatible = false
reign_of_giants_compatible = false
shipwrecked_compatible = false

api_version = 10

-- Server/Client
all_clients_require_mod = false
client_only_mod = true
server_only_mod = false

-- Version Types
versiontypes = {
	final = "[Final]",
	beta = "[Beta]",
	disc = "[Discontinued]",
	redux = "[Redux]",
}
versiontype = versiontypes[versiontype] or ""

-- Update Name with Version Type
if versiontype ~= "" then
	name = name .. " \n" .. versiontype
end

-- Update Name for GitHub Version
folder_name = folder_name or "workshop-"
if not folder_name:find("workshop-") then
	name = name .. " - GitHub Ver."
end

-- Update Author with Contributors
if contributors ~= "" and contributors ~= nil then
	if write_contributors == true then
		author = author .. " and " .. contributors
	end
end

-- Description Components
local descriptions = {
	en = {
		desc = [[Enables hot reload for easy coding!]],
		changelog = [[󰀏 What's New:

		󰀈 Hot Reload

		]],
		credits = "󰀭 Credits: " .. contributors,
		mark2 = "󰀩 Modinfo Version: " .. modinfo_ver,
	},
	zh = {
		desc = [[启用热重载以便于编码！]],
		changelog = [[󰀏 更新内容：

		󰀈 热重载

		]],
		credits = "󰀭 致谢: " .. contributors,
		mark2 = "󰀩 模组信息版本: " .. modinfo_ver,
	},
	zht = {
		desc = [[啟用熱重載以便於編碼！]],
		changelog = [[󰀏 更新內容：

		󰀈 熱重載

		]],
		credits = "󰀭 致謝: " .. contributors,
		mark2 = "󰀩 模組信息版本: " .. modinfo_ver,
	}
}


-- Configuration Options
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

local lang = Language or "en"
local desc = descriptions[lang].desc
local changelog = descriptions[lang].changelog
local credits = descriptions[lang].credits
local mark2 = descriptions[lang].mark2

-- Fill Description
local version_label = {
	en = "Mod Version: ",
	zh = "模组版本: ",
	zht = "模組版本: ",
}
local version_text = version_label[lang] or version_label["en"]

if write_contributors == true or credits_only == true and contributors ~= "" then
	descfill = desc
		.. "\n\n󰀝 "
		.. (lang == "zh" and "模组版本: " or lang == "zht" and "模組版本: " or "Mod Version: ")
		.. version
		.. "\n"
		.. changelog
		.. "\n\n"
		.. credits
		.. "\n\n"
		.. mark2
else
	descfill = desc
		.. "\n\n"
		.. changelog
		.. "\n󰀝 "
		.. (lang == "zh" and "版本: " or lang == "zht" and "版本: " or "Version: ")
		.. version
		.. "\n\n"
		.. mark2
end

description = descfill

-- Icons
icon_atlas = main_icon .. ".xml"
icon = main_icon .. ".tex"
