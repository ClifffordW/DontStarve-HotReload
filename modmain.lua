local _G = GLOBAL

Assets = {
	Asset("IMAGE", "images/hot_reload.tex"),
	Asset("ATLAS", "images/hot_reload.xml"),
}

------------------------------------------- INDICATOR -------------------------------------------
--Skips redundant animation
local skipanimation = GetModConfigData("skipanim")

local hotreloadicon


_G.staticScheduler:ExecuteInTime(0, function()
	if _G.TheFrontEnd and not hotreload_text then
		local Text = require("widgets/text")
		local Image = require("widgets/image")

		local LOC = require("languages/loc")
		local locale = LOC.GetLocaleCode()

		local hotreload_lang = {
			en = "HOT RELOAD",
			es = "RECARGA RÁPIDA",
			ru = "ГОРЯЧАЯ ПЕРЕЗАГРУЗКА",
			fr = "RECHARGEMENT À CHAUD",
			de = "HEISSER NEUSTART",
			it = "RICARICA VELOCE",
			ja = "ホットリロード",
			ko = "핫 리로드",
			pt = "RECARGA RÁPIDA",
			pl = "GORĄCE PRZEŁADOWANIE",
			zh = "热重载",
			zht = "热重载",
		}

		local hotreloadtext = hotreload_lang[LOC.GetLocaleCode()] or hotreload_lang.en

		local ingame = _G.InGamePlay()

		hotreloadicon = _G.TheFrontEnd.overlayroot:AddChild(Image("images/hot_reload.xml", "HotReload_Whaskal.tex"))
		hotreloadicon:SetPosition(1000, 500)
		hotreloadicon:SetScale(0.15, 0.15)
		hotreloadicon:Hide()

		local hotreloadicon_shadow = hotreloadicon:AddChild(Image("images/hot_reload.xml", "HotReload_Whaskal.tex"))
		hotreloadicon_shadow:SetTint(0 / 255, 0 / 255, 0 / 255, 1)
		hotreloadicon_shadow:SetScale(1.05, 1.05)

		hotreloadicon_shadow:MoveToBack()

		local hotreload_text = hotreloadicon:AddChild(Text(_G.UIFONT, 200))
		hotreload_text:SetPosition(0, -300)
		hotreload_text:SetHAlign(_G.ANCHOR_MIDDLE)
		hotreload_text:SetVAlign(_G.ANCHOR_TOP)
		hotreload_text:SetString(hotreloadtext)
		hotreload_text:SetColour(_G.RGB(255, 150, 0))
		hotreload_text:SetScale(0)

		local hotreload_text_shadow = hotreload_text:AddChild(Text(_G.UIFONT, 200))
		hotreload_text_shadow:SetPosition(0, 0)
		hotreload_text_shadow:SetHAlign(_G.ANCHOR_MIDDLE)
		hotreload_text_shadow:SetVAlign(_G.ANCHOR_TOP)
		hotreload_text_shadow:SetString(hotreloadtext)
		hotreload_text_shadow:SetColour(_G.RGB(0, 0, 0))

		hotreload_text_shadow:SetScale(1.05, 1.05)
		hotreload_text_shadow:MoveToBack()

		if not _G.InGamePlay() then
			hotreloadicon:Show()

			hotreload_text:Hide()
			hotreloadicon:SetPosition(50, 1000)
		end

		if skipanimation and ingame then
			hotreloadicon:SetPosition(200, 80)
			hotreloadicon:Show()

			hotreload_text:SetScale(1)
		end

		TheFrontEnd.overlayroot.inst:DoTaskInTime(1.85, function()
			if skipanimation or not ingame then
				return
			end

			TheFrontEnd.overlayroot.inst:DoTaskInTime(0, function()
				hotreloadicon:Show()
			end)

			hotreloadicon:TintTo({ r = 0, g = 0, b = 0, a = 0 }, { r = 1, g = 1, b = 1, a = 1 }, 1.5 * 2)

			hotreloadicon:ScaleTo(0, 0.5, 0.85, function()
				hotreloadicon:ScaleTo(0.5, 0.15, 0.25)
			end)

			hotreloadicon:RotateTo(0, 360, 1.5)

			TheFrontEnd.overlayroot.inst:DoTaskInTime(1.85, function()
				hotreload_text:ScaleTo(0, 1, 0.25)
				hotreloadicon:MoveTo({ x = 1000, y = 500, z = 0 }, { x = 200, y = 80, z = 0 }, 0.85)
			end)
		end)
	end
end)

------------------------------------------- INDICATOR END -------------------------------------------

modimport("luajit")
local jit = require 'jit' or nil

if not jit  then
	_G.staticScheduler:ExecuteInTime(0.5, function()
		hotreloadicon:SetTint(255 / 255, 0 / 255, 0 / 255, 1)
	end)
	
	
	return
end


GLOBAL.setfenv(1, GLOBAL)

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
