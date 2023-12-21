local DataBase = exports.see_database:getConnection()

local FarmInteriorMarker = {}
local FarmExteriorMarker = {}

local BlocksData = {}
local Permissions = {}

local FarmExteriors = {}
local FarmBoards = {}
local FarmTimers = {}

local FarmBarrows = {}

local FarmNames = {}

local FarmForks = {}

local AnimalsTable = {}
local FarmCreatedAnimals = {}

local PedMoveTime = {}
local pedGrowTimer = {}

local ObjectsData = {}

local ShopPed = createPed(299, 319.11849975586, 2492.0725097656, 16.484375)
setElementData(ShopPed, "Farm.Ped.Shop", true)
setElementID(ShopPed, "Farm.Shop.Ped")

addEvent("SetPedOrderTable", true)
addEventHandler("SetPedOrderTable", getRootElement(),
	function(Table, FarmID)
		if getElementData(ShopPed, OrderData .. FarmID) or Table == false then
			removeElementData(ShopPed, OrderData .. FarmID)
		else
			setElementData(ShopPed, OrderData .. FarmID, Table)
		end
	end
)

addEvent("UpdateFarmName", true)
addEventHandler("UpdateFarmName", getRootElement(),
	function(Name, FarmID)
		FarmNames[FarmID] = Name
	end
)

addEvent("SyncBaleState", true)
addEventHandler("SyncBaleState", getRootElement(),
	function(FarmID, BaleID, State)
		if ObjectsData[FarmID].Bale[BaleID] then
			ObjectsData[FarmID].Bale[BaleID] = State * 10
		end
	end
)

addCommandHandler("createfarm",
	function(Player, Command, Size)
		if not Size or tonumber(Size) < 1 then
			print("/farm [Size]")
		else
			Size = tonumber(Size)
			local LastInsert = 0

			for I = 1, Size do
				local PosX, PosY, PosZ = getElementPosition(Player)

				if I > 1 then
					PosX, PosY = getPositionFromElementOffset(FarmExteriors[LastInsert], 5.2, -7.5, 0)
				end

				local Rot = Vector3(getElementRotation(Player))

				local FarmQuery = dbQuery(DataBase, "INSERT INTO farms SET x = ?, y = ?, z = ?, rotation = ?", PosX, PosY, PosZ, Rot.z)
				local Done, _, InsertID = dbPoll(FarmQuery, -1)

				if Done then
					CreateFarm(InsertID)
				end

				LastInsert = InsertID
			end
		end
	end
)

addEventHandler("onResourceStart", resourceRoot,
	function()
		local FarmQuery = dbPoll(dbQuery(DataBase, "SELECT * FROM farms"), -1)

		if FarmQuery then
			for Key, Value in pairs(FarmQuery) do
				CreateFarm(Value.id)
			end
		end
	end
)

addEventHandler("onResourceStop", resourceRoot, 
	function()
	  	for Key, Value in pairs(FarmExteriorMarker) do
	   		if BlocksData[Key] then
	    		dbExec(DataBase, "UPDATE farms SET blockTable = ? WHERE id = ?", toJSON(BlocksData[Key]), Key)
	    	end
	  	end

	  	for Key, Value in pairs(AnimalsTable) do
	   		if AnimalsTable[Key] then
	    		dbExec(DataBase, "UPDATE farms SET animalData = ? WHERE id = ?", toJSON(AnimalsTable[Key]), Key)
	    	end
	  	end

	  	for Key, Value in pairs(FarmNames) do
	  		if FarmNames[Key] then
	  			dbExec(DataBase, "UPDATE farms SET name = ? WHERE id = ?", FarmNames[Key], Key)
	  		end
	  	end

	  	for Key, Value in pairs(ObjectsData) do
	  		if ObjectsData[Key] then
	  			dbExec(DataBase, "UPDATE farms SET objectData = ? WHERE id = ?", toJSON(ObjectsData[Key]), Key)
	  		end
	  	end
	end
)

