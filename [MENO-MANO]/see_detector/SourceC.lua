local ScreenX, ScreenY = guiGetScreenSize()

function Respc(x)
    return x
end

local EngineModels = {
	Detector = engineRequestModel("object"),
	Ground = engineRequestModel("object")
}

function GetModel(Model)
	return EngineModels[Model]
end

local Models = {
	{"Detector", GetModel("Detector")}
}

local DetectorFont = dxCreateFont("Files/Fonts/W95FA.otf", 15)

local Detectors = {}
local PlayersRot = {}
local LastPlayersRot = {}
local LastViewRotZ = {}

local ViewRotInterpolation = {}

local LastSyncTick = 0

local DetectorPolation = 0
local DetectorSoundPlayed = false

local SizeX, SizeY = 390, 250

local PanelX, PanelY = ScreenX / 2 - 390 / 2 + 400, ScreenY - 250 - 90

local MaxDistance = 16
local MinDistance = 0.1

local MaxSpeed = 0.35
local MinSpeed = 2

local CurrentImage = 0

local DetectorInterpolation = 0
local DetectorSoundPlayed = false

local PositionsTable = {}

function RenderDetector()
	local ClosestRange = math.huge
    local ClosestTable = false
    local MinDistance = false


    local DetectorX, DetectorY, DetectorZ = GetPositionFromElementOffset(Detectors[localPlayer], 1, 0, -0.1)

    local CursorState = isCursorShowing()

	for Key, Value in pairs(PositionsTable) do
		local PosX, PosY, PosZ = unpack(Value)

		if PosX and PosY and PosZ then
			local Distance = getDistanceBetweenPoints2D(PosX, PosY, DetectorX, DetectorY)

			if Distance < ClosestRange and Value[4] then
                ClosestRange = Distance
                ClosestTable = PositionsTable[Key]
                MinDistance = 0.3
            end

			if CursorState then
				if Distance < 20 then
					local PosX, PosY = getScreenFromWorldPosition(PosX, PosY, PosZ)

					if PosX and PosY then
						dxDrawRectangle(PosX - 25, PosY - 25, 50, 50, tocolor(25, 25, 25, 200))

						local SelectedColor = tocolor(255, 255, 255, 180)

						if InSlot(PosX - 25, PosY - 25, 50, 50) then
							SelectedColor = tocolor(144, 217, 138, 200)
							ActivatedPosition = Value
						end

						dxDrawImage(PosX - 20, PosY - 20, 40, 40, "Files/Images/Dig.png", 0, 0, 0, SelectedColor) 
					end
				end
			end
		end
	end

	for _, Vehicle in pairs(getElementsByType("vehicle", getRootElement(), true)) do
		local PosX, PosY, PosZ = getElementPosition(Vehicle)
		local Distance = getDistanceBetweenPoints2D(PosX, PosY, DetectorX, DetectorY)

		if ClosestRange > Distance then
			if Distance < ClosestRange then
				ClosestRange = Distance
	            ClosestTable = {PosX, PosY, PosZ}
	            MinDistance = 2
	        end
		end 
    end

	if ClosestTable then
		local Distace = false
		
		if not DetectorDebug then
			Distance = getDistanceBetweenPoints2D(ClosestTable[1], ClosestTable[2], DetectorX, DetectorY)
		else
			local ElapsedTime = getTickCount() - DetectorDebug[1]
		   	local ElapsedFraction = ElapsedTime / 5000

		   	local SmoothDistance = interpolateBetween(DetectorDebug[2], 0, 0, DetectorDebug[3], 0, 0, ElapsedFraction, "OutQuad")

			Distance = SmoothDistance
			ClosestRange = SmoothDistance

			if SmoothDistance == DetectorDebug[3] then
				if DetectorDebug[3] == 0 then
					DetectorDebug = {getTickCount(), 0, MaxDistance}
				else
					DetectorDebug = false
				end
			end
		end

		local ProgressTime = getTickCount() - DetectorInterpolation
		local SoundSpeed = (MaxSpeed - MinSpeed) * (1 - ((Distance - MinDistance) / (MaxDistance - MinDistance))) + MinSpeed
		local Progress = ProgressTime / (400 * (SoundSpeed))

		if Progress > 0.1 then
			DetectorSoundPlayed = false
		end

		if Progress >= 1 and ClosestRange < MaxDistance then
			DetectorInterpolation = getTickCount()

			if not DetectorSoundPlayed then
				if Distance < MinDistance or CurrentImage >= 7 then
					destroyElement(Sound)
					Sound2 = playSound("Files/Sounds/Detector/2.mp3")
				end

				Sound = playSound("Files/Sounds/Detector/1.mp3")

				DetectorSoundPlayed = true
			end
		end

		if isElement(Sound) then
			setSoundSpeed(Sound, (1.1 - 1) * (1 - ((Distance - MinDistance) / (MaxDistance - MinDistance))) + 1.1)
		end

		if ClosestRange < MinDistance then
		    CurrentImage = 8
		elseif ClosestRange > MaxDistance then
		    CurrentImage = 0
		else
			CurrentImage = 7 * (1 - ((Distance - MinDistance) / (MaxDistance - MinDistance))) + 1
  		
			CurrentImage = math.floor(CurrentImage)

			if CurrentImage > 8 then
				CurrentImage = 8
			end
  		end

        --dxDrawLine3D(DetectorX, DetectorY, DetectorZ, ClosestTable[1], ClosestTable[2], ClosestTable[3] - 1)

        local PlayerX, PlayerY, PlayerZ = getElementPosition(localPlayer)

        dxDrawLine3D(PlayerX, PlayerY, PlayerZ - 2, PlayerX, PlayerY, PlayerZ - 200)

        local Hit, X, Y, Z, Entinty, Nx, Ny, Nz, Material, Lighting, Piece, WorldId, WorldX, WorldY, WorldZ, WrX, WrY, WrZ, WorldLodId = processLineOfSight(
        	PlayerX, PlayerY, PlayerZ - 2, PlayerX, PlayerY, PlayerZ - 200, true, false, false, false
        )

        if Hit then
        	print(WorldId)
        end

        if OffsetX and OffsetY then
        	PanelX, PanelY = OffsetX, OffsetY
        end

  		dxDrawImage(PanelX, PanelY, 390, 250, "Files/Images/Detector/Bg.png")
  		if DetectorDebug then
        	dxDrawText("CALIBRATION", PanelX + 390 / 2, PanelY + 55 - 19, nil, nil, tocolor(25, 25, 25, 255), 1, DetectorFont, "center", "center")
        elseif math.floor(CurrentImage) == 0 then
        	dxDrawText("NO SIGNAL", PanelX + 390 / 2, PanelY + 55 - 19, nil, nil, tocolor(25, 25, 25, 255), 1, DetectorFont, "center", "center")
        else 
        	dxDrawText("SIGNAL:" .. math.floor(CurrentImage) .. "/8", PanelX + 390 / 2, PanelY + 55 - 19, nil, nil, tocolor(25, 25, 25, 255), 1, DetectorFont, "center", "center")
        end
        dxDrawText(math.floor(DetectorX) .. "W", PanelX + 390 - 30, PanelY + 20, nil, nil, tocolor(25, 25, 25, 255), 0.65, DetectorFont, "right", "top")
        dxDrawText(math.floor(DetectorY) .. "N", PanelX + 390 - 30, PanelY + 35, nil, nil, tocolor(25, 25, 25, 255), 0.65, DetectorFont, "right", "top")
        dxDrawText(getZoneName(DetectorX, DetectorY, DetectorZ), PanelX + 390 - 30, PanelY + 60, nil, nil, tocolor(25, 25, 25, 255), 0.65, DetectorFont, "right", "top")
  		dxDrawText("Battery OK", PanelX + 30, PanelY + 60, nil, nil, tocolor(25, 25, 25, 255), 0.65, DetectorFont, "left", "top")

  		if CurrentImage > 0 and DetectorSoundPlayed then
			dxDrawImage(PanelX, PanelY, 390, 250, "Files/Images/Detector/" .. math.floor(CurrentImage) .. ".png", 0, 0, 0, tocolor(255, 255, 255, ImageAlpha))
		end

		local CursorX, CursorY = getCursorPosition()

		if CursorX and CursorY then
		    local CursorX, CursorY = CursorX * ScreenX, CursorY * ScreenY
		   	
		   	if getKeyState("mouse1") then
		    	if CursorX >= PanelX and CursorY >= PanelY and CursorX <= PanelX + SizeX and CursorY <= PanelY + SizeY and not MovingPanel then
		    		MovingPanel = {
		    			CursorX,
		    			CursorY,
		    			PanelX,
		    			PanelY
		    		}
		    	end
		    		
		    	if MovingPanel then
		    		OffsetX = CursorX - MovingPanel[1] + MovingPanel[3]
		    		OffsetY = CursorY - MovingPanel[2] + MovingPanel[4]

		    		if OffsetX < 5 then
		    			OffsetX = 5
		    		end

		    		if OffsetY < 5 then
		    			OffsetY = 5
		    		end

		    		if (OffsetX + SizeX + 5) > ScreenX then
		    			OffsetX = ScreenX - SizeX - 5
		    		end

		    		if (OffsetY + SizeY + 5) > ScreenY then
		    			OffsetY = ScreenY - SizeY - 5
		    		end
		    	end
		    else
		    	MovingPanel = false
		    end
		else
		   	MovingPanel = false
		end
    end
