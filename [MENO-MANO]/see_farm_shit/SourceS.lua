local FarmLandDatas = {}
local TaskTimes = {}

addEvent("FarmTask", true)
addEventHandler("FarmTask", getRootElement(),
	function(FarmId, LandX, LandY, TaskId, ...)
		local Client = client

		if isElement(Client) then
			local LandData = FarmLandDatas[FarmId][LandX .. "," .. LandY]

			if LandData["isInInterpolation"] then
				if LandData["isInInterpolation"] ~= Client then
					outputChatBox("#d75959[SeeMTA - Farm]:#ffffff Egyszerre csak egy ember dolgozhat egy helyen!", Cliet, 255, 255, 255, true)
					triggerClientEvent(Client, "FreeUpFromTask", Client)
				end

				return
			else
				local TaskTime = TaskTimes[TaskId]
			end
		end
	end
)