function CreateFarmAnimal(FarmID, Data)
	if not AnimalsTable[FarmID] then
		AnimalsTable[FarmID] = {}
	end

	table.insert(AnimalsTable[FarmID], {
		Type = Data.Type,
		Texture = Data.Texture,
		Size = AnimalsData[Data.Type].MinSize + Data.Size,
		Health = 100,
		Life = 100,
		CreatedTick = GetTimeStamp(),
	})

    dbExec(DataBase, "UPDATE farms SET animalData = ? WHERE id = ?", toJSON(AnimalsTable[FarmID]), FarmID)
end
addEvent("CreateFarmAnimal", true)
addEventHandler("CreateFarmAnimal", getRootElement(), CreateFarmAnimal)



function CreateFarm(FarmID)
	local FarmQuery = dbPoll(dbQuery(DataBase, "SELECT * FROM farms WHERE id = ?", FarmID), -1)

	if FarmQuery then
		for Key, Value in pairs(FarmQuery) do
			local MarkerColor = {unpack(FarmMarkerColor.Rent)}
		
			if Value.owner == 0 then
				MarkerColor = {unpack(FarmMarkerColor.UnRent)}
			else
				local RentTime = tonumber(Value.rentTime)

				FarmTimers[FarmID] = setTimer(
					function()
					 	dbExec(DataBase, "UPDATE farms SET owner = ?, blockTable = NULL, permissionTable = '[[]]' WHERE id = ? ", 0, FarmID)
					 		
					 	BlocksData[FarmID] = nil
					 	Permissions[FarmID] = {}

					 	setElementData(FarmExteriorMarker[FarmID], "Farm.Owner", 0)
					 	setElementData(FarmInteriorMarker[FarmID], "Farm.Owner", 0)

					 	setMarkerColor(FarmExteriorMarker[FarmID], unpack(FarmMarkerColor.UnRent))
					end, RentTime, 1
				)
			end

			FarmExteriorMarker[FarmID] = createMarker(Value.x, Value.y, Value.z - 0.5, "cylinder", 0.7, MarkerColor[1], MarkerColor[2], MarkerColor[3], MarkerColor[4])
			setElementData(FarmExteriorMarker[FarmID], "Farm.Marker", true)
			setElementData(FarmExteriorMarker[FarmID], "Farm.MarkerID", FarmID)
			setElementData(FarmExteriorMarker[FarmID], "Farm.Position", {unpack(FarmInteriorPosition)})
			setElementData(FarmExteriorMarker[FarmID], "Farm.Dimension", FarmID)
			setElementData(FarmExteriorMarker[FarmID], "Farm.Name", Value.name)
			setElementData(FarmExteriorMarker[FarmID], "Farm.Owner", Value.owner)
			setElementData(FarmExteriorMarker[FarmID], "Farm.Locked", Value.locked)
			setElementData(FarmExteriorMarker[FarmID], "Farm.Rot", Value.rotation)

			FarmInteriorMarker[FarmID] = createMarker(FarmInteriorPosition[1], FarmInteriorPosition[2], FarmInteriorPosition[3] - 1, "cylinder", 0.7, unpack(FarmMarkerColor.Rent))
            setElementData(FarmInteriorMarker[FarmID], "Farm.Marker", true)
            setElementData(FarmInteriorMarker[FarmID], "Farm.MarkerID", FarmID)
            setElementData(FarmInteriorMarker[FarmID], "Farm.Position", {Value.x, Value.y, Value.z})
            setElementData(FarmInteriorMarker[FarmID], "Farm.Dimension", 0)
            setElementData(FarmInteriorMarker[FarmID], "Farm.Name", Value.name)
            setElementData(FarmInteriorMarker[FarmID], "Farm.Owner", Value.owner)
            setElementData(FarmInteriorMarker[FarmID], "Farm.Locked", Value.locked)
            setElementDimension(FarmInteriorMarker[FarmID], FarmID)

            FarmNames[FarmID] = Value.name

			local PosX, PosY, PosZ = GetPositionInfrontOfElement(Value.x, Value.y, Value.z - 0.5, Value.rotation, 7.5)
            FarmExteriors[FarmID] = createObject(16673, PosX, PosY, PosZ)
            setElementRotation(FarmExteriors[FarmID], 0, 0, Value.rotation)
            setElementData(FarmExteriors[FarmID], "Farm.Replace.Model", "Exterior")

            FarmBarrows[FarmID] = createObject(16673, -21.571262359619, -356.66915893555, 5.4296875)
            setElementDimension(FarmBarrows[FarmID], FarmID)
            setElementData(FarmBarrows[FarmID], "Farm.Replace.Model", "Barrow")

            if fromJSON(Value.blockTable) then
            	BlocksData[FarmID] = fromJSON(Value.blockTable)
            end

            if Value.permissionTable then
                Permissions[FarmID] = fromJSON(Value.permissionTable)
            else
                Permissions[FarmID] = {}
            end

            FarmCreatedAnimals[FarmID] = {}

            if not fromJSON(Value.animalData) then
            	AnimalsTable[FarmID] = {}
            else
            	AnimalsTable[FarmID] = fromJSON(Value.animalData)
	        end

	        if not fromJSON(Value.objectData) then
	        	ObjectsData[FarmID] = {}
	        else
	        	ObjectsData[FarmID] = fromJSON(Value.objectData)
	        end
		end
	end

	setTimer(function()
        for Key, Value in pairs(getElementsByType("player")) do
            local Farm = getElementData(Value, "Player.InFarm")
                    
            if Farm and Farm > 0 and Farm == FarmID then
                LoadFarm(Value, Farm)
            end
        end
    end, 500, 1)
