addEventHandler("onClientPreRender", getRootElement(),
	function ()
		if isWorldSpecialPropertyEnabled("aircars") then 
			setElementHealth(localPlayer, 0)
			setWorldSpecialPropertyEnabled("aircars", false)

			outputChatBox("jo probalkozas volt :D")
		end
	end 
)

addEventHandler("onClientExplosion", getRootElement(),
	function ()
		--cancelEvent()
	end 
)

addEventHandler("onClientProjectileCreated", getRootElement(),
	function ()
		if isElement(source) then 
			destoryElement(source)
		end
	end 
)