end

addEvent("SyncPlayerRotClient", true)
addEventHandler("SyncPlayerRotClient", getRootElement(),
	function(Rot)
		local Source = source
		local Time = getRealTime()

		if Source and Rot then
			--print("Syncer Client: " .. ServerTime .. " Client: " .. Time.hour .. ":" .. Time.minute .. ":" .. Time.second)
			LastPlayersRot[Source] = PlayersRot[Source] or Rot
			PlayersRot[Source] = Rot
			--iprint(Rot)
		end
	end
)

addEventHandler("onClientPedsProcessed", getRootElement(),
    function()
    	if DetectorState then
	    	local StreamedPlayers = getElementsByType("player", getRootElement(), true)

	    	local CameraX, CameraY, CameraZ, LookAtX, LookAtY, LookAtZ = getCameraMatrix()

	    	local PlayerYaw = select(3, getElementRotation(localPlayer))
	    	local ViewRot = math.deg(math.atan2(CameraY - LookAtY, CameraX - LookAtX)) - PlayerYaw + 90

	    	while ViewRot >= 180 do
		        ViewRot = ViewRot - 360
		    end

		    while ViewRot < -180 do
		       	ViewRot = ViewRot + 360
		    end

		    if ViewRot < -90 then
		        ViewRot = -ViewRot - 180
		    elseif ViewRot > 90 then
		        ViewRot = -ViewRot + 180
		    end

	        LocalPlayerRot = ViewRot

	        if getTickCount() - LastSyncTick > 450 then
	        	if ViewRot ~= SendRot then
		        	local Time = getRealTime()

		    		triggerServerEvent("SyncPlayerDetectorRotServer", localPlayer, StreamedPlayers, ViewRot)

		    		SendRot = ViewRot
		    		LastSyncTick = getTickCount()
		    	end
	    	end
	    end

    	for Player, Object in pairs(Detectors) do
    		if PlayersRot[Player] then
    			local ViewRot = false

    			if localPlayer == Player then
    				ViewRot = LocalPlayerRot
    			else
    				ViewRot = PlayersRot[Player]
    			end

    			if not LastViewRotZ[Player] then
    				LastViewRotZ[Player] = ViewRot
    			end

    			if ViewRot ~= LastViewRotZ[Player] then
		            if not ViewRotInterpolation[Player] then
		                ViewRotInterpolation[Player] = {getTickCount(), LastViewRotZ[Player]}
		            end

		            if ViewRotInterpolation[Player] then
		                local ElapsedTime = getTickCount() - ViewRotInterpolation[Player][1]
		                local ElapsedFraction = ElapsedTime / 200

		               	ViewRotInterpolation[Player][3] = interpolateBetween(ViewRotInterpolation[Player][2], 0, 0, ViewRot, 0, 0, ElapsedFraction, "Linear")

		                if ElapsedFraction >= 1 then
		                    LastViewRotZ[Player] = ViewRot
		                    ViewRotInterpolation[Player] = false
		                end
		            end
		        end

    			local InterpolatedRot = ViewRotInterpolation[Player] and ViewRotInterpolation[Player][3] or ViewRot
    			
    			setElementBoneRotation(Player, 2, InterpolatedRot / 2, 0, 0)
    			setElementBoneRotation(Player, 3, 0, 0, 0)
    			setElementBoneRotation(Player, 4, InterpolatedRot / 4, 0, 0)
    			setElementBoneRotation(Player, 5, InterpolatedRot / 2, 0, 0)

    			setElementBoneRotation(Player, 21, 45, -150, 90)
    			setElementBoneRotation(Player, 22, 0, -90, -75)
    			setElementBoneRotation(Player, 23, 0, 0, 0)
    			setElementBoneRotation(Player, 24, 0, 0, 0)

            	updateElementRpHAnim(Player)
    		end
    	end
    end
)

