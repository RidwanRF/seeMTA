local ScreenX, ScreenY = guiGetScreenSize()

local AddedPremuim
local StartTick
local OldPremium
local CurretPremium
local Music
local DestroyTick
local AlphaAnim = {}

local Font = dxCreateFont("Files/Fonts/BebasNeueBold.otf", 20)

addEvent("StartPremiumUI", true)
addEventHandler("StartPremiumUI", getRootElement(),
	function(PremiumPoints)
		if isElement(Music) then
			destroyElement(Music)

			removeEventHandler("onClientRender", getRootElement(), RenderPremiumDonate)
			exports.see_hud:showHUD()
		end

		AddedPremuim = PremiumPoints

		AlphaStartTick = getTickCount()
		StartTick = getTickCount()

		Music = playSound("Files/Music.mp3")

		AlphaAnim = {0, 1}

		DestroyTick = false

		addEventHandler("onClientRender", getRootElement(), RenderPremiumDonate)

		exports.see_hud:hideHUD()
	end
)

addEventHandler("onClientResourceStop", getRootElement(),
	function()
		exports.see_hud:showHUD()
	end
)


function RenderPremiumDonate()
	local ElapsedTime = getTickCount() - StartTick
	local Progress = ElapsedTime / 10000
	local ElapsedAlphaTime = getTickCount() - AlphaStartTick
	local AlphaProgress = ElapsedAlphaTime / 1500

	local PremiumNum, ImageRot = interpolateBetween(0, 0, 0, AddedPremuim, 1000, 0, Progress, "OutQuad")
	local Alpha = interpolateBetween(AlphaAnim[1], 0, 0, AlphaAnim[2], 0, 0, AlphaProgress, "Linear")

	dxDrawRectangle(0, 0, ScreenX, ScreenY, tocolor(35, 35, 35, 180 * Alpha))
	dxDrawImage(ScreenX / 2 - 200, ScreenY / 2 - 200, 400, 400, "Files/Images/Parent.png", ImageRot, 0, 0, tocolor(61, 122, 188, 255 * Alpha))
	DxDrawBorderedText(255 * Alpha, 1, "Sikeres Támogatás!", 0, 0, ScreenX, ScreenY - 70, tocolor(255, 255, 255, 255 * Alpha), 1, Font, "center", "center", false, false, false, true)
	DxDrawBorderedText(255 * Alpha, 1, "#3d7abc+ #ffffff" .. FormatNumber(math.floor(PremiumNum), ",") .. "#3d7abc PP", 0, 0, ScreenX, ScreenY, tocolor(255, 255, 255, 255 * Alpha), 1, Font, "center", "center", false, false, false, true)

	if Progress >= 1 and AlphaAnim[1] == 0 then
		if not DestroyTick then
			AlphaAnim = {1, 0}

			DestroyTick = getTickCount()
			AlphaStartTick = getTickCount()
		end
	end

	if DestroyTick then
		local ElapsedVulumeTime = getTickCount() - DestroyTick
		local VolumeProgress = ElapsedVulumeTime / 2000

		local Volume = interpolateBetween(1, 0, 0, 0, 0, 0, VolumeProgress, "Linear")
		setSoundVolume(Music, Volume)
	end

	if AlphaAnim[1] == 1 and Alpha == 0 then
		if isElement(Music) then
			destroyElement(Music)
		end

		removeEventHandler("onClientRender", getRootElement(), RenderPremiumDonate)
		exports.see_hud:showHUD()
	end
end

triggerEvent("StartPremiumUI", localPlayer, 5000)

function DxDrawBorderedText(a, outline, text, left, top, right, bottom, color, scale, font, alignX, alignY, clip, wordBreak, postGUI, colorCoded, subPixelPositioning, fRotation, fRotationCenterX, fRotationCenterY)
    local outline = (scale or 1) * (1.333333333333334 * (outline or 1))
    dxDrawText(text:gsub("#%x%x%x%x%x%x", ""), left - outline, top - outline, right - outline, bottom - outline, tocolor (0, 0, 0, a), scale, font, alignX, alignY, clip, wordBreak, postGUI, false, subPixelPositioning, fRotation, fRotationCenterX, fRotationCenterY)
    dxDrawText(text:gsub("#%x%x%x%x%x%x", ""), left + outline, top - outline, right + outline, bottom - outline, tocolor (0, 0, 0, a), scale, font, alignX, alignY, clip, wordBreak, postGUI, false, subPixelPositioning, fRotation, fRotationCenterX, fRotationCenterY)
    dxDrawText(text:gsub("#%x%x%x%x%x%x", ""), left - outline, top + outline, right - outline, bottom + outline, tocolor (0, 0, 0, a), scale, font, alignX, alignY, clip, wordBreak, postGUI, false, subPixelPositioning, fRotation, fRotationCenterX, fRotationCenterY)
    dxDrawText(text:gsub("#%x%x%x%x%x%x", ""), left + outline, top + outline, right + outline, bottom + outline, tocolor (0, 0, 0, a), scale, font, alignX, alignY, clip, wordBreak, postGUI, false, subPixelPositioning, fRotation, fRotationCenterX, fRotationCenterY)
    dxDrawText(text:gsub("#%x%x%x%x%x%x", ""), left - outline, top, right - outline, bottom, tocolor (0, 0, 0, a), scale, font, alignX, alignY, clip, wordBreak, postGUI, false, subPixelPositioning, fRotation, fRotationCenterX, fRotationCenterY)
    dxDrawText(text:gsub("#%x%x%x%x%x%x", ""), left + outline, top, right + outline, bottom, tocolor (0, 0, 0, a), scale, font, alignX, alignY, clip, wordBreak, postGUI, false, subPixelPositioning, fRotation, fRotationCenterX, fRotationCenterY)
    dxDrawText(text:gsub("#%x%x%x%x%x%x", ""), left, top - outline, right, bottom - outline, tocolor (0, 0, 0, a), scale, font, alignX, alignY, clip, wordBreak, postGUI, false, subPixelPositioning, fRotation, fRotationCenterX, fRotationCenterY)
    dxDrawText(text:gsub("#%x%x%x%x%x%x", ""), left, top + outline, right, bottom + outline, tocolor (0, 0, 0, a), scale, font, alignX, alignY, clip, wordBreak, postGUI, false, subPixelPositioning, fRotation, fRotationCenterX, fRotationCenterY)
    dxDrawText(text, left, top, right, bottom, color, scale, font, alignX, alignY, clip, wordBreak, postGUI, colorCoded, subPixelPositioning, fRotation, fRotationCenterX, fRotationCenterY)
end

function FormatNumber(Amount, Stepper)
	local Left, Center, Right = string.match(math.floor(Amount), "^([^%d]*%d)(%d*)(.-)$")
	return Left .. string.reverse(string.gsub(string.reverse(Center), "(%d%d%d)", "%1" .. (Stepper or " "))) .. Right
end
