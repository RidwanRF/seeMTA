local LatestRow = 1
local CurrentRow = 1
local MaxRow = 8
local LockCode = "lociGergelyLoricAlexBotoKotond"
local LockString = 655

local VehiclePath = "files/vehicles/" 
local SkinPath = "files/skins/"

local VehicleCustomModelId = {}
local LoadedVeh = {}

local SkinCustomModelId = {}
local LoadedPed = {}

createPed(1, 414.0100402832, 2495.2509765625, 16.484375)

addEventHandler("onClientResourceStart", resourceRoot,
    function()
        for Key, Value in pairs(VehicleDatas) do
            local ModelId = false
            setTimer(function()
                local ModelId = engineRequestModel("vehicle", Value[1])

                VehicleCustomModelId[ModelId] = {Value[1], Value[2]}
                VehDataToModelId[Key] = ModelId
       	 
                LoadVehicleMod(ModelId, Value[2])
            end, 2500, 1)
        end

        for Key, Value in pairs(SkinsData) do
        	local ModelId = engineRequestModel("ped", 2)
        	SkinCustomModelId[ModelId] = true
        	SkinDataToModelId[Key] = ModelId

        	LoadSkinMod(ModelId, Key)
        end
    end
)

function LoadSkinMod(ModelId, Model)
	if tonumber(ModelId) and Model then
		if fileExists(SkinPath .. Model .. ".txd") then
			local Txd = engineLoadTXD(SkinPath .. Model .. ".txd", true)

			if Txd then
				engineImportTXD(Txd, ModelId)
			end
		end

		if fileExists(SkinPath .. Model .. ".dff") then
			local Dff = engineLoadDFF(SkinPath .. Model .. ".dff", ModelId)

			if Dff then
				engineReplaceModel(Dff, ModelId)
			end
		end
	end

	setTimer(function()
		local TempTable = {}

		table.insert(TempTable, getElementsByType("player", getRootElement(), true))
		table.insert(TempTable, getElementsByType("ped", getRootElement(), true))


		for Key, Value in ipairs(TempTable) do
			iprint(Value)

			local PedSkin = getElementData(Value, "Ped.Skin")
	
			if PedSkin then
				local PedModel = getElementModel(Value)
	
				if PlayerSkin and not LoadedPed[Value] and PedModel ~= PedSkin then
					SetSpecialPedMod(Value)
				end
			end
		end

		TempTable = nil
	end, 7000, 1)
end

function LoadVehicleMod(ModelId, Model)
	if tonumber(ModelId) and Model then
		if fileExists(VehiclePath .. Model .. ".txd") then
			local Txd = engineLoadTXD(VehiclePath .. Model .. ".txd", true)

			if Txd then
				engineImportTXD(Txd, ModelId)
			end
		end

		if fileExists(VehiclePath .. Model .. ".strong") then
			local Dff = engineLoadDFF(LoadLockedFiles(VehiclePath .. Model .. ".strong", LockCode), ModelId)

			if Dff then
				engineReplaceModel(Dff, ModelId)
			end
		elseif fileExists(VehiclePath .. Model .. ".dff") then
			local Dff = engineLoadDFF(VehiclePath .. Model .. ".dff", ModelId)

			if Dff then
				engineReplaceModel(Dff, ModelId)
			end
		end
	end

	setTimer(function()
		for Key, Value in ipairs(getElementsByType("vehicle", getRootElement(), true)) do
			local VehModelId = getElementData(Value, "vehicleSpecialMod")
	
			if VehModelId then
				local ModelId = getElementModel(Value)
	
				if VehModelId and not LoadedVeh[Value] and ModelId ~= VehModelId then
					SetSpecialVehicleMod(Value)
				end
			end
		end
	end, 7000, 1)
end

function LoadLockedFiles(Path, Key)
	local File = fileOpen(Path)
	local Size = fileGetSize(File)
	local FirstPart = fileRead(File, LockString + 6)
	fileSetPos(File, LockString + 6)
	local SecondPart = fileRead(File, Size - (LockString + 6))
	fileClose(File)

	return decodeString("tea", FirstPart, { key = Key }) .. SecondPart
end

function SetSpecialVehicleMod(Element)
	local VehModelId = getElementData(Element, "vehicleSpecialMod")

	if VehModelId and isElement(Element) and VehDataToModelId[VehModelId] and getElementModel(Element) ~= VehDataToModelId[VehModelId] then
		setElementModel(Element, VehDataToModelId[VehModelId])

		LoadedVeh[Element] = true
	end
end

