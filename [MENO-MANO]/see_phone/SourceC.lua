function reMap(InValue, InMin, InMax, OutMin, OutMax)
	return (InValue - InMin) * (OutMax - OutMin) / (InMax - InMin) + OutMin
end

local ScreenX, ScreenY = guiGetScreenSize()
local ResponsiveMultipler = 1.2--reMap(ScreenX, 1024, 1920, 0.75, 1)

function Resp(Value)
	return Value * ResponsiveMultipler
end

function Respc(Value)
	return math.ceil(Value * ResponsiveMultipler)
end

local Fonts = {
	LockScreen = {
		[1] = dxCreateFont("Files/Fonts/LockScreen/1.otf", Respc(33)),
		[4] = dxCreateFont("Files/Fonts/LockScreen/4.otf", Respc(33)),
		[5] = dxCreateFont("Files/Fonts/LockScreen/5.otf", Respc(33)),
		[6] = dxCreateFont("Files/Fonts/LockScreen/6.otf", Respc(33)),
		[8] = dxCreateFont("Files/Fonts/LockScreen/8.otf", Respc(33))
	},

	User = {
		Regular = dxCreateFont("Files/Fonts/SFProRegular.ttf", Respc(12)),
	}
}

local ClickMusicPlayer = {0, 0, 0, 0, 0}

local RoundTexture = dxCreateTexture("Files/Images/Round.png", "argb", true, "clamp")
local AppSize = Respc(38)

local BarApps = {
	[1] = svgCreate(AppSize, AppSize, "Files/Images/Apps/Phone.svg"),
	[2] = svgCreate(AppSize, AppSize, "Files/Images/Apps/Safari.svg"),
	[3] = svgCreate(AppSize, AppSize, "Files/Images/Apps/Messages.svg"),
	[4] = svgCreate(AppSize, AppSize, "Files/Images/Apps/Music.svg"),

}

local PhoneData = {
	LockScreenFont = 4,
	LockScreenFontColor = tocolor(200, 20, 130),
	LockScreen = 7,
	Wallpaper = 8,
	State = "Locked",
	CurrentRadioStation = 1
}

local PhoneW, PhoneH = Respc(242), Respc(494)
local PhoneX, PhoneY = ScreenX / 2 - PhoneW / 2, ScreenY / 2 - PhoneH / 2

local PhoneState = "Locked"

local ToggleState = true

local LockScreenWallpaper = CMasker:create("Files/Images/Wallpapers/LockScreen/" .. PhoneData.LockScreen .. ".png", "Files/Images/Mask.png")
local Wallpaper = CMasker:create("Files/Images/Wallpapers/LockScreen/" .. PhoneData.Wallpaper .. ".png", "Files/Images/Mask.png")

local PhoneRenderTarget = dxCreateRenderTarget(PhoneW, PhoneH, true)
local PhoneShader = dxCreateShader("Files/Shaders/Mask.fx")
local MaskTexture = dxCreateTexture("Files/Images/Mask.png", "argb", true, "clamp")

local ProgressMusicName = 0

local Images = {
	Back = svgCreate(Respc(20), Respc(20), "Files/Images/Island/Backward.svg"),
	Next = svgCreate(Respc(20), Respc(20), "Files/Images/Island/Forward.svg"),
	Pause = svgCreate(Respc(20), Respc(20), "Files/Images/Island/Pause.svg"),
	Play = svgCreate(Respc(20), Respc(20), "Files/Images/Island/Play.svg"),
	Radio1 = svgCreate(Respc(40), Respc(40), "Files/Images/Apps/Radio/Radio1.svg"),
	Radio1Small = svgCreate(Respc(18), Respc(18), "Files/Images/Apps/Radio/Radio1.svg"),
	TechnoBase = svgCreate(Respc(40), Respc(40), "Files/Images/Apps/Radio/TechnoBase.svg"),
	TechnoBaseSmall = svgCreate(Respc(18), Respc(18), "Files/Images/Apps/Radio/TechnoBase.svg"),
	SmallCircle = svgCreate(Respc(26), Respc(26), "Files/Images/Circle.svg")
}

local RadioStations = {
	[1] = {Name = "Rádió 1", Link = "https://icast.connectmedia.hu/5202/live.mp3", Icon = "Radio1"},
	[2] = {Name = "TechnoBase", Link = "https://listen.technobase.fm/tunein-mp3", Icon = "TechnoBase"}
}

