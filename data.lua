local ADDON_NAME, ns = ...

local data = {
    { -- Seafarer's Dubloon
        id = 1710,
        type = "currency",
        expansion = "bfa",
        items = {
            { id=160290, horde=true, alliance=true, cost=100,  reward={ type="transmog" } },
            { id=160286, horde=true, alliance=true, cost=100,  reward={ type="transmog" } },
            { id=160289, horde=true, alliance=true, cost=100,  reward={ type="transmog" } },
            { id=166500, horde=true, alliance=true, cost=100,  reward={ type="pet", species=2562 } },
            { id=166491, horde=true, alliance=true, cost=200,  reward={ type="pet", species=2555 } },
            { id=166471, horde=true, alliance=true, cost=500,  reward={ type="mount", mountid=1208 } },
            { id=166745, horde=true, alliance=true, cost=1000, reward={ type="mount", mountid=1042 } },
            { id=166663, horde=true, alliance=true, cost=150,  reward={ type="toy" } },
            { id=166662, horde=true, alliance=true, cost=200,  reward={ type="toy" } },
            { id=166461, horde=true, alliance=true, cost=300,  reward={ type="toy" } }
        }
    },
    { -- Prismatic Manapearl
        id = 1721,
        type = "currency",
        expansion = "bfa",
        items = {
            { id=167167, horde=false, alliance=true,  cost=250, reward={ type="mount", mountid=1231 } },
            { id=167170, horde=true,  alliance=false, cost=250, reward={ type="mount", mountid=1230 } },
            { id=170204, horde=true,  alliance=true,  cost=75,  reward={ type="toy" } },
            { id=169377, horde=true,  alliance=true,  cost=40,  reward={ type="pet", species=2710 } },
            { id=169354, horde=false, alliance=true,  cost=40,  reward={ type="pet", species=2688 } },
            { id=169353, horde=true,  alliance=false, cost=40,  reward={ type="pet", species=2687 } },
            { id=169352, horde=true,  alliance=true,  cost=150, reward={ type="pet", species=2686 } }
        }
    },
    { -- Nazjatar Battle Commendation
        id = 168802,
        type = "item",
        expansion = "bfa",
        items = {
            { id=169203, horde=true,  alliance=true,  cost=150, reward={ type="mount", mountid=1262 } },
            { id=169357, horde=true,  alliance=true,  cost=30,  reward={ type="pet", species=2691 } },
            { id=169278, horde=false, alliance=true,  cost=30,  reward={ type="toy" } },
            { id=169277, horde=true,  alliance=false, cost=30,  reward={ type="toy" } },
            { id=169275, horde=false, alliance=true,  cost=10,  reward={ type="toy" } },
            { id=169276, horde=true,  alliance=false, cost=10,  reward={ type="toy" } }
        }
    },
    { -- Honorbound Service Medal, 7th Legion Service Medal
        id = 1716,
        type = "currency",
        expansion = "bfa",
        items = {
            { id=166744, horde=false, alliance=true,  cost=125, reward={ type="toy" } },
            { id=166346, horde=false, alliance=true,  cost=100, reward={ type="pet", species=2539 } },
            { id=166743, horde=true,  alliance=false, cost=125, reward={ type="toy" } },
            { id=166347, horde=true,  alliance=false, cost=100, reward={ type="pet", species=2540 } },
            { id=166465, horde=false, alliance=true,  cost=200, reward={ type="mount", mountid=1214, } },
            { id=166464, horde=true,  alliance=false, cost=200, reward={ type="mount", mountid=1215, } },
            { id=166463, horde=false, alliance=true,  cost=750, reward={ type="mount", mountid=1216, } },
            { id=166469, horde=true,  alliance=false, cost=750, reward={ type="mount", mountid=1210, } },
            { id=166436, horde=true,  alliance=true,  cost=350, reward={ type="mount", mountid=1204, } },
            { id=166550, horde=false, alliance=true,  cost=125, reward={ type="transmog" } },
            { id=166549, horde=true,  alliance=false, cost=125, reward={ type="transmog" } },
            { id=166548, horde=false, alliance=true,  cost=50,  reward={ type="transmog" } },
            { id=166547, horde=true,  alliance=false, cost=50,  reward={ type="transmog" } },
            { id=166770, horde=false, alliance=true,  cost=75,  reward={ type="heirloom" } },
            { id=166752, horde=true,  alliance=false, cost=75,  reward={ type="heirloom" } },
            { id=166766, horde=false, alliance=true,  cost=75,  reward={ type="heirloom" } },
            { id=166756, horde=true,  alliance=false, cost=75,  reward={ type="heirloom" } },
            { id=166767, horde=false, alliance=true,  cost=75,  reward={ type="heirloom" } },
            { id=166755, horde=true,  alliance=false, cost=75,  reward={ type="heirloom" } },
            { id=166768, horde=false, alliance=true,  cost=75,  reward={ type="heirloom" } },
            { id=166754, horde=true,  alliance=false, cost=75,  reward={ type="heirloom" } },
            { id=166769, horde=false, alliance=true,  cost=75,  reward={ type="heirloom" } },
            { id=166753, horde=true,  alliance=false, cost=75,  reward={ type="heirloom" } }
        }
    },
    { -- Corrupted Mementos
        id = 1719,
        type = "currency",
        expansion = "bfa",
        items = {
            { id=174770, horde=true,  alliance=true,  cost=100000, reward={ type="mount", mountid=1321 } },
            { id=174361, horde=true,  alliance=true,  cost=5000,   reward={ type="transmog" } },
            { id=174995, horde=true,  alliance=true,  cost=100,    reward={ type="toy" } },                -- Void Tendril Pet Leash
        }
    },
    { -- Polished Pet Charm
        id = 163036,
        type = "item",
        items = {
            { id=163489, horde=false, alliance=true,  cost=75,   reward={ type="pet", species=2403 } }, -- Abyssal Eel
            { id=163506, horde=true,  alliance=true,  cost=500,  reward={ type="pet", species=2420 } }, -- Accursed Hexxer
            { id=163511, horde=true,  alliance=true,  cost=50,   reward={ type="pet", species=2425 } }, -- Barnacled Hermit Crab
            { id=163500, horde=true,  alliance=true,  cost=200,  reward={ type="pet", species=2414 } }, -- Bloodfeaster Larva
            { id=163493, horde=true,  alliance=true,  cost=300,  reward={ type="pet", species=2407 } }, -- Bloody Rabbit Fang
            { id=163508, horde=true,  alliance=true,  cost=100,  reward={ type="pet", species=2422 } }, -- Butterfly in a Jar
            { id=163504, horde=true,  alliance=true,  cost=100,  reward={ type="pet", species=2418 } }, -- Child of Jani
            { id=163513, horde=true,  alliance=true,  cost=200,  reward={ type="pet", species=2427 } }, -- Cou'pa
            { id=163510, horde=true,  alliance=true,  cost=100,  reward={ type="pet", species=2424 } }, -- Crimson Frog
            { id=163555, horde=true,  alliance=true,  cost=200,  reward={ type="pet", species=2439 } }, -- Drop of Azerite
            { id=163492, horde=false, alliance=true,  cost=75,   reward={ type="pet", species=2406 } }, -- Drustvar Piglet
            { id=163509, horde=true,  alliance=true,  cost=250,  reward={ type="pet", species=2423 } }, -- Freshwater Pincher
            { id=163495, horde=false, alliance=true,  cost=50,   reward={ type="pet", species=2409 } }, -- Greatwing Macaw Feather
            { id=163502, horde=true,  alliance=false, cost=300,  reward={ type="pet", species=2416 } }, -- Lil' Ben'fon
            { id=163778, horde=false, alliance=true,  cost=200,  reward={ type="pet", species=2443 } }, -- Lil' Siege Tower
            { id=161016, horde=true,  alliance=false, cost=200,  reward={ type="pet", species=2196 } }, -- Lil' Tika
            { id=163779, horde=true,  alliance=false, cost=200,  reward={ type="pet", species=2444 } }, -- Lil' War Machine
            { id=163490, horde=false, alliance=true,  cost=250,  reward={ type="pet", species=2404 } }, -- Pair of Bee Wings
            { id=163491, horde=false, alliance=true,  cost=200,  reward={ type="pet", species=2405 } }, -- Pristine Falcon Feather
            { id=163503, horde=true,  alliance=false, cost=250,  reward={ type="pet", species=2417 } }, -- Ranishu Runt
            { id=163499, horde=true,  alliance=true,  cost=50,   reward={ type="pet", species=2413 } }, -- Raptor Containment Crate
            { id=163512, horde=true,  alliance=true,  cost=50,   reward={ type="pet", species=2426 } }, -- Sandstinger Wasp
            { id=163560, horde=true,  alliance=true,  cost=200,  reward={ type="pet", species=2421 } }, -- Saurolisk Hatchling
            { id=163515, horde=true,  alliance=true,  cost=100,  reward={ type="pet", species=2429 } }, -- Shard of Azerite
            { id=160708, horde=true,  alliance=true,  cost=200,  reward={ type="pet", species=2189 } }, -- Smoochums' Bloody Heart
            { id=163496, horde=false, alliance=true,  cost=75,   reward={ type="pet", species=2410 } }, -- Strange Looking Mechanical Squirrel
            { id=163498, horde=true,  alliance=true,  cost=100,  reward={ type="pet", species=2412 } }, -- Tiny Direhorn
            { id=163505, horde=true,  alliance=false, cost=200,  reward={ type="pet", species=2419 } }, -- Toad in a Box
            { id=163501, horde=true,  alliance=false, cost=75,   reward={ type="pet", species=2415 } }, -- Tragg the Curious
            { id=163514, horde=true,  alliance=true,  cost=150,  reward={ type="pet", species=2428 } }, -- Violent Looking Flower Pot
            { id=163494, horde=true,  alliance=true,  cost=100,  reward={ type="pet", species=2408 } }, -- Wad of Spider Web
            { id=163704, horde=true,  alliance=true,  cost=500,  reward={ type="toy" } },                -- Tiny Mechanical Mouse
            { id=163705, horde=true,  alliance=true,  cost=250,  reward={ type="toy" } },                -- Imaginary Gun
            { id=174995, horde=true,  alliance=true,  cost=20,   reward={ type="toy" } },                -- Void Tendril Pet Leash
            { id=180593, horde=true,  alliance=true,  cost=250,  reward={ type="pet", species=2899 } }, -- Court Messenger Scroll
            { id=184398, horde=true,  alliance=true,  cost=250,  reward={ type="pet", species=3061 } }, -- Steward Featherling
            { id=182664, horde=true,  alliance=true,  cost=250,  reward={ type="pet", species=3019 } }, -- Stemmins
            { id=181315, horde=true,  alliance=true,  cost=250,  reward={ type="pet", species=2965 } }, -- Bloodfeaster Spiderling
            { id=180636, horde=true,  alliance=true,  cost=250,  reward={ type="pet", species=2915 } }, -- Willowbreeze
            { id=181168, horde=true,  alliance=true,  cost=250,  reward={ type="pet", species=2945 } }, -- Corpulent Bonetusk
            { id=180814, horde=true,  alliance=true,  cost=250,  reward={ type="pet", species=2933 } }, -- Sable
            { id=180628, horde=true,  alliance=true,  cost=250,  reward={ type="pet", species=2923 } }, -- Pearlwing Heron
            { id=180603, horde=true,  alliance=true,  cost=250,  reward={ type="pet", species=2904 } }, -- Violet Dredwing Pup
            { id=182674, horde=true,  alliance=true,  cost=250,  reward={ type="pet", species=3023 } }, -- Sir Reginald
            { id=183854, horde=true,  alliance=true,  cost=250,  reward={ type="pet", species=3011 } }, -- Battie's Pendant
            { id=182661, horde=true,  alliance=true,  cost=250,  reward={ type="pet", species=3016 } }, -- Fun Guss
            { id=182662, horde=true,  alliance=true,  cost=250,  reward={ type="pet", species=3017 } }, -- Leafadore
            { id=174477, horde=true,  alliance=true,  cost=300,  reward={ type="pet", species=2849 } }, -- Pygmy Camel
            { id=180638, horde=true,  alliance=true,  cost=250,  reward={ type="pet", species=2913 } }, -- Fuzzy Shimmermoth
            { id=180634, horde=true,  alliance=true,  cost=250,  reward={ type="pet", species=2917 } }, -- Gloober, as G'huun
            { id=174480, horde=true,  alliance=true,  cost=300,  reward={ type="pet", species=2853 } }, -- Windfeather Quill
            { id=180857, horde=true,  alliance=true,  cost=250,  reward={ type="pet", species=2934 } }, -- Goldenpaw Kit
            { id=181272, horde=true,  alliance=true,  cost=250,  reward={ type="pet", species=2962 } }, -- Toenail
            { id=180641, horde=true,  alliance=true,  cost=250,  reward={ type="pet", species=2910 } }, -- Floofa
            { id=183112, horde=true,  alliance=true,  cost=250,  reward={ type="pet", species=3025 } }, -- Animated Radius (Carpal)
        }
    },
    { -- Honeyback Harvester
        id = 2398,
        type = "reputation",
        expansion = "bfa",
        items = {}
    }
    -- Anima
    -- Grateful Offering
    -- Cataloged Research
    -- Cosmic Flux
    -- Cyphers of the First Ones
    -- Infused Ruby
    -- Timewarped Badge
}

ns.D = data