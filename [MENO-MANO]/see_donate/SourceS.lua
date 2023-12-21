function AddPlayerPremiumFromWeb(AccId, PremimPoints)
	if AccId and PremimPoints then
		iprint(AccId, PremimPoints)

		local Player = FindPlayerFromAccId(tonumber(AccId))
		iprint(Player)

		if Player then
			local CurrentPremiumPoint = getElementData(Player, "acc.premiumPoints") or 0

			setElementData(Player, "acc.premiumPoints", tonumber(PremimPoints) + CurrentPremiumPoint)

			outputChatBox("#3d7abc[StrongMTA - PP]: #ffffffSikeres támogatás. Köszönjük!", Player, 0, 0, 0, true)

			triggerClientEvent(Player, "StartPremiumUI", Player, tonumber(PremimPoints))
		end
	end
end

function FindPlayerFromAccId(AccId)
	if tonumber(AccId) then
		for Key, Value in pairs(getElementsByType("player")) do
			if getElementData(Value, "char.accID") == AccId then
				iprint(Value)
				return Value
			end
		end
	end
end