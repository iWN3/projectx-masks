Config = Config or {}

Config = {
	Framework = "qb-core", -- "qb-core", "qbox", "esx" or "custom"
    Inventory = "ox", -- "ox" or "qs" or "qb" or "esx" or "lj" or "ps"
    Notification = "ox", -- "ox" or "qb" or "esx"

	["GasMask"] = {
		["Item"] = "gasmask",
		["Clothing"] = 129,
		["Variation"] = 1,
	},
		
	["NightVisionGoggles"] = {
		["Item"] = "nightvision",
		["Clothing"] = 119,
	},

	["NotificationDuration"] = 5000,

	["ErrorMessage"] = "You are not wearing a mask",
	["WearingMaskMessage"] = "You are already wearing one",
	["TurnOffNightVisionMessage"] = "Turn off your nightvision first!",
	["GlitchMessage"] = "Nice try..",
}
