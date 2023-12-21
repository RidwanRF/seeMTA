local ServerPositions = {}

addEvent("SyncPlayerDetectorRotServer", true)
addEventHandler("SyncPlayerDetectorRotServer", getRootElement(),
	function(SendTo, Rot)
		local Source = source

		triggerClientEvent(SendTo, "SyncPlayerRotClient", Source, Rot)
	end
)

addEvent("RequestPositionsTable", true)
addEventHandler("RequestPositionsTable", getRootElement(),
	function()
		local Source = source

		triggerClientEvent(Source, "SyncPositionsToClient", Source, ServerPositions)
	end
)

addEventHandler("onResourceStart", resourceRoot,
	function()
		for Key, Value in pairs(Positions) do
			local PosX, PosY, PosZ, Rx, Ry = unpack(Value)

			if math.random(2, 10) > 8 then
				table.insert(ServerPositions, {PosX, PosY, PosZ, true})
			else
				table.insert(ServerPositions, {PosX, PosY, PosZ, false})	
			end
		end
	end
)