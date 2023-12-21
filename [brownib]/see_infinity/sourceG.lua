VehicleDatas = {
	["911turbo"] = {587, "911turbo", "Porsche 911 Turbo S"},
	["senna"] = {502, "senna", "McLaren Senna"},
	["amgone"] = {506, "amgone", "Mercedes Benz AMG One"},
	["roadster"] = {587, "roadster", "Tesla Roadster"},
	["modelx"] = {400, "modelx", "Tesla Model X"},
	["models"] = {566, "models", "Tesla Model S"},
	["charger"] = {560, "charger", "Dodge Charger SRT8 '18"},
	["passat"] = {560, "passat", "Volkswagen Passat B6 Variant"},
	["rx8"] = {411, "rx8", "Mazda RX-8"},
	["zagato"] = {411, "zagato", "Aston Martin V12 Zagato"},
	["fiat500"] = {410, "fiat500", "Fiat 500"},
	["alfaspyder"] = {555, "alfaspyder", "Alfa Romeo Spider 115"},
	["covettec7"] = {411, "covettec7", "Chevrolet Corvette C7"},
	["520d"] = {445, "520d", "BMW 520d e60"},
	["rs6c7"] = {404, "rs6c7", "Audi RS6 C7"},
	["jesko"] = {503, "jesko", "Koenigsegg Jesko"},
	["audi_s3"] = {405, "audi_s3", "Audi S3"},
	["w140"] = {506, "w140", "Mercedes-Benz S600 w140 Brabus"},
	
	--***Egyedi járművek***--
	["rangerover"] = {400, "rangerover", "Range Rover Sport HSE"},
	["lada"] = {546, "lada", "Lada 2107"},
	["audia6"] = {405, "audia6", "Audi A6 4.2 Quattro"},
	["m6f13"] = {411, "m6f13", "BMW M6 F13"},
	["panamera"] = {445, "panamera", "Porsche Panamera Turbo"},
	["458italia"] = {411, "458italia", "Ferrari 458 Italia"},
	["x6m"] = {400, "x6m", "BMW X6M"},
	["gt63"] = {560, "gt63", "Mercedes-AMG GT 63 S"},
	["x5"] = {400, "x5", "BMW X5"},
	["m5f90"] = {445, "m5f90", "BMW M5 F90"},
	--***Egyedi járművek***--
}

SkinsData = {
	[314] = true,
}

VehDataToModelId = {}
SkinDataToModelId = {}

function GetPlayerSkin(Player)
	local SkinId = getElementData(Player, "Ped.Skin") 

	if SkinId then
		return SkinId
	end
end

function SetPlayerSkin(Player, Skin)
	if Player and tonumber(Skin) then
		setElementData(Player, tonumber(Skin))
	end
end

function getVehicleCustomName(modelName)
	if VehicleDatas[modelName] then
		return VehicleDatas[modelName][3]
	end
end

function getVehicleModel(vehCustomID)
	if VehDataToModelId[vehCustomID] then
		return VehDataToModelId[vehCustomID]
	end
end

function GetVehicleDefaultID(ModelID)
	if VehicleDatas[ModelID] then
		return VehicleDatas[ModelID][1]
	end
end

function splitEx(inputstr, sep)
	if not sep then
		sep = "%s"
	end

	local t = {}
	local i = 1

	for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
		t[i] = str
		i = i + 1
	end

	return t
end