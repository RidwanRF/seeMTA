local SantaPlayers = {}
local Time = 30 * 60

local SantaPed = createPed(1, 1031.8953857422, 1019.5764770508, 11)
setElementData(SantaPed, "visibleName", "Mikulás")
setElementData(SantaPed, "Santa.Ped", true)
setElementRotation(SantaPed, 0, 0, 305)
setElementData(SantaPed, "Santa.Skin", true)
setElementData(SantaPed, "invulnerable", true)
setElementFrozen(SantaPed, true)

addEventHandler("onElementClicked", SantaPed,
	function(Key, State, Player)
		local Source = source

		if Key == "right" and State == "down" then
			if getDistanceBetweenPoints3D(1031.8953857422, 1019.5764770508, 11, getElementPosition(Player)) > 2 then
				return
			end

			local AdminDuty = getElementData(Player, "adminDuty") or 0

			local PlayerAuth = getPlayerSerial(Player)
			local CurrentTime = GetTimeStamp()
			if not getElementData(Source, "Santa.Ped.Use") then
				setElementData(Source, "Santa.Ped.Use", true)

				if SantaPlayers[PlayerAuth] and (CurrentTime - SantaPlayers[PlayerAuth] <= Time) then
					local RemainingTime = Time - (CurrentTime - SantaPlayers[PlayerAuth])
					local RemainingDate = math.floor(RemainingTime / 60 / 60)

					local DateType = " óra"

					if RemainingDate == 0 then
						DateType = " perc"
						RemainingDate = math.floor(60 * (RemainingTime / 60 / 60))
					end

					if AdminDuty > 0 then
						triggerClientEvent(Player, "StartSantaGame", Player, Source, "Aduty")
					else
						if getElementData(Player, "Santa.Finish") then
							triggerClientEvent(Player, "StartSantaGame", Player, Source, "Finish")
						elseif getElementData(Player, "Santa.HaveGift") then
							triggerClientEvent(Player, "StartSantaGame", Player, Source, "HaveGift")
						else
							triggerClientEvent(Player, "StartSantaGame", Player, Source, "Error", RemainingDate .. DateType)
							--print("nem vagy fasza mert varja meg " .. RemainingDate .. DateType)
						end
					end
				else
					if AdminDuty > 0 then
						triggerClientEvent(Player, "StartSantaGame", Player, Source, "Aduty")
					else
						SantaPlayers[PlayerAuth] = CurrentTime

						triggerClientEvent(Player, "StartSantaGame", Player, Source, "Start")
					end
				end
			else
				outputChatBox("#d75959[StrongMTA - Mikulás]:#ffffff Jelenleg mással beszélget kérlek várj!", Player, 255, 255, 255, true)
			end
		end
	end
)

addEvent("SetPlayerQuestInt", true)
addEventHandler("SetPlayerQuestInt", getRootElement(), 
	function()
		local Player = source
		local AccId = getElementData(Player, "char.accID")

		if AccId then
			setElementInterior(Player, 	3)
			setElementPosition(Player, 2496.049804,-1695.238159,1014.742187)
			setElementDimension(Player, AccId + 9999)
		end
	end
)

addEvent("FinishQuest", true)
addEventHandler("FinishQuest", getRootElement(), 
	function()
		local Player = source
		
		setElementDimension(Player, 0)
		setElementInterior(Player, 0)
		setElementPosition(Player, unpack(getElementData(Player, "Santa.LastPos")))

		setElementData(Player, "Santa.Finish", true)
	end
)