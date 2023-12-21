DebugMode = false

WeightedItems = {
    -- Minel nagyobb annal nagyobb ra az esely

    --skines fegok
    [268] = 25,
    [271] = 25,
    [270] = 25,
    [272] = 25,
    [285] = 25,
    [281] = 25,
    [280] = 25,
    [273] = 25,
    [158] = 25,
    [253] = 25,
    [254] = 25,
    [260] = 25,
    [344] = 25,
    [341] = 25,
    [347] = 25,


    --antik meg minden ilyen fos
    [157] = 50,
    [158] = 50,
    [259] = 50,
    [260] = 50,
    [281] = 50,
    [280] = 50,
    [282] = 50,

    -- auto kulcsok
    [386] = 10,
    [387] = 10,
    [388] = 10,
    [389] = 10,
    [393] = 10,
    [394] = 10,


    -- innentol a simak
    [5] = 300,
    [6] = 300,
    [7] = 300,
    [8] = 200,
    [131] = 50,
    [148] = 150,
    [180] = 200,
    [148] = 400,
    [149] = 400,
    [150] = 350,
    [153] = 350,

    [128] = 200,
    [129] = 200,
    [130] = 200,
    [131] = 200,
    [132] = 200,
    [133] = 200,
    [134] = 200,
    [135] = 200,
    [136] = 200,
    [137] = 200,
    [138] = 200,
    [139] = 200,
    [140] = 200,
    [142] = 200,
    [141] = 200,
    [143] = 200,
    [144] = 200,
    [145] = 200,
    [146] = 200,

    [234] = 50,
    [235] = 50,
    [236] = 50,
    [237] = 50,
    [238] = 50,
    [239] = 50,
    [240] = 50,
    [241] = 50,
    [242] = 50,
    [243] = 50,
    [244] = 50,

}

GoldColor = {244, 205, 70}

GoldItems = {
    [386] = true,
    [387] = true,
    [388] = true,
    [389] = true,
    [393] = true,
    [394] = true,


    [268] = true,
    [271] = true,
    [270] = true,
    [272] = true,
    [285] = true,
    [281] = true,
    [280] = true,
    [273] = true,
    [158] = true,
    [253] = true,
    [254] = true,
    [260] = true,
    [344] = true,
    [341] = true,
    [347] = true,



    [157] = true,
    [158] = true,
    [259] = true,
    [260] = true,
    [281] = true,
    [280] = true,
    [282] = true,
}

function ChooseRandomItem()
	local weightSum = 0

	for itemId, itemWeight in pairs(WeightedItems) do
		weightSum = weightSum + itemWeight
	end

	local selectedWeight = math.random(weightSum)
	local iteratedWeight = 0

	for itemId, itemWeight in pairs(WeightedItems) do
		iteratedWeight = iteratedWeight + itemWeight

		if selectedWeight <= iteratedWeight then
			return itemId
		end
	end

	return false
end