function CreateDetector(Player)
	if Player then
		Detectors[Player] = createObject(GetModel("Detector"), getElementPosition(localPlayer))
		setElementCollisionsEnabled(Detectors[Player], false)
		exports.see_attach:attach(Detectors[Player], Player, 23, 0.375, 0.0, -0.05, 180, 0, 0)
	end
end

function DestroyDetector(Player)
	if Detectors[Player] then
		if isElement(Detectors[Player]) then
			destroyElement(Detectors[Player])
		end

		Detectors[Player] = nil
	end
end
addEventHandler("onClientElementStreamOut", getRootElement(), 
	function()
		local Source = source

		if getElementData(Source, "Detector.State") then
			DestroyDetector(Source)
		end
	end
)

addEventHandler("onClientPlayerQuit", getRootElement(), 
	function()
		local Source = source

		if getElementData(Source, "Detector.State") and isElementStreamedIn(Source) then
			DestroyDetector(Source)
		end
	end
)

addEventHandler("onClientElementStreamIn", getRootElement(),
	function()
		local Source = source

		if getElementData(Source, "Detector.State") then
			CreateDetector(Source)
		end
	end
)

addEventHandler("onClientElementDataChange", getRootElement(),
	function(Data, Old, New)
		local Source = source

		if Data == "Detector.State" and isElementStreamedIn(Source) then
			if New then
				CreateDetector(Source)
			else
				DestroyDetector(Source)
			end
		end
	end
)