end

addEvent("EnterFarm", true)
addEventHandler("EnterFarm", getRootElement(),
	function(Marker)
		local Dim = getElementData(Marker, "Farm.Dimension")
		local Pos = getElementData(Marker, "Farm.Position")

		if Dim and Pos then
			local LastPos = Vector3(getElementPosition(Marker))
			local Rot = getElementData(Marker, "Farm.Rot")

			setElementPosition(source, unpack(Pos))
			setElementDimension(source, Dim)

			if Dim > 0 then
				LoadFarm(source, Dim)
				
				local PosX, PosY, PosZ = GetPositionInfrontOfElement(LastPos.x, LastPos.y, LastPos.z - 0.5, Rot, -5)
				setElementData(source, "Player.InFarm.AddMarkerPos", {PosX, PosY, PosZ})
				setElementData(source, "Player.InFarm", Dim)
			else
				triggerClientEvent(source, "SyncBlockClient", source, source, false, true)

				setElementData(source, "Player.InFarm", 0)
				setElementData(source, "Player.InFarm.AddMarkerPos", false)
			end
		end
	end
)

addEvent("SyncNewStateServer", true)
addEventHandler("SyncNewStateServer", getRootElement(),
	function(SelectedBlock, Type, Player, Dim)
		for Key, Value in pairs(getElementsByType("player")) do
			if getElementData(Value, "Player.InFarm") == Dim then
				triggerClientEvent(Value, "SyncNewStateClient", source, SelectedBlock, Type, Player)
			end
		end
	end
)

addEvent("SaveBlockServer", true)
addEventHandler("SaveBlockServer", getRootElement(), 
    function(Table, Dim, Index, Type)
    	if not BlocksData[Dim] then
    		BlocksData[Dim] = Table
    	else
    		for Key, Value in pairs(BlocksData[Dim]) do
				Value.NewTick = getTickCount()
				Value.NewState = Table[Key].NewState
				Value.NewLevel = Table[Key].NewLevel
				Value.HayClean = Table[Key].HayClean
				Value.Clean = Table[Key].Clean
				Value.State = Table[Key].State
				Value.New = Table[Key].New
				Value.Row = Table[Key].Row
				Value.Column = Table[Key].Column
				--Value.CleanLoseTick = getTickCount()
				Value.CleanChanger = Table[Key].CleanChanger
    		end

    		if Type == "Hay" then
				BlocksData[Dim][Index].CleanLoseTick = GetTimeStamp()

				--print(BlocksData[Dim][Index].CleanLoseTick)
			end
    	end
    end
)

