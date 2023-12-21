setDevelopmentMode(true)

local Debug = false
local ScreenX, ScreenY = guiGetScreenSize()

local ZoneMinX, ZoneMinY = 313.0944519043, 2485.6618652344
local ZoneMaxX, ZoneMaxY = 313.0944519043 + 5, 2485.6618652344 + 5
local ZoneZ = 16.484375 - 0.95

local TrailerCol = createColCuboid(ZoneMinX, ZoneMinY, ZoneZ, ZoneMaxX - ZoneMinX, ZoneMaxY - ZoneMinY, 5)
local Material = dxCreateTexture(":see_impound/files/road.png")

local ShopState = false

local CurrentFarmName = false

local ShopPed = getElementByID("Farm.Shop.Ped")

local ForkModel = false

local MaxFork = 2

local PedWalking = {}
local AnimalSize = {}
local TrailerAnimals = {}
local AnimalsRot = {}

local HayAnim = {}

local UseForkHay = {}

local AnimalTextures = {}

local ColorSwitches = {}
local LastColorSwitches = {}
local StartColorSwitch = {}
local LastColorConcat = {}

local IronForks = {}
local ForkHayObject = {}
local OrderedTable = {}
local AnimalBuyTable = {}

local CallPlayerFarm = 5 -- DEBUG

local ShopState = false

local PanelState = "Default"

local FarmNameInput = false

local Fonts = {
	Roboto = dxCreateFont("Files/Fonts/Roboto.ttf", 14),
	BebasNeueBold = dxCreateFont("Files/Fonts/BebasNeueBold.otf", 18),
	BebasNeueRegular = dxCreateFont("Files/Fonts/BebasNeueRegular.otf", 14),
}

local HayUpTime = 3350
local HayDownTime = 3000

local SelectedBlock = false
local SelectedRow = 0
local SelectedColumn = 0

local Textures = {}
local Shaders = {}
local Sounds = {}
local PlayerSounds = {}

local TempShoppingTable = {}

local BlockData = {}
local AnimalsDataTable = {}
local ClientSideAnimals = {}
local ClientSideObjects = {}

local AnimalFarmDoorID = 1523
local ForkModelID = engineRequestModel("object")
local BaleModelID = engineRequestModel("object")
local HayModelID = engineRequestModel("object")
local InteriorModelID = engineRequestModel("object")
local BarrowModelID = engineRequestModel("object")
local ExteriorModelID = engineRequestModel("object")
local BarrowWheelModelID = engineRequestModel("object")

addEventHandler("onClientResourceStop", resourceRoot,
	function ()
		engineFreeModel(ForkModelID)
		engineFreeModel(BaleModelID)
		engineFreeModel(HayModelID)
		engineFreeModel(InteriorModelID)
		engineFreeModel(BarrowModelID)
		engineFreeModel(BarrowWheelModelID)
	end
)

local Models = {
	{"Files/Models/Interior", "Files/Models/Interior", ExteriorModelID}, 
	{"Files/Models/InteriorAnimal", "Files/Models/InteriorAnimal", InteriorModelID},
	{"Files/Models/Barrow", "Files/Models/Barrow", BarrowModelID},
	{"Files/Models/BarrowWheel", "Files/Models/BarrowWheel", BarrowWheelModelID},
	{"Files/Models/Bale", "Files/Models/Bale", BaleModelID},
	{"Files/Models/Fork", "Files/Models/Fork", ForkModelID},
	{"Files/Animals/Chicken/Skin", "Files/Animals/Chicken/Skin", 1},
	{"Files/Animals/Cow/Skin", "Files/Animals/Cow/Skin", 2},
	{"Files/Animals/Goat/Skin", "Files/Animals/Goat/Skin", 7},
	{"Files/Animals/Pig/Skin", "Files/Animals/Pig/Skin", 10},
	{"Files/Models/Hay", "Files/Models/Hay", HayModelID}
}

local Animations = {
	{"Files/Animations/Barrow_Cover", "IDLE_armed"},
	{"Files/Animations/Barrow_Idle", "IDLE_armed"},
	{"Files/Animations/Barrow_Start", "WALK_start"},
	{"Files/Animations/Barrow_Walk", "WALK_civi"},
	{"Files/Animations/Bucket_Cover", "IDLE_armed"},
	{"Files/Animations/Bucket_Idle", "IDLE_armed"},
	{"Files/Animations/Bucket_Start", "WALK_armed"},
	{"Files/Animations/Bucket_Walk", "WALK_armed"},
	{"Files/Animations/Fork_Down", "M_smk_in"},
	{"Files/Animations/Fork_Idle", "IDLE_armed"},
	{"Files/Animations/Fork_Start", "WALK_start_armed"},
	{"Files/Animations/Fork_Up", "M_smk_in"},
	{"Files/Animations/Fork_Walk", "WALK_armed"},
}

setPedWalkingStyle(localPlayer, 118)

local FarmRenderTarget = dxCreateRenderTarget(640, 1280)

local TextureSize = 128

addEventHandler("onClientResourceStart", resourceRoot,
	function()
		for Key, Value in pairs(Models) do
			if Value[1] and Value[2] and Value[3] then
				if fileExists(Value[2] .. ".txd") then
					engineImportTXD(engineLoadTXD(Value[2] .. ".txd", true), Value[3])
				end

				if fileExists(Value[1] .. ".dff") then
					engineReplaceModel(engineLoadDFF(Value[1] .. ".dff"), Value[3])
				end

				if fileExists(Value[1] .. ".col") then
					engineReplaceCOL(engineLoadCOL(Value[1] .. ".col"), Value[3])
				end
			end
		end

		for Key, Value in pairs(Animations) do
			if Value[1] and Value[2] then
				engineLoadIFP(Value[1] .. ".ifp", Value[1])
			end
		end
	end
)

function CreateHayTexture()
	local RenderTarget = dxCreateRenderTarget(TextureSize, TextureSize, true)

	dxSetRenderTarget(RenderTarget)
		dxSetBlendMode("modulate_add")
			for Index = 1, 4 do
				dxDrawImage(-16, -16, TextureSize + 32, TextureSize + 32, "Files/Images/Hay.png", 0, 0, 0)
				dxDrawImage(-16, -16, TextureSize + 32, TextureSize + 32, "Files/Images/Hay.png", 180, 0, 0)
				dxDrawImage(-16, -16, TextureSize + 32, TextureSize + 32, "Files/Images/Hay.png", 90, 0, 0)
				dxDrawImage(-16, -16, TextureSize + 32, TextureSize + 32, "Files/Images/Hay.png", 270, 0, 0)
			end
		dxSetBlendMode("blend")
	dxSetRenderTarget()

	local Pixels = dxGetTexturePixels(RenderTarget)
	local Texture = dxCreateTexture(Pixels)

	destroyElement(RenderTarget)

	return Texture
end

function CreateHayTrashTexture()
	local RenderTarget = dxCreateRenderTarget(TextureSize, TextureSize, true)

	dxSetRenderTarget(RenderTarget)
		
		for Index = 1, 4 do
			dxDrawImage(-16, -16, TextureSize + 32, TextureSize + 32, "Files/Images/Hay_Trash.png", 270, 0, 0)
			dxDrawImage(-16, -16, TextureSize + 32, TextureSize + 32, "Files/Images/Hay_Trash.png", 0, 0, 0)
		end
	dxSetRenderTarget()

	local Pixels = dxGetTexturePixels(RenderTarget)
	local Texture = dxCreateTexture(Pixels)

	destroyElement(RenderTarget)

	return Texture
end

local HayTrashTexture = CreateHayTrashTexture()
local HayTexture = CreateHayTexture()

