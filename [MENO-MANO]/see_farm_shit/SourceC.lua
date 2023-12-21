local ScreenX, ScreenY = guiGetScreenSize()

local AnimalDoor = 1523
local EngineModels = {
	Exterior = engineRequestModel("object"),
	Interior = engineRequestModel("object"),
	Fork = engineRequestModel("object"),
	Bale = engineRequestModel("object"),
	Hay = engineRequestModel("object"),
}

function GetModel(Model)
	return EngineModels[Model]
end

local Models = {
	["Exterior"]	= true,
	["Interior"]	= true,
	["Fork"]		= true,
	["Bale"]		= true,
	["Hay"]			= true

}

addEventHandler("onClientResourceStart", resourceRoot,
	function()
		for Path, Value in pairs(Models) do
			local ModelPath = "Files/Models/" .. Path
			local ModelId = GetModel(Path)

			if fileExists(ModelPath .. ".txd") then
				engineImportTXD(engineLoadTXD(ModelPath .. ".txd", true), ModelId)
			end

			if fileExists(ModelPath .. ".dff") then
				engineReplaceModel(engineLoadDFF(ModelPath .. ".dff"), ModelId)
			end

			if fileExists(ModelPath .. ".col") then
				engineReplaceCOL(engineLoadCOL(ModelPath .. ".col"), ModelId)
			end
		end
	end
)

addEventHandler("onClientResourceStop", resourceRoot,
	function()
		for Key, Model in pairs(EngineModels) do
			engineFreeModel(Model)		
		end
	end
)