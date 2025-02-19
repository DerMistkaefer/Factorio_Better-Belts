if deadlock then
	deadlock.add_tier({
		transport_belt      = "BetterBelts_ultra-transport-belt",
		colour              = {r=0,g=211,b=37},
		technology          = "logistics-3",
		order				= "d",
		loader				= "BetterBelts_ultra-deadlock-loader",
		loader_ingredients  = {
			{"express-transport-belt-loader",1},
			{"iron-gear-wheel",40},
		},
		beltbox				= "BetterBelts_ultra-deadlock-beltbox",
		beltbox_ingredients = {
			{"express-transport-belt-beltbox",1},
			{"steel-plate",40},
			{"iron-gear-wheel",40},
			{"processing-unit",5},
		},
		beltbox_technology  = "deadlock-stacking-3",
	})
	  
	if data.raw.furnace["BetterBelts_ultra-transport-belt-beltbox"] then
		data.raw.furnace["express-transport-belt-beltbox"].next_upgrade = "BetterBelts_ultra-transport-belt-beltbox"
	end
end