function LoadFarm(Player, Farm, Permissions)
	local TempFarmTable = nil
	local TempFarmAnimalsTable = nil

	if not Permissions then
		Permissions = {}
	end

	if BlocksData[Farm] and AnimalsTable[Farm] then
		TempFarmTable = BlocksData[Farm]
		TempFarmAnimalsTable = AnimalsTable[Farm]

		for Key, Value in pairs(TempFarmAnimalsTable) do
			--Size = (1 * ((GetTimeStamp() - Value.CreatedTick) * 1000 / CleanLoseTime))
			Value.Size = Value.Size
          	--Value.CreatedTick = CleanLoseTime - (GetTimeStamp() - Value.CreatedTick) * 1000

          	print(Value.Size)
		end


		for Key, Value in pairs(TempFarmTable) do
			if (Value.Clean > 0 or Value.CleanChanger > 0) then

          		Value.Clean = 100 - (100 * ((GetTimeStamp() - Value.CleanLoseTick) * 1000 / CleanLoseTime))
          		Value.CleanLoseTime = CleanLoseTime - (GetTimeStamp() - Value.CleanLoseTick) * 1000
          		--print(Value.Clean)
          		Value.CleanChanger = Value.Clean
          		
          		if Value.CleanLoseTime < 1 then
            		Value.CleanLoseTime = 1
          		end
        	end

	        if Value.Clean < 0 then
	          	Value.Clean = 0
	          	Value.CleanChanger = 0
	        end

	        if Value.CleanChanger < 0 then
	          	Value.CleanChanger = 0
	        end

	        --print(Value.Clean)
		end
	end
	triggerClientEvent(Player, "SyncBlockClient", Player, Player, TempFarmTable, false, Permissions[Farm], TempFarmAnimalsTable, ObjectsData[Farm], FarmNames[Farm])
end

addEvent("SyncAnimations", true)
addEventHandler("SyncAnimations", getRootElement(),
	function(AnimPlayer, FarmID, Type, Bale)
		local BaleState = false

		if Bale then
			BaleState = Bale
		end
		
		if Type == "ForkDown" or Type == "ForkUp" then
			for Key, Player in ipairs(getElementsByType("player")) do
				local PlayerFarm = getElementData(Player, "Player.InFarm") or 0

				if PlayerFarm > 0 then
					if PlayerFarm == FarmID then
						triggerClientEvent(Player, "SyncAnimToClient", Player, AnimPlayer, Type, BaleState)
					end
				end
			end
		end
	end
)

function IsLeapYear(year)
    if year then year = math.floor(year)
    else year = getRealTime().year + 1900 end
    return ((year % 4 == 0 and year % 100 ~= 0) or year % 400 == 0)
end

function GetTimeStamp(year, month, day, hour, minute, second)
    -- initiate variables
    local monthseconds = { 2678400, 2419200, 2678400, 2592000, 2678400, 2592000, 2678400, 2678400, 2592000, 2678400, 2592000, 2678400 }
    local timestamp = 0
    local datetime = getRealTime()
    year, month, day = year or datetime.year + 1900, month or datetime.month + 1, day or datetime.monthday
    hour, minute, second = hour or datetime.hour, minute or datetime.minute, second or datetime.second

    -- calculate timestamp
    for i=1970, year-1 do timestamp = timestamp + (IsLeapYear(i) and 31622400 or 31536000) end
    for i=1, month-1 do timestamp = timestamp + ((IsLeapYear(year) and i == 2) and 2505600 or monthseconds[i]) end
    timestamp = timestamp + 86400 * (day - 1) + 3600 * hour + 60 * minute + second

    timestamp = timestamp - 3600 --GMT+1 compensation
    if datetime.isdst then timestamp = timestamp - 3600 end

    return timestamp
end

function GetPositionInfrontOfElement(X, Y, Z, Rot, Meters)
    local Meters = (type(Meters) == "number" and Meters) or 3
    local PosX, PosY, PosZ = X, Y, Z

    PosX = PosX - math.sin(math.rad(Rot)) * Meters
    PosY = PosY + math.cos(math.rad(Rot)) * Meters
    Rot = Rot + math.cos(math.rad(Rot))

    return PosX, PosY, PosZ, Rot
end