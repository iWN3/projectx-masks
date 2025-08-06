Config = Config or {}

Config = {
	Framework = "qb-core", -- "qb-core", "qbox", "esx" or "custom"
	Inventory = "ox",    -- "ox" or "qs" or "qb" or "esx" or "lj" or "ps"
	Notification = "ox", -- "ox" or "qb" or "esx"

	["GasMask"] = {
		["Item"] = "gasmask",
		["Clothing"] = {
			male = { drawable = 129, texture = 1 },
			female = { drawable = 130, texture = 0 }
		},
	},

	["NightVisionGoggles"] = {
		["Item"] = "nightvision",
		["Clothing"] = {
			male = {
				down = { drawable = 118, texture = 0 },
				up   = { drawable = 119, texture = 0 }
			},
			female = {
				down = { drawable = 117, texture = 0 },
				up   = { drawable = 118, texture = 0 }
			}
		}
	},

	["NotificationDuration"] = 5000,

	["ErrorMessage"] = "You are not wearing a mask",
	["WearingMaskMessage"] = "You are already wearing one",
	["TurnOffNightVisionMessage"] = "Turn off your nightvision first!",
	["GlitchMessage"] = "Nice try..",
}