local IslandDefW, IslandDefH = Respc(79), Respc(24)
local IslandDefMaxW = math.ceil(IslandDefW * 2.6)
local IslandDefMaxH = math.ceil(IslandDefH * 4)

local NavigationY = 0
local LockState = ""

IslandData = {0, IslandDefW, IslandDefW, IslandDefH, IslandDefH, "", Respc(10), Respc(10)}

addCommandHandler("call", function()
	IslandData = {getTickCount(), IslandDefW, IslandDefMaxW, IslandDefH, Respc(50), "Call", Respc(10), Respc(20)}
	ClickOnIsland = true
end)

addCommandHandler("callend", function()
	IslandData = {getTickCount(), IslandDefMaxW, IslandDefW, Respc(50), IslandDefH, "", Respc(20), Respc(10)}
	ClickOnIsland = true
end)

addCommandHandler("radio", function()
	IslandData = {getTickCount(), Respc(120), IslandDefMaxW, IslandDefH, Respc(100), "RadioBig", Respc(10), Respc(30)}
	ClickOnIsland = true

	PhoneRadioSound = playSound("https://icast.connectmedia.hu/5202/live.mp3")--playSound("https://listen.technobase.fm/tunein-mp3")
end)

local Radius = 0

function RenderPhone(PosX, PosY)
	local CursorX, CursorY = getCursorPosition()

	if CursorX and CursorY then
		if IndicatorPressed then
			NavigationY = CursorY * ScreenY - OffsetY - PhoneY

			NavigationY = -NavigationY

			if NavigationY < 0 then
				NavigationY = 0
			end
		end
	end

	local RealTime = getRealTime()
	local Hour = RealTime.hour
	local Minute = RealTime.minute

	if Minute < 10 then
		Minute = "0" .. Minute
	end

	local CurrentTime = Hour .. ":" .. Minute

	if PhoneData.State == "Locked" then
		if LockState == "Lock" then
			local Progress = (getTickCount() - LockScreenTick) / 1000

			NavigationY = interpolateBetween(NavigationY, 0, 0, 0, 0, 0, Progress, "Linear")

			if Progress >= 1 then
				LockState = ""
			end
		elseif LockState == "Unlock" then
			local Progress = (getTickCount() - LockScreenTick) / 1000

			NavigationY = interpolateBetween(NavigationY, 0, 0, PhoneH, 0, 0, Progress, "Linear")

			if Progress >= 1 then
				LockState = ""

				PhoneData.State = "Menu"
			end
		end
		
		dxSetRenderTarget(PhoneRenderTarget, true)
            dxSetBlendMode("modulate_add")
            	Wallpaper:draw(0, 0, PhoneW, PhoneH)
            	LockScreenWallpaper:draw(0, -NavigationY, PhoneW, PhoneH)

				--***Widget and Clock***--
				dxDrawText(CurrentTime, 0 + PhoneW / 2, Respc(70) - NavigationY, nil, nil, PhoneData.LockScreenFontColor, 1, Fonts.LockScreen[PhoneData.LockScreenFont], "center", "top") 
				--***Widget and Clock***--

				dxDrawImage(0 + PhoneW / 3.5, PhoneH - Respc(20) - NavigationY, PhoneW / 2.5, Respc(5), "Files/Images/Indicator.png")
			dxSetBlendMode("blend")
        dxSetRenderTarget()

        dxSetShaderValue(PhoneShader, "ScreenTexture", PhoneRenderTarget) 
    	dxSetShaderValue(PhoneShader, "MaskTexture", MaskTexture)

        dxDrawImage(PosX, PosY, PhoneW, PhoneH, PhoneShader)
    elseif PhoneData.State == "Menu" then
    	dxSetRenderTarget(PhoneRenderTarget, true)
            dxSetBlendMode("modulate_add")
            	Wallpaper:draw(0, 0, PhoneW, PhoneH)

            	dxDrawImage(0, 0, PhoneW, PhoneH, "Files/Images/BarBg.png", 0, 0, 0, tocolor(0, 0, 0, 180))

            	for Key, Value in pairs(BarApps) do
            		dxDrawImage(0 + PhoneW / 2 - Respc(91) + (Key - 1) * Respc(48), 0 + PhoneH - Respc(70), AppSize, AppSize, Value, 0, 0, 0, tocolor(255, 255, 255, 255))
            	end
			dxSetBlendMode("blend")
        dxSetRenderTarget()


        dxDrawImage(PosX, PosY, PhoneW, PhoneH, PhoneRenderTarget)
       -- AppSettings:draw(PosX, PosY, AppSize, AppSize)
	end

	--***Dynamic Islad***--
	local Progress = (getTickCount() - IslandData[1]) / 300
	IslandW, IslandH, Radius = interpolateBetween(IslandData[2], IslandData[4], IslandData[7], IslandData[3], IslandData[5], IslandData[8], Progress, "Linear")

	dxDrawRoundedRectangle(PosX + PhoneW / 2 - IslandW / 2, PosY + Respc(15), IslandW, IslandH, Radius, tocolor(0, 0, 0, 255), "Island")

	if Progress >= 1 then
		if ClickOnIsland then
			IslandState = IslandData[6]		
			ClickOnIsland = false

			if IslandState == "RadioBig" then
				RadioRenderTarget = dxCreateRenderTarget(IslandW - Respc(80), IslandH, true)

				iprint(RadioRenderTarget)
			end
		end

		if IslandState == "Call" then
			dxDrawImage(PosX + PhoneW / 2 - IslandW / 2 + IslandW - Respc(32), PosY + Respc(15) + Respc(10), IslandH - Respc(22), IslandH - Respc(22), "Files/Images/Island/AcceptCall.png")
			dxDrawImage(PosX + PhoneW / 2 - IslandW / 2 + IslandW - Respc(64), PosY + Respc(15) + Respc(10), IslandH - Respc(22), IslandH - Respc(22), "Files/Images/Island/CancelCall.png")
		elseif IslandState == "RadioBig" then
			local SoundFFT = false
			
			if isElement(PhoneRadioSound) then
				SoundFFT = getSoundFFTData(PhoneRadioSound, 8192, 200)
			end

			if SoundFFT then
				for k, v in pairs(SoundFFT) do
					if k > 8 and k < 15 then
						local Height = SoundFFT[k] * Respc(30)
							
						if Height < Resp(1) then
							Height = Resp(1)
						end

						if Height > Respc(15) then
							Height = Respc(15)
						end

	            		dxDrawRectangle(PosX + PhoneW / 2 - IslandW / 2 + IslandW - Respc(90) + k * Respc(4), PosY + Respc(40), Respc(2), Height)
	            		dxDrawRectangle(PosX + PhoneW / 2 - IslandW / 2 + IslandW - Respc(90) + k * Respc(4), PosY + Respc(40), Respc(2), -Height)
	            	end
	            end
	        end

			dxDrawImage(PosX + Respc(30), PosY + Respc(25), Respc(40), Respc(40), Images[RadioStations[PhoneData.CurrentRadioStation].Icon])

			dxDrawText(RadioStations[PhoneData.CurrentRadioStation].Name, PosX + Respc(85), PosY + Respc(35), nil, nil, tocolor(255, 255, 255), 0.9, Fonts.User.Regular, "left", "top") 
			
			local LasMusicName = MusicName or ""
			local MusicName = false

			if isElement(PhoneRadioSound) then
				MusicName = getSoundMetaTags(PhoneRadioSound).stream_title
				
				if not MusicName then
					MusicName = "Ismeretlen"
				end
				
				LastMusicName = MusicName
			else
				MusicName = LastMusicName
			end

			dxSetRenderTarget(RadioRenderTarget, true)
				local ProgressMusicName = 0

				if #MusicName > 15 then
					ProgressMusicName = (#MusicName * Respc(1)) * getEasingValue(math.abs(getTickCount() % 20000 - 10000) / 10000, "Linear")
				end

	            dxDrawText(MusicName, Respc(5) - ProgressMusicName, 0 + Respc(33), nil, nil, tocolor(200, 200, 200, 200), 0.75, Fonts.User.Regular, "left", "top") 
	        dxSetRenderTarget()

	       	dxDrawImage(PosX + Respc(80), PosY + Respc(18), IslandW - Respc(80), IslandH, RadioRenderTarget)

	       	local Progress = (getTickCount() - ClickMusicPlayer[1]) / 200
			local Alpha = interpolateBetween(ClickMusicPlayer[3], 0, 0, ClickMusicPlayer[4], 0, 0, Progress, "Linear")

			if Progress >= 1 then
				if ClickMusicPlayer[5] == "Start" then
					ClickMusicPlayer = {getTickCount(), ClickMusicPlayer[2], 1, 0, "Stop"}
				elseif ClickMusicPlayer[5] == "Stop" then
					ClickMusicPlayer = {0, 0, 0, 0, 0}
				end
			end

	       	if ClickMusicPlayer[2] == "Play" then
	       		dxDrawImage(PosX + PhoneW / 2 - Respc(13), PosY + IslandH - Respc(23), Respc(26), Respc(26), Images.SmallCircle, 0, 0, 0, tocolor(222, 222, 222, 180 * Alpha))
	       	elseif ClickMusicPlayer[2] == "Next" then
	       		dxDrawImage(PosX + PhoneW / 2 + Respc(27), PosY + IslandH - Respc(23), Respc(26), Respc(26), Images.SmallCircle, 0, 0, 0, tocolor(222, 222, 222, 180 * Alpha))
			elseif ClickMusicPlayer[2] == "Back" then
				dxDrawImage(PosX + PhoneW / 2 - Respc(53), PosY + IslandH - Respc(23), Respc(26), Respc(26), Images.SmallCircle, 0, 0, 0, tocolor(222, 222, 222, 180 * Alpha))
			end

			if isElement(PhoneRadioSound) then
				dxDrawImage(PosX + PhoneW / 2 - Respc(10), PosY + IslandH - Respc(20), Respc(20), Respc(20), Images.Pause)
			else
				dxDrawImage(PosX + PhoneW / 2 - Respc(10), PosY + IslandH - Respc(20), Respc(20), Respc(20), Images.Play)
			end
		
			dxDrawImage(PosX + PhoneW / 2 + Respc(30), PosY + IslandH - Respc(20), Respc(20), Respc(20), Images.Next)
			dxDrawImage(PosX + PhoneW / 2 - Respc(50), PosY + IslandH - Respc(20), Respc(20), Respc(20), Images.Back)
			--dxDrawRoundedCircle(PosX + PhoneW / 2 + Respc(30), PosY + IslandH - Respc(20), Respc(20), Respc(20), false, false, false, false, false, "Next")

			--dxDrawRoundedCircle(100, 100, (200), (200), false, false, false, false, false, "Next")

		elseif IslandState == "RadioSmall" then
			local SoundFFT = false

			if isElement(PhoneRadioSound) then
				SoundFFT = getSoundFFTData(PhoneRadioSound, 8192, 200)
			end

			if SoundFFT then
				for k, v in pairs(SoundFFT) do
					if k > 8 and k < 15 then
						local Height = SoundFFT[k] * Respc(30)
							
						if Height < Resp(1) then
							Height = Resp(1)
						end

						if Height > Respc(30) then
							Height = Respc(30)
						end

	            		dxDrawRectangle(PosX + PhoneW / 2 - IslandW / 2 + IslandW - Respc(45) + k * Respc(2), PosY + Respc(28), Respc(1), Height)
	            		dxDrawRectangle(PosX + PhoneW / 2 - IslandW / 2 + IslandW - Respc(45) + k * Respc(2), PosY + Respc(28), Respc(1), -Height)
	            	end
	            end
	        end

	        dxDrawImage(PosX + Respc(65), PosY + Respc(18), Respc(18), Respc(18), Images[RadioStations[PhoneData.CurrentRadioStation].Icon .. "Small"])
		end
		if IslandData[2] == IslandDefW then
			--IslandData = {getTickCount(), IslandDefMaxW, IslandDefW, IslandDefMaxH, IslandDefH}
		else
			--IslandData = {getTickCount(), IslandDefW, IslandDefMaxW, IslandDefH, IslandDefMaxH}
		end
	end

	local LeftText = CurrentTime

	if PhoneData.State == "Locked" then
		LeftText = "SmHU"
	end

	local PlusX = (PosX + PhoneW / 2 - IslandW / 2) - (PosX + Respc(20))
	
	if IslandW <= Respc(120) then
		dxDrawText(LeftText, PosX + Respc(20) + PlusX / 2, PosY + Respc(15) + Respc(12), nil, nil, tocolor(255, 255, 255), 0.7, Fonts.User.Regular, "center", "center")
	end
	--dxDrawRoundedRectangle(PosX + PhoneW / 2 - IslandW / 2, PosY + Respc(15), IslandW, IslandH, Radius, tocolor(0, 0, 0, 255), "Island")
	dxDrawImage(PosX + PhoneW / 2 + Respc(10), PosY + Respc(15) + Respc(2), Respc(20), Respc(20), "Files/Images/Island/Camera.png")
	--***Dynamic Islad***--

	dxDrawImage(PosX, PosY, PhoneW, PhoneH, "Files/Images/Phone.png")
end

addEventHandler("onClientRender", getRootElement(),
	function()
		RenderPhone(PhoneX, PhoneY)

		PhonePosX, PhonePosY = PhoneX, PhoneY
	end
)


addEventHandler("onClientClick", getRootElement(),
	function(Key, State, AbsX, AbsY)
		if ToggleState then
			local PosX, PosY = PhonePosX, PhonePosY

			if Key == "left" then
				if State == "down" then
					if InSlot(PosX + PhoneW / 3.5, PosY + PhoneH - Respc(20) - NavigationY, PhoneW / 2.5, Respc(5)) then
						--phoneData.indicatorY = phoneY + phoneData.phoneH - Respc(30)
						local CursorX, CursorY = getCursorPosition()
						local CursorY = CursorY * ScreenY

						IndicatorPressed = true
						OffsetY = CursorY - PosY

						outputChatBox("#d75959[StrongMTA - Phone]:#ffffff Ezaz", 255, 255, 255, true)
					elseif InSlot(PosX + PhoneW / 2 - IslandW / 2, PosY + Respc(15), IslandW, IslandDefH)  and not ClickOnIsland then
						if IslandState == "RadioBig" then
							ClickOnIsland = true
							
							if isElement(PhoneRadioSound) then
								IslandData = {getTickCount(), IslandDefMaxW, Respc(120), Respc(100), IslandDefH, "RadioSmall", Respc(30), Respc(10)}
							else
								IslandData = {getTickCount(), IslandDefMaxW, IslandDefW, Respc(100), IslandDefH, "", Respc(30), Respc(10)}
							end

						elseif IslandState == "RadioSmall" then
							ClickOnIsland = true
							IslandData = {getTickCount(), Respc(120), IslandDefMaxW, IslandDefH, Respc(100), "RadioBig", Respc(10), Respc(30)}
							IndexState = 0
						else

						end
					elseif InSlot(PosX + PhoneW / 2 - Respc(10), PosY + IslandH - Respc(20), Respc(20), Respc(20)) then
						if isElement(PhoneRadioSound) then
							destroyElement(PhoneRadioSound)
						else
							PhoneRadioSound = playSound(RadioStations[PhoneData.CurrentRadioStation].Link)
						end

						ClickMusicPlayer = {getTickCount(), "Play", 0, 1, "Start"}
					elseif InSlot(PosX + PhoneW / 2 + Respc(30), PosY + IslandH - Respc(20), Respc(20), Respc(20)) then
						if PhoneData.CurrentRadioStation ~= #RadioStations then
							PhoneData.CurrentRadioStation = PhoneData.CurrentRadioStation + 1

							if isElement(PhoneRadioSound) then
								destroyElement(PhoneRadioSound)

								PhoneRadioSound = playSound(RadioStations[PhoneData.CurrentRadioStation].Link)
							end
						end

						ClickMusicPlayer = {getTickCount(), "Next", 0, 1, "Start"}
					elseif InSlot(PosX + PhoneW / 2 - Respc(50), PosY + IslandH - Respc(20), Respc(20), Respc(20)) then
						if PhoneData.CurrentRadioStation ~= 1 then
							PhoneData.CurrentRadioStation = PhoneData.CurrentRadioStation - 1
							
							if isElement(PhoneRadioSound) then
								destroyElement(PhoneRadioSound)

								PhoneRadioSound = playSound(RadioStations[PhoneData.CurrentRadioStation].Link)
							end
						end

						ClickMusicPlayer = {getTickCount(), "Back", 0, 1, "Start"}
					end
				elseif State == "up" then
					IndicatorPressed = false

					LockScreenTick = getTickCount()

					if NavigationY >= PhoneH / 4 then
				       	LockState = "Unlock"
				    else
				        LockState = "Lock"
				    end

				    outputChatBox(LockState)
				end
			end
		end
	end
)

function InSlot(x, y, width, height)
    if ( not isCursorShowing( ) ) then
        return false
    end
    local sx, sy = guiGetScreenSize ( )
    local cx, cy = getCursorPosition ( )
    local cx, cy = ( cx * sx ), ( cy * sy )
    
    return ( ( cx >= x and cx <= x + width ) and ( cy >= y and cy <= y + height ) )
end