local Root = getRootElement()
ScreenX, ScreenY = guiGetScreenSize()
SantaAlpha = 0

local Time = 86400

local Alpha = {}

local Camera = {1033.4810791016, 1020.767578125, 11.912899971008, 1032.7005615234, 1020.1542358398, 11.792101860046}

local SantaSkin = engineRequestModel("ped")

setElementData(localPlayer, "Santa.Finish", false)
setElementData(localPlayer, "Santa.HaveGift", false)

function ReMap(inValue, inMin, inMax, outMin, outMax)
	return (inValue - inMin) * (outMax - outMin) / (inMax - inMin) + outMin
end

local ResponsiveMultipler = ReMap(ScreenX, 1024, 1920, 0.75, 1)

function Respc(Value)
	return math.ceil(Value * ResponsiveMultipler)
end

addEventHandler("onClientResourceStart", resourceRoot,
	function()
		engineImportTXD(engineLoadTXD("Files/Models/Santa.txd", true), SantaSkin)
		engineReplaceModel(engineLoadDFF("Files/Models/Santa.dff"), SantaSkin)
	end
)

addEventHandler("onClientResourceStop", resourceRoot,
	function()
		engineFreeModel(SantaSkin)
		setCameraTarget(localPlayer)
	end
)

addEventHandler("onClientElementStreamIn", Root,
	function()
		local Source = source

		if getElementType(Source) == "ped" or getElementType(Source) == "player" then
			if getElementData(Source, "Santa.Skin") then
				setElementModel(Source, SantaSkin)
			end
		end
	end
)

addEvent("StartSantaGame", true)
addEventHandler("StartSantaGame", Root, 
	function(Ped, Type, Error)
		SeeFont = dxCreateFont("Files/Fonts/BebasNeueRegular.otf", 20)
 		SeeFontBig = dxCreateFont("Files/Fonts/BebasNeueRegular.otf", 30)

 		Sound = playSound("Files/Songs/Music.mp3")
 		setSoundVolume(Sound, 1)

		ErrorTextData = false

		if Error then
			ErrorTextData = Error
		end

		RenderState = Type
		PedMessage = false
		SantaMessage = false

		SourceSantaPed = Ped
		SantaAlpha = 0

		addEventHandler("onClientRender", Root, RenderSantaTask)
		addEventHandler("onClientClick", Root, ClickOnSanta)
		AnimateCamera("Enter", Camera, Type)

		exports.see_hud:hideHUD()

		StopThisRender = false

		setElementFrozen(localPlayer, true)
	end
)

function RenderSantaTask()
	ActiveButton = false

	if Sound and isElement(Sound) and IsSoundFinished(Sound) then
		destroyElement(Sound)

		setPedAnimation(SourceSantaPed)
		AnimateCamera("Exit", CameraStartCoords)
	end

	dxDrawRectangle(0, 0, ScreenX, Respc(100), tocolor(25, 25, 25, 255 * SantaAlpha))
    dxDrawRectangle(0, ScreenY - Respc(100), ScreenX, Respc(100), tocolor(25, 25, 25, 255 * SantaAlpha))

	if PedMessage then
		local Progress = (getTickCount() - StartSantaTick) / (utf8.len(SantaMessage) * 100) --100
		local Polate = interpolateBetween(0, 0, 0, string.len(SantaMessage), 0, 0, Progress, "Linear")
		local Text = SantaMessage:sub(1, (Polate))

		dxDrawText(Text, ScreenX / 2, ScreenY - Respc(100), nil, nil, tocolor(255, 255, 255, 255 * SantaAlpha), 1, SeeFont, "center", "top")
	
		if Progress >= 1 then
			if RenderState == "Start" then
				setPedAnimation(SourceSantaPed)

				CreateButton("SantaAccept", "Persze!", ScreenX / 2 - Respc(200) - 5, ScreenY - Respc(60), Respc(200), Respc(40), {124, 197, 118})
				CreateButton("SantaCancel", "Nem", ScreenX / 2 + 5, ScreenY - Respc(60), Respc(200), Respc(40), {215, 89, 89})
			elseif RenderState == "Cancel" then
				if not StopThisRender then
					setPedAnimation(SourceSantaPed)

					AnimateCamera("Exit", CameraStartCoords)
				end

				StopThisRender = true
			elseif RenderState == "AccectQuest" then
				SantaMessage = "Viszont vigyázz nehogy meglássanak a házban!"
				RenderState = "StartQuest"

				StartSantaTick = getTickCount()
			elseif RenderState == "StartQuest" then
				if not StopThisRender then
					setTimer(function()
						setPedAnimation(SourceSantaPed)

						AnimateCamera("Exit", CameraStartCoords)

						StartSantaQuest()
					end, 1000, 1)
				end

				StopThisRender = true
			elseif RenderState == "Finish" then
				if not StopThisRender then
					setPedAnimation(SourceSantaPed, "DEALER", "DEALER_DEAL", -1, false, false, false, false)
					setPedAnimation(localPlayer, "DEALER", "DEALER_DEAL", -1, false, false, false, false)

					setTimer(function()
						setPedAnimation(SourceSantaPed)
						setPedAnimation(localPlayer)

						AnimateCamera("Exit", CameraStartCoords)
						setElementData(localPlayer, "Santa.Finish", false)

						triggerServerEvent("$$$$$$$$$$$$$$$", localPlayer, localPlayer, 156, 1, false, false, false, false, "faszhuszar.net")
					
						outputChatBox("#d75959[StrongMTA - Mikulás]:#ffffff Kaptál egy ajándékot a segítségedért cserébe.", 255, 255, 255, true)
					end, 4000, 1)

					StopThisRender = true
				end
			elseif RenderState == "Error" or RenderState == "HaveGift" or RenderState == "Aduty" then
				if not StopThisRender then
					setPedAnimation(SourceSantaPed)

					AnimateCamera("Exit", CameraStartCoords)
				end

				StopThisRender = true
			end
		end
	end
