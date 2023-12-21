WorldX, WorldY = -25.6328125, -364.9140625
FarmInteriorPosition = {-23.140625, -367.431640625, 5.4296875}

Prefix = "#d9534f[StrongMTA - Farm]: #ffffff"

OrderData = "Farm.Ped.Shop.Order."

RandomPedPos = {
    {-21.532634735107, -356.7815246582, 5.4296875},
    {-24.2180519104, -356.93707275391, 5.4296875},
    {-23.870008468628, -358.83633422852, 5.4296875},
    {-22.635305404663, -361.38302612305, 5.4296875},
    {-23.887344360352, -363.92034912109, 5.4296875},
    {-22.212432861328, -363.13537597656, 5.4296875},
    {-22.227018356323, -361.88732910156, 5.4296875},
    {-23.892442703247, -361.17672729492, 5.4296875},
    {-22.600095748901, -359.53125, 5.4296875},
    {-24.341728210449, -359.11898803711, 5.4296875},
    {-24.568355560303, -357.88693237305, 5.4296875},
    {-22.346031188965, -357.40451049805, 5.4296875},
    {-21.991666793823, -356.19174194336, 5.4296875},
    {-24.369134902954, -356.02178955078, 5.4296875},
    {-22.416006088257, -359.93389892578, 5.4296875}
}

AnimalCounter = {
    [1] = 4,
    [2] = 28,
    [7] = 12,
    [10] = 15, 
}

NameToId = {
    ["Chicken"] = 1,
    ["Cow"] = 2,
    ["Goat"] = 7,
    ["Pig"] = 10  
}

TrialerOffsets = {
    [1] = {
        Sell = {
            {-1, -1, 0}
        },
        Buy = {
            {-0.65, 0.6, 0.8},
            {-0.3, 0.6, 0.8},
            {0.05, 0.6, 0.8},
            {0.35, 0.6, 0.8},
            {0.65, 0.6, 0.8},

            {-0.65, 0.1, 0.8},
            {-0.3, 0.1, 0.8},
            {0.05, 0.1, 0.8},
            {0.35, 0.1, 0.8},
            {0.65, 0.1, 0.8},

            {-0.65, -0.4, 0.8},
            {-0.3, -0.4, 0.8},
            {0.05, -0.4, 0.8},
            {0.35, -0.4, 0.8},
            {0.65, -0.4, 0.8},

            {-0.65, -0.9, 0.8},
            {-0.3, -0.9, 0.8},
            {0.05, -0.9, 0.8},
            {0.35, -0.9, 0.8},
            {0.65, -0.9, 0.8},

            {-0.65, -1.4, 0.8},
            {-0.3, -1.4, 0.8},
            {0.05, -1.4, 0.8},
            {0.35, -1.4, 0.8},
            {0.65, -1.4, 0.8},
        
        }
    },
    [2] = {
        Sell = {

        },

        Buy = {
            {0, 0.2, 0.85},
            {-0, -1, 0.85}
        }
    },
    [7] = {
        Sell = {

        },

        Buy = {
            {0.35, 0.3, 0.85},
            {-0.35, 0.3, 0.85},
            {-0, -1.4, 0.85},
            {-0, -0.5, 0.85},
        }
    },
    [10] = {
        Sell = {

        },

        Buy = {
            {0.35, 0.3, 0.85},
            {-0.35, 0.3, 0.85},
            {-0, -1.4, 0.85},
            {-0.1, -0.5, 0.85},
            {-0, -0.5, 0.85},
            {0.35, -0.5, 0.85},

        }
    }
} 

IdToName = {
    [1] = "Csirke",
    [2] = "Tehén",
    [7] = "Kecske",
    [10] = "Sertés", 
}

function NameToID(Name)
    return NameToId[Name]
end

MaxAnimalCount = 100

Permissions = {}

FarmMarkerColor = {
	Rent = {197, 172, 119, 100},
	UnRent = {124, 197, 118, 100}
}

TrailerMaxAnimal = {
    [NameToID("Chicken")] = {
        Shop = 1,
        Sell = 7
    },

    [NameToID("Cow")] = {
        Shop = 2,
        Sell = 1
    },

    [NameToID("Goat")] = {
        Shop = 4,
        Sell = 3
    },

    [NameToID("Pig")] = {
        Shop = 6,
        Sell = 3
    },

}

AllowedForks = 2

RentPrice = 5000
RentPricePP = 2000
MaxFarmsMoney = 1
DefaultRentTime = 60000 * 60 * 24 * 7

LifeTime = 1000 * 60 * 160
HealthTime = 1000 * 60 * 60
DefaultLosingClean = 1000 * 60 * 60
CleanLoseTime = 1000 * 20000
GrowingTime = 1000 * 1

AnimalsPath = "Files/Animals/"

AnimalsData = {
    [1] = {
        MaxSize = 1,
        MinSize = 0.4,
        GrowTime = 0.005, --200 --1000 * 60 valtozassal 3ora 20 perc -- 1000 * 120 valtozassal 6ora 40perc -- 1000 * 240 valtozassal 13 ora 20 perc 
        Name = "Csirke",
        Path = AnimalsPath .. "Chicken",
        Sounds = 8,
        Textures = 6,
        Remap = "Chicken_D",
        MinPrice = 1200000,
    },

    [2] = {
        MaxSize = 1.3,
        MinSize = 0.6,
        GrowTime = 0.001, --1300 --1000 * 60 valtozassal 21ora 40 perc -- 1000 * 120 valtozassal 43 ora 20 perc -- 1000 * 240 valtozassal 86 ora 40 perc (3 nap 14 ora 40 perc)
        Name = "Tehén",
        Path = AnimalsPath .. "Cow",
        Sounds = 7,
        Textures = 5,
        Remap = "head_diff_000_c_whi",
        MinPrice = 5000,
    },

    [7] = {
        MaxSize = 1.1,
        MinSize = 0.6,
        GrowTime = 0.002, --550
        Name = "Kecske",
        Path = AnimalsPath .. "Goat",
        Sounds = 3,
        Textures = 3,
        Remap = "Goat_D",
        MinPrice = 3500,
    },

    [10] = {
        MaxSize = 1.2,
        MinSize = 0.55,
        GrowTime = 0.0025, --145,45
        Name = "Sertés",
        Path = AnimalsPath .. "Pig",
        Sounds = 6,
        Textures = 4,
        Remap = "pig_d",
        MinPrice = 3400
    }
}