function SetSpecialPedMod(Ped)
	local Skin = getElementData(Ped, "Ped.Skin")
	print("c skin: " .. Skin)

	if Skin and isElement(Ped) and SkinDataToModelId[Skin] and getElementModel(Ped) ~= SkinDataToModelId[Skin] then
		print("tovabb elso ifen")
		if Skin > 313 then
			print("setElementModel")
			setElementModel(Ped, SkinDataToModelId[Skin])
			iprint(SkinDataToModelId[Skin])

			LoadedPed[Ped] = true
		end
	end
end

addEventHandler("onClientVehicleEnter", getRootElement(),
	function(Player)
		if Player == localPlayer then
			triggerServerEvent("makeTuning", getRootElement(), source)
		end
	end
)

addEventHandler("onClientElementDataChange", getRootElement(),
	function(DataName)
		if DataName == "vehicleSpecialMod" and getElementType(source) == "vehicle" then
			local ModelModelId = getElementModel(source)

			local VehModelId = getElementData(source, "vehicleSpecialMod")

			if VehModelId then
				SetSpecialVehicleMod(source)
			end
		elseif DataName == "Ped.Skin" and (getElementType(source) == "ped" or getElementType(source) == "player") then
			--if not LoadedPed[source] then
				local PedSkin = getElementData(source, "Ped.Skin")

				if PedSkin then
					SetSpecialPedMod(source, PedSkin)
				end
			--end
		end
	end
)

addEventHandler("onClientElementStreamIn", getRootElement(),
	function()
		local ModelModelId = getElementModel(source)

		if getElementType(source) == "vehicle" and not LoadedVeh[source] then
			local VehModelId = getElementData(source, "vehicleSpecialMod")

			if VehModelId then
				SetSpecialVehicleMod(source)
			end
		elseif (getElementType(source) == "player" or getElementType(source) == "ped") and not LoadedPed[source] then
			local PedSkin = getElementData(source, "Ped.Skin")

			if PedSkin then
				SetSpecialPedMod(source, PedSkin)
			end
		end
	end
)

addEventHandler("onClientResourceStop", resourceRoot,
	function()
		for Key, Value in pairs(VehicleCustomModelId) do
			engineFreeModel(Key)
		end

		for Key, Value in pairs(SkinCustomModelId) do
			engineFreeModel(Key)
		end
	end
)

local ScreenX, ScreenY = guiGetScreenSize()
local SizeX, SizeY = 400, 600
local PosX, PosY = ScreenX / 2 - SizeX / 2, ScreenY / 2 - SizeY / 2

local Font = dxCreateFont("files/Ubuntu-M.ttf", 12)

addCommandHandler("showcars",
	function()
		ShowCustomVehicles = not ShowCustomVehicles
	end
)

addEventHandler("onClientRender", getRootElement(),
	function()
		if ShowCustomVehicles then
			dxDrawRectangle(PosX, PosY, SizeX, SizeY, tocolor(25, 25, 25))
			dxDrawRectangle(PosX, PosY, SizeX, 30, tocolor(45, 45, 45, 190))

			LatestRow = CurrentRow + MaxRow - 1
			NumValue = 0

		    for Key, Value in pairs(VehicleDatas) do
		  		NumValue = NumValue + 1

		        if NumValue >= CurrentRow and NumValue <= LatestRow then
		        	--print(NumValue)
		            NumValue = NumValue - CurrentRow + 1

		            if NumValue % 2 == 0 then
		           	 	dxDrawRectangle(PosX + 4, PosY + 44 * NumValue, SizeX - 8, 40, tocolor(45, 45, 45, 190))
		           	else
		           	 	dxDrawRectangle(PosX + 4, PosY + 44 * NumValue, SizeX - 8, 40, tocolor(30, 30, 30, 190))
		           	end

		            dxDrawText(Value[3] .. ": " .. Key, PosX + 4 + 5, PosY + 44 * NumValue + 40 / 2, nil, nil, tocolor(200, 200, 200, 200), 1, Font, "left", "center")
		        end
		    end
		end
	end
)

addEventHandler("onClientKey", getRootElement(),
	function(key,state)
	    if ShowCustomVehicles then
	        if key == "mouse_wheel_up" then
	            if CurrentRow > 1 then
	                CurrentRow = CurrentRow - 1
	            end
	        elseif key == "mouse_wheel_down" then
	            if CurrentRow < #VehicleDatas - (MaxRow - 1) then
	                CurrentRow = CurrentRow + 1
	            end
	        end

	        if key == "backspace" and state then
	            ShowCustomVehicles = false
	        end
	    end
	end
)