addEvent("SyncPositionsToClient", true)
addEventHandler("SyncPositionsToClient", getRootElement(),
	function(Table)
		if Table then
			PositionsTable = Table
		end
	end
)

addEventHandler("onClientResourceStart", resourceRoot,
	function()
		for _, Table in pairs(Models) do
			engineImportTXD(engineLoadTXD("Files/Models/" .. Table[1] .. ".txd", true), Table[2])
			engineReplaceModel(engineLoadDFF("Files/Models/" .. Table[1] .. ".dff", Table[2]), Table[2])
		end
	end
)

addEventHandler("onClientResourceStop", resourceRoot,
	function()
		for Key, Model in pairs(EngineModels) do
			engineFreeModel(Model)
			--print(Model)
		end

		setElementData(localPlayer, "Detector.State", false)
	end
)

addCommandHandler("detector", 
	function()
		triggerServerEvent("RequestPositionsTable", localPlayer)
		setElementData(localPlayer, "Detector.State", true)

		DetectorState = true
		DetectorDebug = {getTickCount(), MaxDistance, 0}

		addEventHandler("onClientRender", getRootElement(), RenderDetector)

		--DetectorSound = playSound("Files/Sounds/Detector/1.mp3", true)

		DetectorPositions = {}
	end
)

function GetPositionFromElementOffset(element,offX,offY,offZ) 
    local m = getElementMatrix ( element )  -- Get the matrix 
    local x = offX * m[1][1] + offY * m[2][1] + offZ * m[3][1] + m[4][1]  -- Apply transform 
    local y = offX * m[1][2] + offY * m[2][2] + offZ * m[3][2] + m[4][2] 
    local z = offX * m[1][3] + offY * m[2][3] + offZ * m[3][3] + m[4][3] 
    return x, y, z                               -- Return the transformed point 
end 

function math.round(num, decimals)
    decimals = math.pow(10, decimals or 0)
    num = num * decimals
    if num >= 0 then num = math.floor(num + 0.5) else num = math.ceil(num - 0.5) end
    return num / decimals
end

function IsSoundFinished(Sound)
	if isElement(Sound) then
		return (getSoundPosition(Sound) == getSoundLength(Sound))
	else
		return true
	end
end

function table.removeValue(Table, Selected)
	for Index, Value in ipairs(Table) do
		if Value == Selected then
			table.remove(Table, Index)

			return Index
		end
	end

	return false
end

function math.round(num, decimals)
    decimals = math.pow(10, decimals or 0)
    num = num * decimals
    if num >= 0 then num = math.floor(num + 0.5) else num = math.ceil(num - 0.5) end
    return num / decimals
end

function InSlot(x, y, width, height)
    if ( not isCursorShowing( ) ) then
        return false
    end
    local sx, sy = guiGetScreenSize ( )
    local cx, cy = getCursorPosition ( )
    local cx, cy = ( cx * sx ), ( cy * sy )
    
    return ( ( cx >= x and cx <= x + width ) and ( cy >= y and cy <= y + height ) )
end