end

function StartSantaQuest()
	local Random = math.random(1, #InteriorEnterPos)
	local PosX, PosY, PosZ = unpack(InteriorEnterPos[Random])

	Blip = createBlip(PosX, PosY, PosZ - 5, 0, 2, 215, 89, 89)
	setElementData(Blip, "blipTooltipText", "Kijelölt ház (ajándék)", false)

	Marker = createMarker(PosX, PosY, PosZ, "checkpoint", 2, 124, 197, 118, 100)
	Col = createColSphere(PosX, PosY, PosZ, 2)
	addEventHandler("onClientColShapeHit", Col, EnterCol)

	setElementData(localPlayer, "Santa.HaveGift", true)

	outputChatBox("#d75959[StrongMTA - Mikulás]:#ffffff Menj és vidd el a csomagot a blippel jelölt helyre! (Zöld Marker)", 255, 255, 255, true)
end

function EnterCol(Entity, Dim)
	if Dim and Entity == localPlayer then
		setElementData(localPlayer, "Santa.LastPos", {getElementPosition(localPlayer)})

		destroyElement(Blip)
		destroyElement(Marker)

		removeEventHandler("onClientColShapeHit", Col, EnterCol)

		destroyElement(Col)

		triggerServerEvent("SetPlayerQuestInt", localPlayer)

		local AccId = getElementData(localPlayer, "char.accID")
		local PosX, PosY, PosZ = 2495.6889648438, -1704.0845947266, 1018.34375

		Marker = createMarker(PosX, PosY, PosZ - 1, "cylinder", 1, 124, 197, 118, 100)
		setElementInterior(Marker, 	3)
		setElementDimension(Marker, AccId + 9999)

		Col = createColSphere(PosX, PosY, PosZ, 1)
		addEventHandler("onClientColShapeHit", Col, EnterDoneCol)

		outputChatBox("#d75959[StrongMTA - Mikulás]:#ffffff Rakd le a csomagokat az emeleti hálószobában! (Zöld Marker)", 255, 255, 255, true)
	end
end

function EnterDoneCol(Entity, Dim)
	if Entity == localPlayer then
		destroyElement(Marker)

		removeEventHandler("onClientColShapeHit", Col, EnterDoneCol)

		destroyElement(Col)

		triggerServerEvent("FinishQuest", localPlayer)

		setElementData(localPlayer, "Santa.HaveGift", false)

		outputChatBox("#d75959[StrongMTA - Mikulás]:#ffffff Sikeresen kiszállítottad a csomagokat! Most menj és beszélj a Mikulással!", 255, 255, 255, true)
	end
end

function ClickOnSanta(Key, State)
	if Key == "left" and State == "down" then
		if PedMessage then
			if ActiveButton then
				if ActiveButton == "SantaCancel" then
					RenderState = "Cancel"
					SantaMessage = "Rendben azért ha meggondolnád magad 30 perc múlva keress meg!"
				elseif ActiveButton == "SantaAccept" then
					RenderState = "AccectQuest"
					SantaMessage = "Remek köszönöm! Légy szíves vidd el ezt a csomagot a kijelölt házhoz!"
				end

				setPedAnimation(SourceSantaPed, "GANGS", "prtial_gngtlkA", -1, true, false, false)
				StartSantaTick = getTickCount()
				PedMessage = true
			end
		end
	end
end

function OnCameraFinish(Type, RenderType)
	if Type == "Enter" then
		setPedAnimation(SourceSantaPed, "GANGS", "prtial_gngtlkA", -1, true, false, false)
		if RenderType == "Start" then
			SantaMessage = "Hohoho szevasz komám hallom jól viselkedtél! Nagyon elvagyok úszva, lenne kedved nekem segíteni?"
		elseif RenderType == "Finish" then
			SantaMessage = "Köszönöm a segítséged itt a jutalmad!"
		elseif RenderType == "Error" then
			SantaMessage = "Köszönöm de most nincs szükségem a segítségedre gyere vissza " .. ErrorTextData .. " múlva!"
		elseif RenderState == "Aduty" then
			SantaMessage = "Hohoho szevasz komám hallom nem jól viselkedtél! Most is adutyban eventeznél."
		elseif RenderType == "HaveGift" then
			SantaMessage = "Az a csomag nem fogja kiszállítani magát. Kérlek siess!"
		end
		StartSantaTick = getTickCount()
		PedMessage = true
	elseif Type == "Exit" then
		setElementData(SourceSantaPed, "Santa.Ped.Use", false)

		setCameraTarget(localPlayer)
		exports.see_hud:showHUD()

		removeEventHandler("onClientClick", Root, ClickOnSanta)
		removeEventHandler("onClientRender", Root, RenderSantaTask)

		if isElement(SeeFont) then
			destroyElement(SeeFont)
		end

		if isElement(SeeFontBig) then
			destroyElement(SeeFontBig)
		end

		if isElement(Sound) then
			destroyElement(Sound)
		end

		setElementFrozen(localPlayer, false)
	end

	removeEventHandler("onClientRender", Root, RenderCamera)
end

function AnimateCamera(Type, EndCoords, RenderType)
	if Type == "Enter" then
		Alpha = {0, 1}
	else
		Alpha = {1, 0}
	end

	CameraProgress = 0
    CameraTick = getTickCount()

    CameraStartCoords = {
        getCameraMatrix()
    }
     
    CameraEndCoords = EndCoords

    CameraEndType = Type
    CameraRenderType = RenderType
    addEventHandler("onClientRender", Root, RenderCamera)
end

function RenderCamera()
	local CameraProgress = (getTickCount() - CameraTick) / 5000
	local CamX, CamY, CamZ = interpolateBetween(CameraStartCoords[1], CameraStartCoords[2], CameraStartCoords[3], CameraEndCoords[1], CameraEndCoords[2], CameraEndCoords[3], CameraProgress, "Linear")
	local CamRX, CamRY, CamRZ = interpolateBetween(CameraStartCoords[4], CameraStartCoords[5], CameraStartCoords[6], CameraEndCoords[4], CameraEndCoords[5], CameraEndCoords[6], CameraProgress, "Linear")

	SantaAlpha = interpolateBetween(Alpha[1], 0, 0, Alpha[2], 0, 0, CameraProgress, "Linear")
	setSoundVolume(Sound, SantaAlpha)

	setCameraMatrix(CamX, CamY, CamZ, CamRX, CamRY, CamRZ)

	if CameraProgress >= 1 then
        removeEventHandler("onClientRender", Root, RenderCamera)
        OnCameraFinish(CameraEndType, CameraRenderType)
    end
end

function IsSoundFinished(Sound)
	if isElement(Sound) then
		return (getSoundPosition(Sound) == getSoundLength(Sound))
	else
		return true
	end
end