addEventHandler("onClientRender", getRootElement(),
	function()
		if ShopState then
			ActiveButton = false
			---***SHOP PANEL***--
			if ShopState == "TrailerCheck" then
				local SizeX, SizeY = 300, 100
				local PosX, PosY = ScreenX / 2 - SizeX / 2, ScreenY / 2 - SizeY / 2

				local PlateText = getVehiclePlateText(SelectedTrailer)

				local PlateSections = {}
				PlateText = split(PlateText, "-")

				for Key = 1, #PlateText do
					if utf8.len(PlateText[Key]) > 0 then
						table.insert(PlateSections, PlateText[Key])
					end
				end

				dxDrawRectangle(PosX, PosY, SizeX, SizeY, tocolor(25, 25, 25, 255))
				dxDrawRectangle(PosX, PosY, SizeX, 30, tocolor(0, 0, 0, 240))
				dxDrawText("StrongMTA - Mezőgazdasági nagyker", PosX + 5, PosY + 30 / 2, nil, nil, tocolor(200, 200, 200, 255), 1, Fonts.BebasNeueRegular, "left", "center")
				dxDrawRectangle(PosX, PosY + 30 - 1, SizeX, 1, tocolor(255, 255, 255, 70))
				dxDrawText("Felrakodás a következő utánfutóra: " .. table.concat(PlateSections, "-"), PosX + SizeX / 2, PosY + 45, nil, nil, tocolor(200, 200, 200, 255), 1, Fonts.BebasNeueRegular, "center", "center")
				CreateButton("BuyOrder", "Igen", PosX + 5, PosY + SizeY - 35, (SizeX / 2) - 10 + 2.5, 30, {124, 197, 118})
				CreateButton("ExitShop", "Nem", PosX + 5 + (SizeX / 2) - 2.5, PosY + SizeY - 35, (SizeX / 2) - 10 + 2.5, 30, {215, 89, 89})
			else
				local OrderNum = 0
				local OrderName = ""
				local OrderPrice = 0

				for Key, Value in pairs(FarmOrders) do
					OrderNum = OrderNum + 1
					OrderName = IdToName[Value.Type]
					OrderPrice = OrderPrice + Value.Price
				end

				local SizeX, SizeY = 300, 170
				local PosX, PosY = ScreenX / 2 - SizeX / 2, ScreenY / 2 - SizeY / 2

				dxDrawRectangle(PosX, PosY, SizeX, SizeY, tocolor(25, 25, 25, 255))
				dxDrawRectangle(PosX, PosY, SizeX, 30, tocolor(0, 0, 0, 240))
				dxDrawText("StrongMTA - Mezőgazdasági nagyker", PosX + 5, PosY + 30 / 2, nil, nil, tocolor(200, 200, 200, 255), 1, Fonts.BebasNeueRegular, "left", "center")
				dxDrawRectangle(PosX, PosY + 30 - 1, SizeX, 1, tocolor(255, 255, 255, 70))

				dxDrawText("Átvehető rendelések", PosX + SizeX / 2, PosY + 35 , nil, nil, tocolor(200, 200, 200, 255), 1, Fonts.BebasNeueRegular, "center", "top")
				dxDrawRectangle(PosX, PosY + 70 - 1, SizeX, 1, tocolor(255, 255, 255, 30))
				dxDrawRectangle(PosX, PosY + 70, SizeX, 2, tocolor(0, 0, 0, 240))

				dxDrawText("Faszos \n " .. OrderName .. " (" .. OrderNum .. "db) - " .. FormatNumber(OrderPrice, ".") .. " $", PosX + 5, PosY + 75 , nil, nil, tocolor(200, 200, 200, 255), 1, Fonts.BebasNeueRegular, "left", "top")

				CreateButton("TrailerCheck", "Kiválasztás", PosX + SizeX - 85, PosY + 75 + 15, 80, 30, {124, 197, 118})

				CreateButton("ExitShop", "Bezárás", PosX + 5, PosY + SizeY - 35, SizeX - 10, 30, {215, 89, 89})
			end
		end
		--***SHOP PANEL***--

		if PlayerInFarm then
			if not LastGetAnimalTable then
				LastGetAnimalTable = getTickCount()
			end

			if isElement(AnimalFarmDoor) then
				local doorPosX, doorPosY, doorPosZ = getElementPosition(AnimalFarmDoor)
				local DoorVelZ = select(3, getElementAngularVelocity(AnimalFarmDoor))

				if math.abs(DoorVelZ) > 0.001 then
					if AnimalDoorEffect.SoundEffectTick + 1000 <= getTickCount() then
						local OldDirection = AnimalDoorEffect.MovementDirection

						if DoorVelZ < 0 then
							AnimalDoorEffect.MovementDirection = -1
						elseif DoorVelZ > 0 then
							AnimalDoorEffect.MovementDirection = 1
						end

						if AnimalDoorEffect.MovementDirection ~= OldDirection then
							AnimalDoorEffect.SoundEffectTick = getTickCount()

							while true do
								local RandomNumber = math.random(1, 3)

								if AnimalDoorEffect.SoundEffectType ~= RandomNumber then
									AnimalDoorEffect.SoundEffectType = RandomNumber
									break
								end
							end

							if isElement(AnimalDoorEffect.SoundEffect) then
								destroyElement(AnimalDoorEffect.SoundEffect)
							end

							AnimalDoorEffect.SoundEffect = playSound3D("Files/Sounds/Door/" .. AnimalDoorEffect.SoundEffectType .. ".mp3", doorPosX, doorPosY, doorPosZ, false)

							if isElement(AnimalDoorEffect.SoundEffect) then
								setElementDimension(AnimalDoorEffect.SoundEffect, PlayerFarm)
							end
						end
					end

					if isElement(AnimalDoorEffect.SoundEffect) then
						local SoundVolume = (math.abs(DoorVelZ) - 0.001) / (0.004 - 0.001)

						if SoundVolume < 0 then
							SoundVolume = 0
						elseif SoundVolume > 1 then
							SoundVolume = 1
						end

						setSoundVolume(AnimalDoorEffect.SoundEffect, SoundVolume)
					end
				else
					AnimalDoorEffect.MovementDirection = 0
				end
			end

			ActiveButton = false

			for Key, Player in pairs(getElementsByType("player", getRootElement(), true)) do
				if UseForkHay[Player] then
					local CurrentTick = getTickCount()
					local ElapsedTime = CurrentTick - HayAnim[Player][1]
					local Progress = ElapsedTime / 2500

					local Scale = interpolateBetween(HayAnim[Player][2], 0, 0, HayAnim[Player][3], 0, 0, Progress, "Linear")

					setObjectScale(HayAnim[Player][4], Scale)

					if Scale <= 0.01 then
						table.removeValue(ClientSideObjects, HayAnim[Player][4])

						if isElement(HayAnim[Player][4]) then
							destroyElement(HayAnim[Player][4])
						end

						UseForkHay[Player] = false
						HayAnim[Player] = nil
					end

					if Progress >= 1 then
						UseForkHay[Player] = false
						HayAnim[Player] = nil
					end
				end
			end
			--[[
			if UseForkHay then
				local CurrentTick = getTickCount()
				local ElapsedTime = CurrentTick - HayAnim[1]
				local Progress = ElapsedTime / 2500

				local Scale = interpolateBetween(HayAnim[2], 0, 0, HayAnim[3], 0, 0, Progress, "Linear")

				setObjectScale(HayAnim[4], Scale)

				if Scale <= 0.01 then
					table.removeValue(ClientSideObjects, HayAnim[4])

					if isElement(HayAnim[4]) then
						destroyElement(HayAnim[4])
					end

					UseForkHay = false
					HayAnim = false
				end

				if Progress >= 1 then
					UseForkHay = false
					HayAnim = false
				end
			end]]

			if UseBaleBlock then
				--SelectedBaleAnim
				local CurrentTick = getTickCount()
				local ElapsedTime = CurrentTick - SelectedBaleAnim[1]
				local Progress = ElapsedTime / 2500

				local Scale = interpolateBetween(SelectedBaleAnim[2], 0, 0, SelectedBaleAnim[3], 0, 0, Progress, "Linear")

				setObjectScale(SelectedBale, 1, 1, Scale)

				if Scale <= 0.02 then
					table.removeValue(ClientSideObjects, SelectedBale)

					if isElement(SelectedBale) then
						destroyElement(SelectedBale)
					end

					UseBaleBlock = false
					SelectedBaleAnim = false
					SelectedBale = false
				end

				if Progress >= 1 then
					UseBaleBlock = false
					SelectedBaleAnim = false
					SelectedBale = false
				end
			end

			Animals = GetFarmAnimals(PlayerFarm)
			AnimalsID = GetAnimalsIdTable()

			if AnimalsID then
				for Key, Value in pairs(AnimalsID) do
					local Random = math.random(1, 20)

					if Random == 4 then
						if Sounds[Value] then
							if IsSoundFinished(Sounds[Value]) then
								if isElement(Sounds[Value]) then
									destroyElement(Sounds[Value])
								end

								Sounds[Value] = nil
							end
						else
							if AnimalsData[Value].Sounds then
								local RandomSound = math.random(1, AnimalsData[Value].Sounds)

								Sounds[Value] = playSound(GetAnimalPath(Value) .. "/Sounds/" .. RandomSound .. ".mp3")
							end
						end
					end
				end

				--***PEDS MOVE***--

				for Key, Value in pairs(ClientSideAnimals) do
					if Value and isElement(Value) and isElementStreamedIn(Value) then
						if math.random(100000) <= math.random(1000, 10000) then
							setPedAnimation(Value, false)
						end

						if math.random(100000) <= math.random(100, 1000) then
							local RandomTurn = math.random(1, 360)
							setPedRotation(Value, RandomTurn)

							setPedAnimation(Value, "PED", "WALK_civi", -1, true, true, false)
						end

						local StartX, StartY, StartZ = GetPositionFromElementOffset(Value, 0, 0, 0.5)
					    local EndX, EndY, EndZ = GetPositionFromElementOffset(Value, 0, 2, 0.5)

					    local Hit, HitX, HitY, hitZ, hitElement = processLineOfSight(StartX, StartY, StartZ, EndX, EndY, EndZ, true, true, false, true, true, false, false, false, Value)

					    if EndY < (-365) then
					       	Hit = true
					    end 

					    if Hit then
					    	local RandomRot = math.random(0, 360)
					    	setElementRotation(Value, 0, 0, RandomRot)
					    end
					end
				end
				--***PEDS MOVE***--
			end
			--***FARM RENDER TARGET***--
			dxSetRenderTarget(FarmRenderTarget, true)
			dxSetBlendMode("modulate_add")
				for Key, Value in pairs(BlockData[PlayerFarm]) do
					if Value.State then
						--***State Draw***--
						if Value.State == "Hay" then
							dxDrawImage((Value.Column - 1) * 128, Value.Row * 128, 128, 128, "Files/Images/Land.png")

							local CleanValueReverse = 100 - Value.Clean

							dxDrawImage((Value.Column - 1) * 128, Value.Row * 128, 128, 128, HayTexture, 0, 0, 0, tocolor(255, 255, 255, 255))
							dxDrawImage((Value.Column - 1) * 128, Value.Row * 128, 128, 128, HayTrashTexture, 0, 0, 0, tocolor(255, 255, 255, 255 * (CleanValueReverse / 100)))
						else
							dxDrawImage((Value.Column - 1) * 128, Value.Row * 128, 128, 128, "Files/Images/" .. Value.State .. ".png")
						end

						--dxDrawText(255 * (Value.Clean / z), (Value.Column - 1) * 128 + 128 / 2, Value.Row * 128 + 128 / 2, nil, nil,  tocolor(200, 200, 200, 255), 0.9, Fonts.BebasNeueRegular, "center", "top")
						--dxDrawText(CleanValueReverse, (Value.Column - 1) * 128 + 128 / 2, Value.Row * 128 + 128 / 2 + 55, nil, nil,  tocolor(200, 200, 200, 255), 0.9, Fonts.BebasNeueRegular, "center", "top")
						
						--***State Draw***--
					end

					--***New Layer***--
					if Value.New then
						if Value.New == "Hay" then
							if Value.HayClean then
								dxDrawImage((Value.Column - 1) * 128, Value.Row * 128, 128, 128, HayTexture, 0, 0, 0, tocolor(255, 255, 255, 255 * (Value.NewLevel / 100)))
							else
								local CleanValueReverse = (100 - Value.Clean) * (Value.NewLevel / 100)
								local Clean = Value.Clean * (Value.NewLevel / 100)

								dxDrawImage((Value.Column - 1) * 128, Value.Row * 128, 128, 128, HayTexture, 0, 0, 0, tocolor(255, 255, 255, 255))
								dxDrawImage((Value.Column - 1) * 128, Value.Row * 128, 128, 128, HayTrashTexture, 0, 0, 0, tocolor(255, 255, 255, 255 * (CleanValueReverse / 100)))
							end
						else
							dxDrawImage((Value.Column - 1) * 128, Value.Row * 128, 128, 128, "Files/Images/" .. Value.New .. ".png", 0, 0, 0, tocolor(255, 255, 255, 255 * (Value.NewLevel / 100)))
						end
					end
					--***New Layer***--

					--***Section Draw***--
					if SelectedBlock == Key then
						dxDrawImage((Value.Column - 1) * 128, Value.Row * 128, 128, 128, "Files/Images/Selection.png")
					end
					--***Section Draw***--

					--***State Interpolate***--
					if Value.New then
						if Value.NewState then
							
							local CurrentTick = getTickCount()
							local Progress = (CurrentTick - Value.NewTick) / HayUpTime

							Value.NewLevel = interpolateBetween(0, 0, 0, Value.NewState, 0, 0, Progress, "Linear")

							if Value.NewLevel >= 100 then
								if Value.New == "Hay" then
									if Value.HayClean then
										Value.Clean = 100
										Value.CleanLoseTick = false
										Value.CleanChanger = 100
									end
								end

								Value.State = Value.New
								Value.NewState = 0
								Value.New = false
								Value.NewTick = false

								--SaveBlocks()
							end
						end
					end
					--***State Interpolate***--

					if Value.Clean > 0 then
						if not Value.CleanLoseTick then
							Value.CleanLoseTick = getTickCount()
						end

						local CurrentTick = getTickCount()
						local Progress = (CurrentTick - Value.CleanLoseTick) / (Value.CleanLoseTime)

						Value.Clean = interpolateBetween(Value.CleanChanger, 0, 0, 0, 0, 0, Progress, "Linear")
					
						if Value.Clean == 0 then
							Value.Clean = 0
							Value.CleanLoseTick = false
						end
					end
				end
			dxSetBlendMode("blend")
			dxSetRenderTarget()
			--***FARM RENDER TARGET***--
			SelectedBlock = false
			SelectedRow = 0
			SelectedColumn = 0

			--***Cursor Selection***--
			if isCursorShowing() and not ActiveButton then
				local RelX, RelY = getCursorPosition()
				local CursorX, CursorY = RelX * ScreenX, RelY * ScreenY
				local CamX, CamY, CamZ = getCameraMatrix()

				local WorldCursorX, WorldCursorY, WorldCursorZ = getWorldFromScreenPosition(CursorX, CursorY, 1000)
				local Hit, HitX, HitY, HitZ, Element, NormalX, NormalY, NormalZ = processLineOfSight(CamX, CamY, CamZ, WorldCursorX, WorldCursorY, WorldCursorZ, true, true, false, true, true, true, false, true, localPlayer)
				local Row, Column = 0, 0

				for Key = 1, 50 do
					if Column ~= 5 then
						Column = Column + 1
					end

					if Selected3D(HitX, HitY, WorldX + (Column - 1), WorldY + Row, 1, 1) then
						SelectedBlock = Key

						SelectedRow = Row
						SelectedColumn = Column

						local DrawPosX, DrawPosY = getScreenFromWorldPosition(WorldX + (SelectedColumn - 1) + 0.5, WorldY + SelectedRow + 0.5, HitZ)

						if DrawPosX and DrawPosY then
							dxDrawRectangle(DrawPosX - 190 / 2, DrawPosY - 70 / 2, 190, 70, tocolor(25, 25, 25, 240))
							dxDrawRectangle(DrawPosX - 190 / 2 + 10, DrawPosY - 70 / 2 + 28, 190 - 20, 13, tocolor(255, 255, 255, 30))
							dxDrawRectangle(DrawPosX - 190 / 2 + 10, DrawPosY - 70 / 2 + 28, (190 - 20) * BlockData[PlayerFarm][Key].Clean / 100, 13, tocolor(104, 170, 249, 255))
							
							dxDrawText("Tisztaság:" .. BlockData[PlayerFarm][Key].Clean, DrawPosX - 190 / 2, DrawPosY - 70 / 2 + 5, DrawPosX + 190 / 2, 0, tocolor(200, 200, 200, 200), 1, Fonts.BebasNeueRegular, "center", "top")
							
							if BlockData[PlayerFarm][SelectedBlock].State ~= "Hay" then
								dxDrawText("Szalma: Nincs", DrawPosX - 190 / 2, DrawPosY - 70 / 2 + 47, DrawPosX + 190 / 2, 0, tocolor(200, 200, 200, 200), 1, Fonts.BebasNeueRegular, "center", "top")
							else
								dxDrawText("Szalma: Van", DrawPosX - 190 / 2, DrawPosY - 70 / 2 + 47, DrawPosX + 190 / 2, 0, tocolor(200, 200, 200, 200), 1, Fonts.BebasNeueRegular, "center", "top")
							end	
						end
					end

					if Column == 5 then
						Column = 0
						Row = Row + 1
					end
				end
			end
			--***Cursor Selection***--

			local ForkX, ForkY = getScreenFromWorldPosition(-25.530292129517, -365.95697021484, 6.015625953674)

			if ForkX and ForkY then
				local DistanceFromFork = getDistanceBetweenPoints3D(-25.530292129517, -365.95697021484, 5.7015625953674, getElementPosition(localPlayer))
				
				if DistanceFromFork < 1.5 then
					local ForkInUse = 0

					for Key, Value in pairs(getElementsByType("player"), getRootElement(), true) do
						if getElementDimension(Value) == getElementDimension(localPlayer) then
							if getElementData(Value, "ForkState") then
								ForkInUse = ForkInUse + 1
							end
						end
					end

					local SizeX, SizeY = 100, 45
					local PosX, PosY = ForkX - SizeX / 2, ForkY - SizeY / 2

					dxDrawRectangle(PosX, PosY, SizeX, SizeY, tocolor(35, 35, 35, 255))
					dxDrawRectangle(PosX, PosY, SizeX, 20, tocolor(0, 0, 0, 180))
					dxDrawText("Vasvilla", PosX + SizeX / 2, PosY + 20 / 2, nil, nil, tocolor(255, 255, 255, 255), 0.85, Fonts.BebasNeueRegular, "center", "center")
					dxDrawText(MaxFork - ForkInUse .. " db", PosX + SizeX / 2, PosY + 20 + 25 / 2, nil, nil, tocolor(255, 255, 255, 255), 0.95, Fonts.BebasNeueRegular, "center", "center")
				end
			end

			local ManageX, ManageY = getScreenFromWorldPosition(-23.221174240112, -365.77047729492 + 0.5, 6.015625953674 - 0.3)

			if ManageX and ManageY then
				local DistanceFromTable = getDistanceBetweenPoints3D(-23.221174240112, -365.77047729492 + 0.5, 5.5015625953674, getElementPosition(localPlayer))
			
				if DistanceFromTable < 2 then
					local Alpha = 1 - DistanceFromTable / 5
					local Distance = 1 - DistanceFromTable / 30

					if EditFarmName then
						FarmName = FarmNameInput
					else
						--FarmName = split(string.upper("Strong_Marco"), "_")
						FarmName = split(string.upper(CurrentFarmName), "_")
					end

					if PanelState == "Default" then
						local SizeX, SizeY = 150, 200
						local PosX, PosY = ManageX - SizeX / 2, ManageY - SizeY / 2
						
						dxDrawRectangle(PosX, PosY, SizeX, SizeY, tocolor(25, 25, 25, 240))
						dxDrawText("Farm Tábla:", PosX + SizeX / 2, PosY, nil, nil, tocolor(200, 200, 200, 255), 0.9, Fonts.BebasNeueRegular, "center", "top")
						dxDrawText(FarmName[1], PosX + SizeX / 2, PosY + 25, nil, nil, tocolor(200, 200, 200, 255), 1, Fonts.BebasNeueBold, "center", "top")
						dxDrawText(FarmName[2], PosX + SizeX / 2, PosY + 50, nil, nil, tocolor(200, 200, 200, 255), 1, Fonts.BebasNeueBold, "center", "top")
						
						if EditFarmName then
							local PlusX = dxGetTextWidth(FarmName[EditFarmNameState], 1, Fonts.BebasNeueBold)
							--dxDrawRectangle(PosX + SizeX / 2 + PlusX, PosY + (25 * EditFarmNameState), 2, 10)
							local LineAlpha = 255 * getEasingValue(math.abs(getTickCount() % 2500 - 1250) / 1250, "Linear")
							dxDrawText("|", PosX + SizeX / 2 + PlusX / 2, PosY + (25 * EditFarmNameState), nil, nil, tocolor(200, 200, 200, LineAlpha), 1, Fonts.BebasNeueBold, "left", "top")
						end

						if EditFarmName then
							CreateButton("DoneBoardTextChange", "Kész", PosX + 5, PosY + 200 - 35 * 3, SizeX - 10, 30, {124, 197, 118})
						else
							CreateButton("BoardTextChange", "Szerkeztés", PosX + 5, PosY + 200 - 35 * 3, SizeX - 10, 30, {124, 197, 118})
						end
						CreateButton("Permissions", "Jogosultságok", PosX + 5, PosY + 200 - 35 * 2, SizeX - 10, 30, {124, 197, 118})
						CreateButton("Animals", "Állattartás", PosX + 5, PosY + 200 - 35, SizeX - 10, 30, {104, 170, 249})
					elseif PanelState == "Animals" then
						local SizeX, SizeY = 250, 35 * 5 + 5 + 30
						local PosX, PosY = ManageX - SizeX / 2, ManageY - SizeY / 2

						dxDrawRectangle(PosX, PosY, SizeX, SizeY, tocolor(25, 25, 25, 240))
						dxDrawRectangle(PosX, PosY, SizeX, 30, tocolor(0, 0, 0, 240))
						dxDrawText("StrongMTA - Állattartás", PosX + 5, PosY + 30 / 2, nil, nil, tocolor(200, 200, 200, 255), 1, Fonts.BebasNeueRegular, "left", "center")
						dxDrawRectangle(PosX, PosY + 30 - 1, SizeX, 1, tocolor(255, 255, 255, 70))

						CreateButton("BuyAnimals", "Állatok", PosX + 5, PosY + 35, SizeX - 10, 30, {104, 170, 249})
						CreateButton("FarmAnimals", "Farm állapota", PosX + 5, PosY + 40 + 30, SizeX - 10, 30, {124, 197, 118})
						CreateButton("ResetAll", "Eszközök visszaállítása", PosX + 5, PosY + 75 + 30, SizeX - 10, 30, {124, 197, 118})
						CreateButton("Shop", "Mezőgazdasági nagyker", PosX + 5, PosY + 110 + 30, SizeX - 10, 30, {124, 180, 170})
						CreateButton("Exit", "Bezárás", PosX + 5, PosY + 145 + 30, SizeX - 10, 30, {215, 89, 89})
					elseif PanelState == "Shop" then
						if OrderedTable[PlayerFarm] then
							local SizeX, SizeY = 250, 170
							local PosX, PosY = ManageX - SizeX / 2, ManageY - SizeY / 2

							local OrderNum = 0
							local OrderName = ""

							for Key, Value in pairs(OrderedTable[PlayerFarm]) do
								OrderNum = OrderNum + 1
								OrderName = IdToName[Value.Type]
							end

							dxDrawRectangle(PosX, PosY, SizeX, SizeY, tocolor(25, 25, 25, 240))
							dxDrawRectangle(PosX, PosY, SizeX, 30, tocolor(0, 0, 0, 240))
							dxDrawText("StrongMTA - Mezőgazdasági nagyker", PosX + 5, PosY + 30 / 2, nil, nil, tocolor(200, 200, 200, 255), 1, Fonts.BebasNeueRegular, "left", "center")
							dxDrawRectangle(PosX, PosY + 30 - 1, SizeX, 1, tocolor(255, 255, 255, 70))
							dxDrawText("Jelenlegi megrendelés: " .. OrderName .. "\n" .. OrderNum, PosX + SizeX / 2, PosY + 35, nil, nil, tocolor(200, 200, 200, 255), 0.9, Fonts.BebasNeueRegular, "center", "top")

							CreateButton("CancelOrder", "Rendelés lemondása", PosX + 5, PosY + SizeY - 70, SizeX - 10, 30, {215, 89, 89})
							CreateButton("Exit", "Bezárás", PosX + 5, PosY + SizeY - 35, SizeX - 10, 30, {215, 89, 89})
						else
							local SizeX, SizeY = 250, 35 * 5 + 5 + 30
							local PosX, PosY = ManageX - SizeX / 2, ManageY - SizeY / 2

							dxDrawRectangle(PosX, PosY, SizeX, SizeY, tocolor(25, 25, 25, 240))
							dxDrawRectangle(PosX, PosY, SizeX, 30, tocolor(0, 0, 0, 240))
							dxDrawText("StrongMTA - Mezőgazdasági nagyker", PosX + 5, PosY + 30 / 2, nil, nil, tocolor(200, 200, 200, 255), 1, Fonts.BebasNeueRegular, "left", "center")
							dxDrawRectangle(PosX, PosY + 30 - 1, SizeX, 1, tocolor(255, 255, 255, 70))

							CreateButton("AnimalShop", "Állatok", PosX + 5, PosY + 35, SizeX - 10, 30, {104, 170, 249})
							CreateButton("HayShop", "Szalma", PosX + 5, PosY + 40 + 30, SizeX - 10, 30, {124, 180, 170})
							CreateButton("Feed", "Pelle táp", PosX + 5, PosY + 75 + 30, SizeX - 10, 30, {124, 197, 118})
							CreateButton("ChickenFeed", "Csirke táp", PosX + 5, PosY + 110 + 30, SizeX - 10, 30, {124, 197, 118})
							CreateButton("Exit", "Bezárás", PosX + 5, PosY + 145 + 30, SizeX - 10, 30, {215, 89, 89})
						end
					elseif PanelState == "AnimalChoose" then
						local SizeX, SizeY = 250, 35 * 5 + 5 + 30
						local PosX, PosY = ManageX - SizeX / 2, ManageY - SizeY / 2

						dxDrawRectangle(PosX, PosY, SizeX, SizeY, tocolor(25, 25, 25, 240))
						dxDrawRectangle(PosX, PosY, SizeX, 30, tocolor(0, 0, 0, 240))
						dxDrawText("StrongMTA - Mezőgazdasági nagyker", PosX + 5, PosY + 30 / 2, nil, nil, tocolor(200, 200, 200, 255), 1, Fonts.BebasNeueRegular, "left", "center")
						dxDrawRectangle(PosX, PosY + 30 - 1, SizeX, 1, tocolor(255, 255, 255, 70))

						CreateButton("Goat", "Kecske", PosX + 5, PosY + 35, SizeX - 10, 30, {124, 197, 118})
						CreateButton("Pig", "Sertés", PosX + 5, PosY + 40 + 30, SizeX - 10, 30, {124, 197, 118})
						CreateButton("Chicken", "Tyúk", PosX + 5, PosY + 75 + 30, SizeX - 10, 30, {124, 197, 118})
						CreateButton("Cow", "Tehén", PosX + 5, PosY + 110 + 30, SizeX - 10, 30, {124, 197, 118})
						CreateButton("Exit", "Bezárás", PosX + 5, PosY + 145 + 30, SizeX - 10, 30, {215, 89, 89})
					elseif PanelState == "AnimalShop" then
						local SizeX, SizeY = 450, 700
						local PosX, PosY = ScreenX / 2 - SizeX / 2, ScreenY / 2 - SizeY / 2

						local AnimalId = AnimalShopType
						local Path = GetAnimalPath(AnimalId)

						ActivatedAnimalCount = 0
						TrailerAnimalCount = 0

						for Key, Value in pairs(TempShoppingTable) do
							if AnimalCounter[AnimalId] then
								ActivatedAnimalCount = ActivatedAnimalCount + AnimalCounter[AnimalId]
							end

							TrailerAnimalCount = TrailerAnimalCount + 1
						end

						AnimalCount = 0

						for Key, Value in pairs(Animals) do
							if AnimalCounter[getElementModel(Value)] then
								AnimalCount = AnimalCount + AnimalCounter[getElementModel(Value)]
							end
						end

						TrailerMax = TrailerAnimalCount / TrailerMaxAnimal[AnimalId].Shop
						FarmMax = (ActivatedAnimalCount + AnimalCount) / MaxAnimalCount

						dxDrawRectangle(PosX, PosY, SizeX, SizeY, tocolor(0, 0, 0, 255))
						dxDrawRectangle(PosX, PosY, SizeX, 115, tocolor(25, 25, 25, 255))
						dxDrawRectangle(PosX, PosY + 115 - 1, SizeX, 1, tocolor(200, 200, 200, 60))
						dxDrawRectangle(PosX, PosY, SizeX, 30, tocolor(0, 0, 0, 240))
						dxDrawText("StrongMTA - Mezőgazdasági nagyker", PosX + 5, PosY + 30 / 2, nil, nil, tocolor(200, 200, 200, 255), 1, Fonts.BebasNeueRegular, "left", "center")
						dxDrawRectangle(PosX, PosY + 30 - 1, SizeX, 1, tocolor(200, 200, 200, 60))

						dxDrawText("Farm férőhely:", PosX + SizeX / 2, PosY + 30, nil, nil, tocolor(200, 200, 200, 255), 0.9, Fonts.BebasNeueRegular, "center", "top")
						dxDrawRectangle(PosX + 5, PosY + 55, SizeX - 10, 10, tocolor(0, 0, 0, 240))
						dxDrawRectangle(PosX + 5, PosY + 55, (SizeX - 10) * FarmMax, 10, tocolor(104, 170, 249, 255))
						
						dxDrawText("Utánfutó férőhely:", PosX + SizeX / 2, PosY + 70, nil, nil, tocolor(200, 200, 200, 255), 0.9, Fonts.BebasNeueRegular, "center", "top")
						dxDrawRectangle(PosX + 5, PosY + 95, SizeX - 10, 10, tocolor(0, 0, 0, 240))
						dxDrawRectangle(PosX + 5, PosY + 95, (SizeX - 10) * TrailerMax, 10, tocolor(124, 197, 118, 255))

						--dxDrawRectangle(PosX + 5, PosY + 95, SizeX - 10, 10, tocolor(0, 0, 0, 240))

						local OneSize = 50

						for Key, Value in pairs(AnimalBuyTable) do
							local Size =  Value.Size / AnimalsData[AnimalId].MaxSize

							dxDrawRectangle(PosX, PosY + 117 + ((Key - 1) * OneSize), SizeX, OneSize - 2, tocolor(25, 25, 25, 255))
							dxDrawRectangle(PosX, PosY + 117 + ((Key - 1) * OneSize) + OneSize - 3, SizeX, 1, tocolor(200, 200, 200, 60))
							dxDrawImage(PosX + 5, PosY + 122 + ((Key - 1) * OneSize), OneSize - 12, OneSize - 12, Path .. "/Images/" .. Value.Texture .. ".png")
							
							dxDrawText("Növekedés: ", PosX + OneSize, PosY + 122 + ((Key - 1) * OneSize), nil, nil, tocolor(200, 200, 200, 255), 0.7, Fonts.BebasNeueRegular, "left", "top")
							dxDrawRectangle(PosX + OneSize + 55, PosY + 125 + ((Key - 1) * OneSize), 120, 15, tocolor(0, 0, 0, 255))
							dxDrawRectangle(PosX + OneSize + 55, PosY + 125 + ((Key - 1) * OneSize), 120 * Size, 15, tocolor(124, 197, 118, 255))
							
							dxDrawText("Súly: ", PosX + OneSize, PosY + 112 + ((Key - 1) * OneSize) + OneSize - 3, nil, nil, tocolor(200, 200, 200, 255), 0.7, Fonts.BebasNeueRegular, "left", "bottom")
							dxDrawRectangle(PosX + OneSize + 55, PosY + 145 + ((Key - 1) * OneSize), 120, 15, tocolor(0, 0, 0, 255))
							dxDrawRectangle(PosX + OneSize + 55, PosY + 145 + ((Key - 1) * OneSize), 120 * Value.Weight / 100, 15, tocolor(124, 197, 118, 255))

							dxDrawText(FormatNumber(Value.Price, ".") .. " $", PosX + 285, PosY + 117 + ((Key - 1) * OneSize) + (OneSize - 2) / 2, nil, nil, tocolor(200, 200, 200, 255), 1, Fonts.BebasNeueRegular, "center", "center")

							if Value.Selected then
								CreateButton("RemoveBuyAnimal:" .. Key, "Eltávolítás", PosX + SizeX - 105, PosY + 127 + ((Key - 1) * OneSize), 100, (OneSize - 2) - 20, {215, 89, 89})
							else
								--local Type = AnimalBuyTable[Table].Type

								if ActivatedAnimalCount + AnimalCount >= 98 then
									dxDrawText("Nincs hely!", PosX + SizeX - 105 + 50, PosY + 127 + ((Key - 1) * OneSize) + ((OneSize - 2) - 20) / 2, nil, nil, tocolor(200, 200, 200, 255), 1, Fonts.BebasNeueRegular, "center", "center")
								elseif TrailerAnimalCount + 1 > TrailerMaxAnimal[AnimalId].Shop then
									dxDrawText("Nincs hely!", PosX + SizeX - 105 + 50, PosY + 127 + ((Key - 1) * OneSize) + ((OneSize - 2) - 20) / 2, nil, nil, tocolor(200, 200, 200, 255), 1, Fonts.BebasNeueRegular, "center", "center")
								else
									CreateButton("SelectBuyAnimal:" .. Key, "Kiválasztás", PosX + SizeX - 105, PosY + 127 + ((Key - 1) * OneSize), 100, (OneSize - 2) - 20, {124, 197, 118})
								end
							end
						end

						local AllPrice = 0

						if TempShoppingTable then
							for Key, Value in pairs(TempShoppingTable) do
								AllPrice = AllPrice + Value.Price
							end
						end

						dxDrawRectangle(PosX, PosY + 117 + ((#AnimalBuyTable) * OneSize) + 2, SizeX, 40, tocolor(25, 25, 25, 255))
						dxDrawText("Összesen: " .. FormatNumber(AllPrice, ".") .. "$", PosX + SizeX / 2, PosY + 117 + ((#AnimalBuyTable) * OneSize) + 22, nil, nil, tocolor(200, 200, 200, 255), 1, Fonts.BebasNeueRegular, "center", "center")

						if TrailerAnimalCount < 1 then
							CreateButton("Exit", "Bezárás", PosX + 5, PosY + SizeY - 35, SizeX - 10, 30, {215, 89, 89})
						else
							CreateButton("OrderAnimals", "Megrendelés", PosX + 5, PosY + SizeY - 35, (SizeX / 2) - 10 + 2.5, 30, {124, 197, 118})
							CreateButton("Exit", "Bezárás", PosX + 5 + (SizeX / 2) - 2.5, PosY + SizeY - 35, (SizeX / 2) - 10 + 2.5, 30, {215, 89, 89})
						end
					end
				end
			else
				if EditFarmName then
					EditFarmName = false
					EditFarmNameState = false
					FarmNameInput = false

					removeEventHandler("onClientCharacter", getRootElement(), InputHandler)
					removeEventHandler("onClientKey", getRootElement(), KeyHandler)
				end
			end

			if Debug then
				if ActivatedAnimalCount and FarmMax and AnimalCount then
					dxDrawRectangle(0, 0, 300, 400, tocolor(25, 25, 25))
					dxDrawRectangle(0, 0, 300, 30, tocolor(0, 0, 0))
					dxDrawText("Debug", 0, 15, nil, nil, tocolor(255, 255, 255), 1, Fonts.BebasNeueRegular, "left", "center")

					dxDrawText("Farm Max 100/" .. ActivatedAnimalCount + AnimalCount, 0, 35, nil, nil, tocolor(255, 255, 255), 1, Fonts.BebasNeueRegular)
					dxDrawText("Trailer Max 100/" .. FarmMax, 0, 60, nil, nil, tocolor(255, 255, 255), 1, Fonts.BebasNeueRegular)
				end
			end

			dxDrawImage3D(WorldX, WorldY, 4.45, 10, 1, FarmRenderTarget, tocolor(255, 255, 255, 255))
		end

		dxDrawMaterialLine3D(
			ZoneMinX + (ZoneMaxX - ZoneMinX) / 2,
			ZoneMaxY,
			ZoneZ,
			ZoneMinX + (ZoneMaxX - ZoneMinX) / 2,
			ZoneMinY,
			ZoneZ,
			Material,
			ZoneMaxX - ZoneMinX,
			tocolor(223, 181, 81),
			ZoneMinX + (ZoneMaxX - ZoneMinX) / 2,
			ZoneMaxY,
			ZoneZ + 0.5
		)
	end
)

function InputHandler(Char)
	if EditFarmName then
		local Char = string.upper(Char)

		if string.len(FarmNameInput[EditFarmNameState]) <= 10 then
			if string.find(Char, "[A-Z0-9]") or Char == " " then
				FarmNameInput[EditFarmNameState] = FarmNameInput[EditFarmNameState] .. Char

				cancelEvent()
			end
		end
	end
end

function KeyHandler(Key, State)
	if Key == "backspace" or Key == "enter" or Key == "arrow_u" or Key == "arrow_d" then
		if State then
			if EditFarmName then
				if Key == "backspace" then
					if utf8.len(FarmNameInput[EditFarmNameState]) >= 1 then
						FarmNameInput[EditFarmNameState] = utf8.sub(FarmNameInput[EditFarmNameState], 1, -2)
					end
				else
					if EditFarmNameState == 2 then
						if Key == "enter" then
						 	if utf8.len(FarmNameInput[1]) >= 1 and utf8.len(FarmNameInput[2]) >= 1 then
								CurrentFarmName = FarmNameInput[1] .. "_" .. FarmNameInput[2]
								EditFarmName = false
								EditFarmNameState = false
								FarmNameInput = false

								triggerServerEvent("UpdateFarmName", localPlayer, CurrentFarmName, PlayerFarm)

								removeEventHandler("onClientCharacter", getRootElement(), InputHandler)
								removeEventHandler("onClientKey", getRootElement(), KeyHandler)
							end
						else
							EditFarmNameState = 1
						end
					else
						EditFarmNameState = 2
					end
				end
			end
		end
	end

	if EditFarmName then
		cancelEvent()
	end
end

addEvent("SyncBlockClient", true)
addEventHandler("SyncBlockClient", getRootElement(),
	function(Player, Table, Delete, Permissions, AnimalsTable, ObjectsTable, FarmName)
		PlayerFarm = getElementDimension(Player)

		if Delete then
			for Key, Value in pairs(Sounds) do
				if isElement(Value) then
					destroyElement(Value)
				end
			end

			for Key, Value in pairs(PlayerSounds) do
				if isElement(Value) then
					destroyElement(Value)
				end
			end

			for Key, Value in pairs(ClientSideAnimals) do
				if isElement(Value) then
					destroyElement(Value)
				end
			end

			for Key, Value in pairs(ClientSideObjects) do
				if isElement(Value) then
					destroyElement(Value)
				end
			end

			ClientSideAnimals = {}
			ClientSideObjects = {}
			PlayerInFarm = false
			BlockData[PlayerFarm] = nil
			PermissionTable = {}
			OrderedTable[PlayerFarm] = nil
			ObjectsData = nil
			CurrentFarmName = false
			AnimalDoorEffect = nil

			engineRestoreModel(AnimalFarmDoorID)
		else
			CurrentFarmName = FarmName

			engineImportTXD(engineLoadTXD("Files/Models/AnimalDoor.txd", true), AnimalFarmDoorID)
			engineReplaceModel(engineLoadDFF("Files/Models/AnimalDoor.dff"), AnimalFarmDoorID)
			engineReplaceCOL(engineLoadCOL("Files/Models/AnimalDoor.col"), AnimalFarmDoorID)

			AnimalFarmDoor = createObject(AnimalFarmDoorID, -25.059608459473 - 0.3, -365.09127807617, 5.5015625953674 - 0.4)
			table.insert(ClientSideObjects, AnimalFarmDoor)

			IronFork = createObject(ForkModelID, -25.530292129517, -365.95697021484, 5.7015625953674)
			setElementRotation(IronFork, 180, 190, 0)
			table.insert(ClientSideObjects, IronFork)

			FarmInterior = createObject(InteriorModelID, WorldX + 3.1 - 0.60, WorldY + 3.45, 4.4)
			table.insert(ClientSideObjects, FarmInterior)
			
			AnimalDoorEffect = {
				MovementDirection = 0,
				SoundEffectTick = 0,
				SoundEffectType = 0,
			}

			OrderedTable[PlayerFarm] = getElementData(ShopPed, OrderData .. PlayerFarm)
			LastGetAnimalTable = 0
			PlayerInFarm = true

			if ObjectsTable then
				ObjectsData = ObjectsTable

				if ObjectsTable.Bale then
					for Key, Value in pairs(ObjectsData.Bale) do
						if Value > 0.005 then
							local Bale = createObject(BaleModelID, -21.078706741333, -365.92883300781, 4.5015625953674 + (Key - 1) * 0.45)

							table.insert(ClientSideObjects, Bale)
							setObjectScale(Bale, 1, 1, Value / 100)
						end
					end
				end
			end

			for Key, Value in pairs(ClientSideObjects) do
				if isElement(Value) then
					setElementDimension(Value, PlayerFarm)
				end
			end

			if AnimalsTable then
				AnimalsDataTable = AnimalsTable

				for Key, Value in pairs(AnimalsTable) do
					local RandomPos = RandomPedPos[math.random(1, #RandomPedPos)]

					local Animal = createPed(Value.Type, unpack(RandomPos))
					setElementDimension(Animal, PlayerFarm)
					setElementData(Animal, "Farm.Animal.Id", Key)
					setElementData(Animal, "Farm.Animal.Texture", Value.Texture)
					AnimalSize[Animal] = Value.Size
					setElementData(Animal, "AnimalSize", Value.Size)

					RemoveTexture(Animal)
					ApplyTexture(Animal, Value.Size)
					table.insert(ClientSideAnimals, Animal)

					for Key2, Value2 in pairs(ClientSideAnimals) do
						setElementCollidableWith(Animal, Value2, false)
					end

					setElementCollidableWith(Animal, localPlayer, false)
				end
			end

			if Table then
				for Key, Value in pairs(Table) do
					if Value.Clean > 0 or Value.CleanChanger > 0 then
						Value.CleanChanger = Value.Clean
						Value.CleanLoseTick = getTickCount()
					end

					if Value.Clean < 0 then
						Value.Clean = 0
						Value.CleanChanger = 0
					end
				end

				BlockData[PlayerFarm] = Table
			else
				BlockData[PlayerFarm] = GenerateDefault()
				print("GenerateDefault")
			end

			PermissionTable = Permissions
		end
	end
)

addEventHandler("onClientMarkerHit", getRootElement(),
	function(Entity)
		local Source = source

		if Entity == localPlayer and getElementData(Source, "Farm.Marker") then
			if getElementDimension(Source) == getElementDimension(localPlayer) then
				MarkerHit = Source

				bindKey("e", "down", EnterFarm)
				bindKey("k", "down", LockFarm)
			end
		end

		if Entity == localPlayer then
			local Vehicle = getPedOccupiedVehicle(Entity)

			if Vehicle then
				local Trailer = getVehicleTowedByVehicle(Vehicle)

				if getElementData(Source, "Marker.Trailer") == Trailer then
					local FarmID = getElementData(Source, "Marker.FarmID")

					if FarmID then
						local TrailerData = getElementData(Trailer, "TrailerTable") or false

						if TrailerData then
							for Key, Value in pairs(TrailerData) do
								triggerServerEvent("CreateFarmAnimal", localPlayer, FarmID, {
									Type = Value.Type,
									Size = Value.Size,
									Texture = Value.Texture
								})
							end
							destroyElement(Source)

							if isElement(PlayerSetBlip) then
								destroyElement(PlayerSetBlip)
							end

							for Key, Value in pairs(TrailerAnimals[Trailer]) do
								RemoveTexture(Value)

								destroyElement(Value)
							end

							TrailerAnimals[Trailer] = nil
							setElementData(Trailer, "TrailerTable", nil)
						end
					end
				end
			end
		end
	end
)

addEventHandler("onClientMarkerLeave", getRootElement(),
	function(Player)
		if Player == localPlayer then
			if source == MarkerHit then
				MarkerHit = nil

				unbindKey("e", "down", EnterFarm)
				unbindKey("k", "down", LockFarm)
			end
		end
	end
)

addEvent("SyncBaleStateClient")
addEventHandler("SyncBaleStateClient", getRootElement(),
	function(Player, State)
		
	end
)

addEvent("SyncNewStateClient", true)
addEventHandler("SyncNewStateClient", getRootElement(),
	function(SelectedBlock, Type, Player)
		if Type == "Hay" or Type == "Land" then
			BlockData[PlayerFarm][SelectedBlock].NewTick = getTickCount()
			BlockData[PlayerFarm][SelectedBlock].New = Type
			BlockData[PlayerFarm][SelectedBlock].NewState = 100

			if Type == "Hay" then
				local PlayerHay = getElementData(Player, "HayClean")

				if PlayerHay ~= 100 then
					BlockData[PlayerFarm][SelectedBlock].Clean = PlayerHay
					BlockData[PlayerFarm][SelectedBlock].CleanChanger = PlayerHay
					BlockData[PlayerFarm][SelectedBlock].CleanLoseTick = false
					BlockData[PlayerFarm][SelectedBlock].HayClean = false
				else
					BlockData[PlayerFarm][SelectedBlock].HayClean = true
				end
			end

			setTimer(function()
				BlockData[PlayerFarm][SelectedBlock].CleanLoseTime = CleanLoseTime
				BlockData[PlayerFarm][SelectedBlock].CleanChanger = BlockData[PlayerFarm][SelectedBlock].Clean
				BlockData[PlayerFarm][SelectedBlock].CleanLoseTick = getTickCount()

				if Player == localPlayer then
					triggerServerEvent("SaveBlockServer", localPlayer, BlockData[PlayerFarm], PlayerFarm, SelectedBlock, Type)
				end
			end, HayUpTime + 100, 1)
		end
	end
)

function GenerateDefault()
	local TempTable = {}
	local Row, Column = 0, 0

	for Key = 1, 50 do
		if Column ~= 5 then
			Column = Column + 1
		end

		table.insert(TempTable, {
			State = "Land",
			New = false,
			NewTick = false,
			NewState = 0,
			NewLevel = 0,
			Clean = 100,
			CleanLoseTick = false,
			CleanChanger = 100,
			Row = Row,
			Column = Column,
			HayClean = true,
			CleanLoseTime = CleanLoseTime
		})

		if Column == 5 then
			Column = 0
			Row = Row + 1
		end
	end

	return TempTable
end

function EnterFarm()
	if isElement(MarkerHit) then
		if not getPedOccupiedVehicle(localPlayer) then
			if getElementData(MarkerHit, "Farm.Owner") > 0 then
				if getElementData(MarkerHit, "Farm.Locked") == 0 then
					if getElementData(MarkerHit, "Farm.Dimension") == 0 then
						print("exit")
					end

					triggerServerEvent("EnterFarm", localPlayer, MarkerHit)
				end
			end
		end
	end
end

function LockFarm()
	print("Hamaorsan")
end

function dxDrawImage3D(x, y, z, width, height, material, color, rotation, ... )
  	return dxDrawMaterialLine3D(x+2.5, y, z, x+2.5, y+width, z + tonumber( rotation or 0 ), material, -5, color or 0xFFFFFFFF, -8.927734375, -367.939453125,10000)
end

function Selected3D(HitPosX, HitPosY, WorldX, WorldY, WorldW, WorldH)
	if (HitPosX >= WorldX and HitPosX <= WorldX + WorldW and HitPosY >= WorldY and HitPosY <= WorldY + WorldH) then
		return true
	end

	return false
end

addEventHandler("onClientElementDataChange", getRootElement(),
	function(Key, Old, New)
		local Source = source

		if Source and isElement(Source) and isElementStreamedIn(Source) then
			if Key == "Farm.PedWalking" then
				PedWalking[Source] = New
			end

			if Key == "AnimalSize" then
				RemoveTexture(Source)
				AnimalSize[Source] = New

				ApplyTexture(Source, New)
			end
		end

		if getElementType(Source) == "player" and isElementStreamedIn(Source) then
			if Key == "ForkState" then
				if New then
					ToggleFork(Source, true)
				else
					ToggleFork(Source, false)
				end
			end

			if Key == "HayLevel" then
				if New and getElementData(Source, "ForkState") then
					if isElement(IronForks[Source]) then
						if not HayAnim[Source] then
							HayAnim[Source] = {}
						end

						if not isElement(ForkHayObject[Source]) and Old == 0 and New == 4 then
							ForkHayObject[Source] = createObject(HayModelID, getElementPosition(localPlayer))
							setElementDimension(ForkHayObject[Source], getElementDimension(Source))
							setElementCollisionsEnabled(ForkHayObject[Source], false)

							attachElements(ForkHayObject[Source], IronForks[Source], 0, 0, -1)

							setObjectScale(ForkHayObject[Source], 0.015)

							HayAnim[Source] = {getTickCount(), 0.015, 0.7, ForkHayObject[Source]}
							UseForkHay[Source] = true
						else
							if Old > 1 and New == 0 then
								HayAnim[Source] = {getTickCount(), 0.7, 0, ForkHayObject[Source]}
								UseForkHay[Source] = true
							else
								if not isElement(ForkHayObject[Source]) then
									ForkHayObject[Source] = createObject(HayModelID, getElementPosition(localPlayer))
									setElementDimension(ForkHayObject[Source], getElementDimension(Source))
									setElementCollisionsEnabled(ForkHayObject[Source], false)

									attachElements(ForkHayObject[Source], IronForks[Source], 0, 0, -1)

									setObjectScale(ForkHayObject[Source], 0.015)
								end
								
								local Scale = getObjectScale(ForkHayObject[Source])

								if New < Old then
									HayAnim[Source] = {getTickCount(), Scale, Scale - (0.7 / 4), ForkHayObject[Source]}
								else
									HayAnim[Source] = {getTickCount(), Scale, Scale + (0.7 / 4), ForkHayObject[Source]}
								end
								
								UseForkHay[Source] = true
							end
						end
					end
				end
			end
		end
	end
)

function GetFarmAnimals(FarmID)
	local TempTable = {}

	for Key, Value in pairs(getElementsByType("ped", resourceRoot, true)) do
		local AnimalFarm = getElementDimension(Value)

		if AnimalFarm == FarmID then
			table.insert(TempTable, Value)
		end
	end

	return TempTable
end

addEventHandler("onClientPedsProcessed", getRootElement(),
	function()
		for Player, ForkObject in pairs(IronForks) do
			if isElement(ForkObject) and isElement(Player) then
				local PitchforkX, PitchforkY, PitchforkZ = getElementPosition(ForkObject)
				local RightHandX, RightHandY, RightHandZ = getElementBonePosition(Player, 24)
				local LeftHandX, LeftHandY, LeftHandZ = getElementBonePosition(Player, 34)

				if Debug then
					DrawDebugAxes(PitchforkX, PitchforkY, PitchforkZ)
					DrawDebugAxes(RightHandX, RightHandY, RightHandZ)
					DrawDebugAxes(LeftHandX, LeftHandY, LeftHandZ)
				end

				local TargetDistance = getDistanceBetweenPoints2D(RightHandX, RightHandY, LeftHandX, LeftHandY)
				local TargetYaw = GetRadianAngleBetweenPoints(LeftHandX, LeftHandY, RightHandX, RightHandY)
				local TargetPitch = GetRadianAngleBetweenPoints(LeftHandZ, TargetDistance, RightHandZ, 0)

				TargetYaw = math.deg(TargetYaw)
				TargetPitch = math.deg(TargetPitch)

				if Debug then
					dxDrawText("TargetYaw : " .. TargetYaw, 400, 200)
					dxDrawText("TargetPitch : " .. TargetPitch, 400, 220)
				end

				setElementPosition(ForkObject, RightHandX, RightHandY, RightHandZ)
				setElementRotation(ForkObject, 0, 90 - TargetPitch, TargetYaw + 270)
			end
		end
	end
)

function GetRadianAngleBetweenPoints(x1, y1, x2, y2)
	local x = x2 - x1
	local y = y2 - y1

	if y == 0 then
		y = 0.0001
	end

	if x > 0 then
		if y > 0 then
			return math.pi - math.atan2(x / y, 1)
		else
			return -math.atan2(x / y, 1)
		end
	else
		if y > 0 then
			return -(math.pi + math.atan2(x / y, 1))
		else
			return -math.atan2(x / y, 1)
		end
	end
end

function DrawDebugAxes(x, y, z)
	dxDrawLine3D(x - 0.1, y, z, x + 0.1, y, z, 0xFFFFFFFF, 2, false)
	dxDrawLine3D(x, y - 0.1, z, x, y + 0.1, z, 0xFFFFFFFF, 2, false)
	dxDrawLine3D(x, y, z - 0.1, x, y, z + 0.1, 0xFFFFFFFF, 2, false)
end

function ToggleFork(Player, State)
	if State then
		setPedWalkingStyle(Player, 60)
		engineReplaceAnimation(Player, "ped", "IDLE_armed", "pitchfork_idle", "IDLE_armed")
		engineReplaceAnimation(Player, "ped", "WALK_armed", "pitchfork_walk", "WALK_armed")
		engineReplaceAnimation(localPlayer, "ped", "WALK_start_armed", "pitchfork_start", "WALK_start_armed")
	else
		-- setPedWalkingStyle(localPlayer, getElementData(localPlayer, "walkingStyle"))
		setPedWalkingStyle(Player, 118)
		engineRestoreAnimation(Player, "ped", "IDLE_armed")
		engineRestoreAnimation(Player, "ped", "WALK_armed")
		engineRestoreAnimation(Player, "ped", "WALK_start_armed")
	end

	if State then
		IronForks[Player] = createObject(ForkModelID, 0, 0, 0)

		if isElement(IronForks[Player]) then
			setElementCollisionsEnabled(IronForks[Player], false)
		end

		setElementDimension(IronForks[Player], getElementDimension(Player))
	else
		if isElement(IronForks[Player]) then
			destroyElement(IronForks[Player])
		end

		IronForks[Player] = nil
	end
end

function GetAnimalsIdTable()
	local TempTable = {}

	for Key, Value in pairs(getElementsByType("ped", resourceRoot, true)) do
		local PedModel = getElementModel(Value)

		if PedModel then
			table.insert(TempTable, PedModel)
		end
	end

	return TempTable
end

addCommandHandler("drophay",
	function()
		triggerServerEvent("SyncAnimations", localPlayer, localPlayer, PlayerFarm, "ForkDown")
		setElementData(localPlayer, "HayClean", false)
		setElementData(localPlayer, "HayLevel", 0)
		print("drop hay")
	end
)

setElementData(localPlayer, "HayClean", false)
setElementData(localPlayer, "ForkState", false)
setElementData(localPlayer, "HayLevel", 0)

addEventHandler("onClientClick", getRootElement(),
	function(Key, State, Cx, Cy, Wx, Wy, Wz, Entity)
		if State == "down" then
			if Entity then
				if getElementType(Entity) == "ped" and Key == "right" then
					if getElementData(Entity, "Farm.Ped.Shop") then
						FarmOrders = getElementData(Entity, OrderData .. CallPlayerFarm)
						ShopState = true

						print("asd")
					end
				elseif getElementType(Entity) == "object" and Key == "left" then
					if getElementModel(Entity) == BaleModelID then
						if getElementData(localPlayer, "ForkState") then
							local PlayerHayLevel = getElementData(localPlayer, "HayLevel") or 0
							local BaleNum = 0

							for Key, Value in pairs(ClientSideObjects) do
								if Value and isElement(Value) and getElementModel(Value) == BaleModelID then
									SelectedBale = Value
									BaleNum = BaleNum + 1
								end
							end

							local _, _, SelectedBaleScaleZ = getObjectScale(SelectedBale) 
							--UseBaleBlock = true

							if PlayerHayLevel == 0 then
								print(SelectedBaleScaleZ)

								--SelectedBaleAnim = {getTickCount(), SelectedBaleScaleZ, SelectedBaleScaleZ - 0.2}

								triggerServerEvent("SyncAnimations", localPlayer, localPlayer, PlayerFarm, "ForkUp", {SelectedBaleScaleZ, SelectedBaleScaleZ - 0.2, PlayerHayLevel})
								setElementData(localPlayer, "HayClean", 100)
								setElementData(localPlayer, "HayLevel", 4)

								triggerServerEvent("SyncBaleState", localPlayer, PlayerFarm, BaleNum, SelectedBaleScaleZ - 0.2)
							else
								if getElementData(localPlayer, "HayClean") == 100 then
									if SelectedBaleScaleZ >= 0.98 then
										BaleNum = BaleNum + 1
									end

									local PlusLevel = 0.05 * PlayerHayLevel
									--SelectedBaleAnim = {getTickCount(), SelectedBaleScaleZ, SelectedBaleScaleZ + PlusLevel}
									triggerServerEvent("SyncAnimations", localPlayer, localPlayer, PlayerFarm, "ForkDown", {SelectedBaleScaleZ, SelectedBaleScaleZ + PlusLevel, PlayerHayLevel})
									setElementData(localPlayer, "HayClean", false)
									setElementData(localPlayer, "HayLevel", 0)

									triggerServerEvent("SyncBaleState", localPlayer, PlayerFarm, BaleNum, SelectedBaleScaleZ + PlusLevel)
								end
							end
						else
							print(" nincs villa")
						end
					end
				elseif getElementType(Entity) == "object" and Key == "right" then
					if getElementModel(Entity) == ForkModelID then
						local DistanceFromFork = getDistanceBetweenPoints3D(-25.530292129517, -365.95697021484, 5.7015625953674, getElementPosition(localPlayer))
				
						if DistanceFromFork < 1.5 then
							local ForkInUse = 0

							for Key, Value in pairs(getElementsByType("player"), getRootElement(), true) do
								if getElementDimension(Value) == getElementDimension(localPlayer) then
									if getElementData(Value, "ForkState") then
										ForkInUse = ForkInUse + 1
									end
								end
							end

							--if ForkInUse < 2 and getElementData(localPlayer, "ForkState") then
								if getElementData(localPlayer, "ForkState") then
									if getElementData(localPlayer, "HayClean") ~= 0 or getElementData(localPlayer, "HayClean") == false then
										if getElementData(localPlayer, "HayLevel") == 0 then
											setElementData(localPlayer, "ForkState", false)
										end
									end
								else
									setElementData(localPlayer, "ForkState", true)
									setElementData(localPlayer, "HayClean", false)
								end
							--end
						end
					end
				end
			end
		end

		if Key == "left" and State == "down" then
			if ActiveButton then
				OldActiveButton = ActiveButton

				if ActiveButton == "Animals" then
					if not EditFarmName then
						PanelState = ActiveButton
					end
				elseif ActiveButton == "Permissions" then
					if not EditFarmName then

					end
				elseif ActiveButton == "Exit" then
					PanelState = "Default"
				elseif ActiveButton == "Shop" then
					PanelState = ActiveButton
				elseif ActiveButton == "AnimalShop" then
					TempShoppingTable = {}
					AnimalBuyTable = {}

					PanelState = "AnimalChoose"
				elseif string.find(ActiveButton, "SelectBuyAnimal") then
					local Table = tonumber(gettok(ActiveButton, 2, ":"))
					local Type = AnimalBuyTable[Table].Type

					if ActivatedAnimalCount + AnimalCount + AnimalBuyTable[Table].Count > 100 then
						print("Nincs hely a farmban")

					elseif TrailerAnimalCount + 1 > TrailerMaxAnimal[Type].Shop then
						print("Nincs hely a futon")
					else
						local AnimalId = 1

						TempShoppingTable[Table] = AnimalBuyTable[Table]
						AnimalBuyTable[Table].Selected = true
					end
				elseif string.find(ActiveButton, "RemoveBuyAnimal") then
					local Table = tonumber(gettok(ActiveButton, 2, ":"))

					TempShoppingTable[Table] = nil
					AnimalBuyTable[Table].Selected = false
				elseif ActiveButton == "OrderAnimals" then
					OrderedTable[PlayerFarm] = TempShoppingTable
					triggerServerEvent("SetPedOrderTable", localPlayer, TempShoppingTable, PlayerFarm)

					TempShoppingTable = {}
					AnimalBuyTable = {}
					PanelState = "Shop"
				elseif ActiveButton == "CancelOrder" then
					triggerServerEvent("SetPedOrderTable", localPlayer, TempShoppingTable, PlayerFarm)
					OrderedTable[PlayerFarm] = nil
					PanelState = "Default"
				elseif ActiveButton == "Cow" or ActiveButton == "Chicken" or ActiveButton == "Pig" or ActiveButton == "Goat" then
					local AnimalType = NameToID(ActiveButton)

					for Key = 1, 10 do
						local SizeRandom = math.random(1, 10) / 50
						local Price = AnimalsData[AnimalType].MinPrice
						local RandomPrice = AnimalsData[AnimalType].MinPrice * SizeRandom
						local RandomPrice = math.floor(RandomPrice + Price)

						table.insert(AnimalBuyTable, {
							Texture = math.random(1, AnimalsData[AnimalType].Textures), 
							Size = SizeRandom,
							Weight = math.random(1, 100),
							Price = RandomPrice,
							Selected = false,
							Count = AnimalCounter[AnimalType],
							Type = AnimalType,
							Marker = getElementData(localPlayer, "Player.InFarm.AddMarkerPos"),
							FarmID = PlayerFarm
						})

						AnimalShopType = AnimalType
						PanelState = "AnimalShop"
					end
				elseif ActiveButton == "TrailerCheck" then
					local Trailers = getElementsWithinColShape(TrailerCol, "vehicle")
					SelectedTrailer = false

					for Key, Value in pairs(Trailers) do
						if getElementModel(Value) == 611 then
							SelectedTrailer = Value
							break
						end
					end

					if SelectedTrailer then
						ShopState = ActiveButton
					else
						print("nincs trailer")
					end
				elseif ActiveButton == "BuyOrder" then
					ShopState = false

					if SelectedTrailer then
						local MarkerX, MarkerY, MarkerZ = false, false, false

						for Key, Value in pairs(FarmOrders) do
							if Value.Marker then
								MarkerX, MarkerY, MarkerZ = unpack(Value.Marker)
							end

							TrailerFarmID = Value.FarmID

							if not TrailerAnimals[SelectedTrailer] then
								TrailerAnimals[SelectedTrailer] = {}
							end

							TrailerAnimals[SelectedTrailer][Key] = createPed(Value.Type, getElementPosition(SelectedTrailer))
							local RotpX, RotpY, RotpZ = getElementRotation(TrailerAnimals[SelectedTrailer][Key])
							local RotvX, RotvY, RotvZ = getElementRotation(SelectedTrailer)
							
							local RotX = RotpX - RotvX
							local RotY = RotpY - RotvY
							local RotZ = RotpZ - RotvZ
							
							attachElements(TrailerAnimals[SelectedTrailer][Key], SelectedTrailer, 0, 0, 1, RotX, RotY, RotZ)
							AnimalsRot[TrailerAnimals[SelectedTrailer][Key]] = RotZ
							setElementData(TrailerAnimals[SelectedTrailer][Key], "Farm.Animal.Texture", Value.Texture)
							ApplyTexture(TrailerAnimals[SelectedTrailer][Key], Value.Size)
							setElementData(TrailerAnimals[SelectedTrailer][Key], "AnimalSize", Value.Size + AnimalsData[Value.Type].MinSize)
							AnimalSize[TrailerAnimals[SelectedTrailer][Key]] = Value.Size

							--print(Value.Size)
						end

						if MarkerX then
							PlayerSetMarker = createMarker(MarkerX, MarkerY, MarkerZ, "cylinder", 4, 124, 197, 118, 180)
							PlayerSetBlip = createBlip(MarkerX, MarkerY, MarkerZ)
							setElementData(PlayerSetMarker, "Marker.Trailer", SelectedTrailer)
							setElementData(PlayerSetMarker, "Marker.FarmID", TrailerFarmID)
							setElementData(SelectedTrailer, "TrailerTable", FarmOrders)
						end

						triggerServerEvent("SetPedOrderTable", localPlayer, false, TrailerFarmID)

						SelectedTrailer = false
					end
				elseif ActiveButton == "ExitShop" then
					ShopState = false
				elseif ActiveButton == "BoardTextChange" then
					addEventHandler("onClientCharacter", getRootElement(), InputHandler)
					addEventHandler("onClientKey", getRootElement(), KeyHandler)

					EditFarmName = true
					EditFarmNameState = 1
					FarmNameInput = FarmName
				elseif ActiveButton == "DoneBoardTextChange" then
					if utf8.len(FarmNameInput[EditFarmNameState]) >= 1 then
						removeEventHandler("onClientCharacter", getRootElement(), InputHandler)
						removeEventHandler("onClientKey", getRootElement(), KeyHandler)

						CurrentFarmName = FarmNameInput[1] .. "_" .. FarmNameInput[2]
						EditFarmName = false
						EditFarmNameState = false
						FarmNameInput = false

						triggerServerEvent("UpdateFarmName", localPlayer, CurrentFarmName, PlayerFarm)
					end
				end

				setTimer(function()
					ColorSwitches[OldActiveButton] = false
					LastColorSwitches[OldActiveButton] = false
					StartColorSwitch[OldActiveButton] = false
					LastColorConcat[OldActiveButton] = false
				end, 500, 1)
			end

			if SelectedBlock and SelectedBlock > 0 then
				print("asd")
				local State = BlockData[PlayerFarm][SelectedBlock].State
				if BlockData[PlayerFarm][SelectedBlock].New then
					return print("muveles alatt!")
				end

				local PlayerHay = getElementData(localPlayer, "HayClean")
				local PlayerHayLevel = getElementData(localPlayer, "HayLevel")

				local Rotation = isPlayerFacingToElement(localPlayer)

				if getElementData(localPlayer, "ForkState") then
					if State == "Land" then
						if PlayerHay and PlayerHayLevel > 0 then
							triggerServerEvent("SyncAnimations", localPlayer, localPlayer, PlayerFarm, "ForkDown")
							triggerServerEvent("SyncNewStateServer", localPlayer, SelectedBlock, "Hay", localPlayer, PlayerFarm)

							setElementData(localPlayer, "HayLevel", PlayerHayLevel - 1)

							setElementRotation(localPlayer, 0, 0, Rotation)
						else
							print("nincs nalad szalma")
						end
					elseif State == "Hay" then
						if PlayerHayLevel < 4 then
							triggerServerEvent("SyncAnimations", localPlayer, localPlayer, PlayerFarm, "ForkUp")
							triggerServerEvent("SyncNewStateServer", localPlayer, SelectedBlock, "Land", localPlayer, PlayerFarm)

							local HayClean = getElementData(localPlayer, "HayClean")

							if type(HayClean) == "number" then
								setElementData(localPlayer, "HayClean", (HayClean + BlockData[PlayerFarm][SelectedBlock].Clean) / 2)
							else
								setElementData(localPlayer, "HayClean", BlockData[PlayerFarm][SelectedBlock].Clean)
							end

							setElementData(localPlayer, "HayLevel", PlayerHayLevel + 1)

							print(getElementData(localPlayer, "HayClean"))

							setElementRotation(localPlayer, 0, 0, Rotation)
						end
					end	
				else
					print("Nincs nálad villa")	
				end	
			end
		end
	end
)

function GetPositionFromElementOffset(element, x, y, z)
    if element then
        m = getElementMatrix(element)
        return x * m[1][1] + y * m[2][1] + z * m[3][1] + m[4][1], x * m[1][2] + y * m[2][2] + z * m[3][2] + m[4][2], x * m[1][3] + y * m[2][3] + z * m[3][3] + m[4][3]
    end
end

function IsSoundFinished(Sound)
	if isElement(Sound) then
		return (getSoundPosition(Sound) == getSoundLength(Sound))
	else
		return true
	end
end

function GetAnimalPath(AnimalID)
	if AnimalsData[AnimalID] and AnimalsData[AnimalID].Path then
		return AnimalsData[AnimalID].Path
	end
end

function SetPedCustomAnim(Player, Type, Bale)
	if not Type then
		setPedWalkingStyle(Player, 118)
		setPedAnimation(Player)
	else
		setPedWalkingStyle(Player, 60)
	end
	
	if Type == "Bucket" then
		engineReplaceAnimation(Player, "ped", "IDLE_armed", "Files/Animations/Bucket_Idle", "IDLE_armed")
		engineReplaceAnimation(Player, "ped", "WALK_start_armed", "Files/Animations/Bucket_Start", "WALK_armed")
		engineReplaceAnimation(Player, "ped", "WALK_armed", "Files/Animations/Bucket_Walk", "WALK_armed")
	elseif Type == "Fork" then
		engineReplaceAnimation(Player, "ped", "IDLE_armed", "Files/Animations/Fork_Idle", "IDLE_armed")
		engineReplaceAnimation(Player, "ped", "WALK_start_armed", "Files/Animations/Fork_Start", "WALK_start_armed")
		engineReplaceAnimation(Player, "ped", "WALK_armed", "Files/Animations/Fork_Walk", "WALK_armed")
	elseif Type == "Barrow" then
		engineReplaceAnimation(Player, "ped", "IDLE_armed", "Files/Animations/Barrow_Idle", "IDLE_armed")
		engineReplaceAnimation(Player, "ped", "WALK_start_armed", "Files/Animations/Barrow_Start", "WALK_start")
		engineReplaceAnimation(Player, "ped", "WALK_armed", "Files/Animations/Barrow_Walk", "WALK_civi")
	elseif Type == "BarrowCover" then
		setPedAnimation(Player, "Files/Animations/Barrow_Cover", "IDLE_armed")
	elseif Type == "BucketCover" then
		setPedAnimation(Player, "Files/Animations/Bucket_Cover", "IDLE_armed")
	elseif Type == "ForkDown" then
		PlayFarmWorkSound(Player, "Files/Sounds/Hay.mp3")
		setPedAnimation(Player, "Files/Animations/Fork_Down", "M_smk_in", HayDownTime, false, true, false)

		setTimer(function()
				setPedAnimation(Player)
			end, HayDownTime, 1
		)
	elseif Type == "ForkUp" then
		PlayFarmWorkSound(Player, "Files/Sounds/HayUp.mp3")
		setPedAnimation(Player, "Files/Animations/Fork_Up", "M_smk_in", HayUpTime, false, true, false)

		setTimer(function()
				setPedAnimation(Player)
			end, HayUpTime, 1
		)
	end

	if Bale and Bale[1] and Bale[2] and Bale[3] then
		local BaleNum = 0
		SelectedBale = false

		for Key, Value in pairs(ClientSideObjects) do
			if Value and isElement(Value) and getElementModel(Value) == BaleModelID then
				SelectedBale = Value
				BaleNum = BaleNum + 1
			end
		end

		UseBaleBlock = true
		local _, _, Scale = getObjectScale(SelectedBale)

		if Scale >= 0.98 and Bale[2] > Bale[1] then
			local PlayerHayLevel = getElementData(Player, "HayLevel") or 0

			local BaleObject = createObject(BaleModelID, -21.078706741333, -365.92883300781, 4.5015625953674 + (BaleNum) * 0.45)

			table.insert(ClientSideObjects, BaleObject)
			setObjectScale(BaleObject, 1, 1, 0.025)
			setElementDimension(BaleObject, getElementDimension(Player))
			SelectedBale = BaleObject

			local FinishSize = 0.05 * Bale[3]
			print(Bale[3])
			SelectedBaleAnim = {getTickCount(), 0.025, FinishSize - 0.025}

			print(FinishSize)
		else
			SelectedBaleAnim = {getTickCount(), Bale[1], Bale[2]}
		end
	end
end
addEvent("SyncAnimToClient", true)
addEventHandler("SyncAnimToClient", getRootElement(), SetPedCustomAnim)

function PlayFarmWorkSound(Entity, Path)
	if isElement(PlayerSounds[Entity]) then
		destroyElement(PlayerSounds[Entity])
	end

	PlayerSounds[Entity] = playSound3D(Path, getElementPosition(Entity))
	setElementDimension(PlayerSounds[Entity], getElementDimension(Entity))
end

function isPlayerFacingToElement(playerElement)
	local targetPosX, targetPosY = WorldX + (SelectedColumn - 1) + 0.5, WorldY + SelectedRow + 0.5
	local playerPosX, playerPosY = getElementPosition(playerElement)
	
	if getDistanceBetweenPoints2D(playerPosX, playerPosY, targetPosX, targetPosY) < 1.5 then
		local curRotZ = select(3, getElementRotation(playerElement))
		local newRotZ = -math.deg(math.atan2(targetPosX - playerPosX, targetPosY - playerPosY))

		if newRotZ < 0 then
			newRotZ = newRotZ + 360
		elseif newRotZ > 360 then
			newRotZ = newRotZ - 360
		end

		return newRotZ
	end
end

function FindRot(PosX, PosY, Pos2X, Pos2Y)
	local Target = - math.deg(math.atan2(Pos2X - PosX, Pos2Y - PosY))

	return Target < 0 and Target + 360 or Target
end

function RemoveTexture(Animal)
	if isElement(Shaders[Animal]) then
		destroyElement(Shaders[Animal])
	end

	if isElement(Textures[Animal]) then
		destroyElement(Textures[Animal])
	end

	Shaders[Animal] = nil
	Textures[Animal] = nil
end

function CreateAnimalsTexture()
	for AnimalId, AnimalTable in pairs(AnimalsData) do
		for Key = 1, AnimalTable.Textures do
			local AnimalsPath = GetAnimalPath(AnimalId)

			if not AnimalTextures[AnimalId] then
				AnimalTextures[AnimalId] = {}
			end

			AnimalTextures[AnimalId][Key] = dxCreateTexture(AnimalsPath .. "/Textures/" .. Key .. ".png", "dxt1")
		end
	end
end
addEventHandler("onClientResourceStart", resourceRoot, CreateAnimalsTexture)

function ApplyTexture(Animal, Size)
	local TextureID = getElementData(Animal, "Farm.Animal.Texture") or 0

	if TextureID > 0 then
		local Model = getElementModel(Animal)
		local AnimalsPath = GetAnimalPath(Model)

		if not Shaders[Animal] then
			Shaders[Animal] = dxCreateShader("Files/Shaders/Ped.fx", 0, 0, false, "ped")
		end

		local Texture = AnimalTextures[Model][TextureID]

		if Shaders[Animal] and Texture then
			dxSetShaderValue(Shaders[Animal], "gTexture", Texture)
			dxSetShaderValue(Shaders[Animal], "size", Size)
			engineApplyShaderToWorldTexture(Shaders[Animal], AnimalsData[Model].Remap, Animal)
		end
	end
end

addEventHandler("onClientElementStreamIn", resourceRoot,
	function()
		local Source = source

		if getElementType(Source) == "ped" then
			local Size = getElementData(Source, "AnimalSize") or 1

			ApplyTexture(Source, Size)
		elseif getElementType(Source) == "object" then
			local Model = getElementData(Source, "Farm.Replace.Model") or false

			if Model then
				if Model == "Exterior" then
					if getElementModel(Source) ~= ExteriorModelID then
						setElementModel(Source, ExteriorModelID)
					end
				elseif Model == "Barrow" then
					if getElementModel(Source) ~= BarrowModelID then
						setElementModel(Source, BarrowModelID)
					end
				elseif Model == "BarrowWheel" then
					if getElementModel(Source) ~= BarrowWheelModelID then
						setElementModel(Source, BarrowWheelModelID)
					end
				end
			end
		end
	end
)

addEventHandler("onClientElementStreamOut", resourceRoot,
	function()
		local Source = source

		if getElementType(Source, "ped") then
			RemoveTexture(Source)
		end
	end
)

addEventHandler("onClientElementDestroy", resourceRoot,
	function()
		local Source = source

		if getElementType(Source, "ped") then
			RemoveTexture(Source)
		end
	end
)

function ProcessColorSwitchEffect(Key, Color)
	if not ColorSwitches[Key] then
		if not Color[4] then
			Color[4] = 255
		end
		
		ColorSwitches[Key] = Color
		LastColorSwitches[Key] = Color
		
		LastColorConcat[Key] = table.concat(Color)
	end
		
	if LastColorConcat[Key] ~= table.concat(Color) then
		LastColorConcat[Key] = table.concat(Color)
		LastColorSwitches[Key] = Color
		StartColorSwitch[Key] = getTickCount()
	end
		
	if StartColorSwitch[Key] then
		local Progress = (getTickCount() - StartColorSwitch[Key]) / 300
		
		local Red, Green, Blue = interpolateBetween(
			ColorSwitches[Key][1], ColorSwitches[Key][2], ColorSwitches[Key][3],
			Color[1], Color[2], Color[3],
			Progress, "Linear"
		)
		
		local Alpha, Size = interpolateBetween(ColorSwitches[Key][4], ColorSwitches[Key][5], 0, Color[4], Color[5], 0, Progress, "Linear")
		
		ColorSwitches[Key][1] = Red
		ColorSwitches[Key][2] = Green
		ColorSwitches[Key][3] = Blue
		ColorSwitches[Key][4] = Alpha
		ColorSwitches[Key][5] = Size
		
		if Progress >= 1 then
			StartColorSwitch[Key] = false
		end
	end
		
	return ColorSwitches[Key][1], ColorSwitches[Key][2], ColorSwitches[Key][3], ColorSwitches[Key][4], ColorSwitches[Key][5]
end

addEventHandler("onClientRender", getRootElement(),
	function()
		for _, Trailer in pairs(getElementsByType("vehicle"), getRootElement(), true) do
			if getElementModel(Trailer) == 611 then
				if TrailerAnimals[Trailer] then
					for Key, Animal in pairs(TrailerAnimals[Trailer]) do
						if isElement(Animal) then
							local Rot = Vector3(getElementRotation(Trailer))
							setElementRotation(Animal, 0, 0, Rot.z + AnimalsRot[Animal])
						end
					end
				end
			end
		end
	end
)

function FormatNumber(Amount, Stepper)
	local Left, Center, Right = string.match(math.floor(Amount), "^([^%d]*%d)(%d*)(.-)$")
	return Left .. string.reverse(string.gsub(string.reverse(Center), "(%d%d%d)", "%1" .. (Stepper or " "))) .. Right
end

function CreateButton(Name, Text, PosX, PosY, SizeX, SizeY, Color)
	if Name and Text and PosX and PosY and SizeX and SizeY and Color then
		Buttons = {}

		Buttons[Name] = {PosX, PosY, SizeX, SizeY}
		
		local CursorX, CursorY = getCursorPosition()

		if tonumber(CursorX) then
			CursorX = CursorX * ScreenX
			CursorY = CursorY * ScreenY
		end

		if isCursorShowing() then
			for Key, Value in pairs(Buttons) do
				if CursorX >= Value[1] and CursorX <= Value[1] + Value[3] and CursorY >= Value[2] and CursorY <= Value[2] + Value[4] then
					ActiveButton = Key
					break
				end
			end
		end

		if ActiveButton == Name then
			ButtonData = {ProcessColorSwitchEffect(Name, {Color[1], Color[2], Color[3], 240, 4})}
		else
			ButtonData = {ProcessColorSwitchEffect(Name, {Color[1], Color[2], Color[3], 190, 0})}
		end

		local PosX, PosY, SizeX, SizeY = PosX - ButtonData[5] / 2, PosY - ButtonData[5] / 2, SizeX + ButtonData[5], SizeY + ButtonData[5]
		dxDrawRectangle(PosX, PosY, SizeX, SizeY, tocolor(ButtonData[1], ButtonData[2], ButtonData[3], ButtonData[4]))
		dxDrawText(Text, PosX + SizeX / 2, PosY + SizeY / 2, nil, nil, tocolor(200, 200, 200, 240), 0.8, Fonts.BebasNeueBold, "center", "center")
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