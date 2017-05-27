--CODE
BB = {}
BB.modName = "BetterBelts"
BB.baseGraphicsIcons = "__".. BB.modName .."__/graphics/icons/"
BB.baseGraphicsEntity = "__".. BB.modName .."__/graphics/entity/"

---------------------- Ultra BELT PICTURES
ultra_belt_filename = BB.baseGraphicsEntity .. "ultra-transport-belt.png"
hr_ultra_belt_filename = BB.baseGraphicsEntity .. "hr-ultra-transport-belt.png"

ultra_belt_horizontal = {filename = ultra_belt_filename, priority = "extra-high", width = 40, height = 40, frame_count = 32, 
	hr_version = { filename = hr_ultra_belt_filename, priority = "extra-high", width = 80, height = 80, frame_count = 32, line_length = 16, scale = 0.5}}

ultra_belt_vertical = {filename = ultra_belt_filename, priority = "extra-high", width = 40, height = 40, frame_count = 32, y = 40 ,
	hr_version = { filename = hr_ultra_belt_filename, priority = "extra-high", width = 80, height = 80, frame_count = 32, line_length = 16, y = 160 ,scale = 0.5 }}

ultra_belt_ending_top = {filename = ultra_belt_filename, priority = "extra-high", width = 40, height = 40, frame_count = 32, y = 80 ,
	hr_version = { filename = hr_ultra_belt_filename, priority = "extra-high", width = 80, height = 80, frame_count = 32, line_length = 16, y = 320 ,scale = 0.5 }}

ultra_belt_ending_bottom = {filename = ultra_belt_filename, priority = "extra-high", width = 40, height = 40, frame_count = 32, y = 120,
	hr_version = { filename = hr_ultra_belt_filename, priority = "extra-high", width = 80, height = 80, frame_count = 32, line_length = 16, y = 480 ,scale = 0.5 }}

ultra_belt_ending_side = {filename = ultra_belt_filename, priority = "extra-high", width = 40, height = 40, frame_count = 32, y = 160,
	hr_version = { filename = hr_ultra_belt_filename, priority = "extra-high", width = 80, height = 80, frame_count = 32, line_length = 16, y = 640 ,scale = 0.5 }}

ultra_belt_starting_top = {filename = ultra_belt_filename, priority = "extra-high", width = 40, height = 40, frame_count = 32, y = 200,
	hr_version = { filename = hr_ultra_belt_filename, priority = "extra-high", width = 80, height = 80, frame_count = 32, line_length = 16, y = 800 ,scale = 0.5 }}

ultra_belt_starting_bottom = {filename = ultra_belt_filename, priority = "extra-high", width = 40, height = 40, frame_count = 32, y = 240,
	hr_version = { filename = hr_ultra_belt_filename, priority = "extra-high", width = 80, height = 80, frame_count = 32, line_length = 16, y = 960 ,scale = 0.5 }}

ultra_belt_starting_side = {filename = ultra_belt_filename, priority = "extra-high", width = 40, height = 40, frame_count = 32, y = 280,
	hr_version = { filename = hr_ultra_belt_filename, priority = "extra-high", width = 80, height = 80, frame_count = 32, line_length = 16, y = 1120 ,scale = 0.5}}


------------------------------------

function BetterBelts_addItem(baseName,thisName,thisOrder)
	local obj = util.table.deepcopy(data.raw["item"][baseName])
	obj.name = BB.modName .. "_" .. thisName
	obj.icon = BB.baseGraphicsIcons .. thisName .. ".png"
	obj.icon_size = 32
	obj.place_result = obj.name
	obj.order = thisOrder
	if baseName == "express-loader" then obj.flags = {"goes-to-quickbar"} end
	
	data.raw[obj.type][obj.name] = obj
end

function BetterBelts_addRecipe(baseName,thisName,thisIngredients)
	local obj = util.table.deepcopy(data.raw["recipe"][baseName])
	obj.name = BB.modName .. "_" .. thisName
	obj.enabled = false
	obj.ingredients = thisIngredients
	obj.result = obj.name
	data.raw[obj.type][obj.name] = obj
end

function BetterBelts_addEntity_Belt(beltName,beltSpeed)
	local obj = util.table.deepcopy(data.raw["transport-belt"]["express-transport-belt"])
	obj.name = BB.modName .. "_" .. beltName
	obj.minable.result = obj.name
	
	obj.speed = beltSpeed
	
	obj.icon = BB.baseGraphicsIcons .. beltName .. ".png"
	obj.icon_size = 32
	obj.animations.filename = BB.baseGraphicsEntity .. beltName .. ".png"
	obj.animations.hr_version.filename = BB.baseGraphicsEntity .. "hr-" .. beltName .. ".png"

	obj.belt_horizontal = ultra_belt_horizontal
    obj.belt_vertical = ultra_belt_vertical
    obj.ending_top = ultra_belt_ending_top
    obj.ending_bottom = ultra_belt_ending_bottom
    obj.ending_side = ultra_belt_ending_side
    obj.starting_top = ultra_belt_starting_top
    obj.starting_bottom = ultra_belt_starting_bottom
    obj.starting_side = ultra_belt_starting_side
	
	data.raw[obj.type][obj.name] = obj
end

function BetterBelts_addEntity_undergroundBelt(beltName,beltSpeed,beltMax_distance,mainName)
	local obj = util.table.deepcopy(data.raw["underground-belt"]["express-underground-belt"])
	obj.name = BB.modName .. "_" .. beltName
	obj.minable.result = obj.name
	
	obj.speed = beltSpeed
	obj.max_distance = beltMax_distance
	
	obj.icon = BB.baseGraphicsIcons .. beltName .. ".png"
	obj.icon_size = 32
	obj.structure.direction_in.sheet.filename = BB.baseGraphicsEntity .. mainName .. "-structure.png"
	obj.structure.direction_out.sheet.filename = BB.baseGraphicsEntity .. mainName .. "-structure.png"
	obj.structure.direction_in.sheet.hr_version.filename = BB.baseGraphicsEntity .. "hr-" .. mainName .. "-structure.png"
	obj.structure.direction_out.sheet.hr_version.filename = BB.baseGraphicsEntity .. "hr-" .. mainName .. "-structure.png"

	obj.belt_horizontal = ultra_belt_horizontal
    obj.belt_vertical = ultra_belt_vertical
    obj.ending_top = ultra_belt_ending_top
    obj.ending_bottom = ultra_belt_ending_bottom
    obj.ending_side = ultra_belt_ending_side
    obj.starting_top = ultra_belt_starting_top
    obj.starting_bottom = ultra_belt_starting_bottom
    obj.starting_side = ultra_belt_starting_side
	
	data.raw[obj.type][obj.name] = obj
end

function BetterBelts_addEntity_Loader(beltName,beltSpeed,beltMax_distance)
	local obj = util.table.deepcopy(data.raw["loader"]["express-loader"])
	obj.name = BB.modName .. "_" .. beltName
	obj.minable.result = obj.name
	obj.flags = {"placeable-neutral", "player-creation"}
	
	obj.speed = beltSpeed
	
	obj.icon = BB.baseGraphicsIcons .. beltName .. ".png"
	obj.icon_size = 32
	
	
	obj.structure.direction_in.sheet.filename = BB.baseGraphicsEntity ..  "ultra-loader-structure.png"
	obj.structure.direction_in.sheet.width = 128
    obj.structure.direction_in.sheet.height = 128
	obj.structure.direction_out.sheet.filename = BB.baseGraphicsEntity .. "ultra-loader-structure.png"
    obj.structure.direction_out.sheet.width = 128
    obj.structure.direction_out.sheet.height = 128
    obj.structure.direction_out.sheet.y = 128
	

	obj.belt_horizontal = ultra_belt_horizontal
    obj.belt_vertical = ultra_belt_vertical
    obj.ending_top = ultra_belt_ending_top
    obj.ending_bottom = ultra_belt_ending_bottom
    obj.ending_side = ultra_belt_ending_side
    obj.starting_top = ultra_belt_starting_top
    obj.starting_bottom = ultra_belt_starting_bottom
    obj.starting_side = ultra_belt_starting_side
	
	data.raw[obj.type][obj.name] = obj
end

function BetterBelts_addEntity_Splitter(beltName,beltSpeed,beltMax_distance)
	local obj = util.table.deepcopy(data.raw["splitter"]["express-splitter"])
	obj.name = BB.modName .. "_" .. beltName
	obj.minable.result = obj.name
	
	obj.speed = beltSpeed
	
	obj.icon = BB.baseGraphicsIcons .. beltName .. ".png"
	obj.icon_size = 32
	
	obj.structure.north.filename = BB.baseGraphicsEntity .. beltName .. "-north.png"
	obj.structure.east.filename = BB.baseGraphicsEntity .. beltName .. "-east.png"
	obj.structure.south.filename = BB.baseGraphicsEntity .. beltName .. "-south.png"
	obj.structure.west.filename = BB.baseGraphicsEntity .. beltName .. "-west.png"
	
	obj.structure.north.hr_version.filename = BB.baseGraphicsEntity .. "hr-" .. beltName .. "-north.png"
	obj.structure.east.hr_version.filename = BB.baseGraphicsEntity .. "hr-" .. beltName .. "-east.png"
	obj.structure.south.hr_version.filename = BB.baseGraphicsEntity .. "hr-" .. beltName .. "-south.png"
	obj.structure.west.hr_version.filename = BB.baseGraphicsEntity .. "hr-" .. beltName .. "-west.png"
	
	obj.belt_horizontal = ultra_belt_horizontal
    obj.belt_vertical = ultra_belt_vertical
    obj.ending_top = ultra_belt_ending_top
    obj.ending_bottom = ultra_belt_ending_bottom
    obj.ending_side = ultra_belt_ending_side
    obj.starting_top = ultra_belt_starting_top
    obj.starting_bottom = ultra_belt_starting_bottom
    obj.starting_side = ultra_belt_starting_side
	
	data.raw[obj.type][obj.name] = obj
end

function BetterBelts_addTechnology(thisName,thisIcon,thisType,thisEffect,thisPrerequisites,thisCount,thisIngredients,thisTime,thisOrder,className,modName)
	local obj = util.table.deepcopy(data.raw["technology"]["steel-processing"])
	obj.name = BB.modName .. "_" .. thisName
	
	obj.icon = BB.baseGraphicsIcons .. thisIcon .. ".png"
	obj.icon_size = 32
	
	obj.effects = {}
	for n,effect in ipairs(thisEffect) do
		obj.effects[n] = {type = thisType, recipe = modName .. "_" .. className .. effect}
	end
	obj.prerequisites = thisPrerequisites
	
	obj.unit.count = thisCount
	if thisIngredients == 1 then
		obj.unit.ingredients = {{"science-pack-1", 1}}
	elseif thisIngredients == 2 then
		obj.unit.ingredients = {{"science-pack-1", 1},{"science-pack-2", 1}}
	elseif thisIngredients == 3 then
		obj.unit.ingredients = {{"science-pack-1", 1},{"science-pack-2", 1},{"science-pack-3", 1}}
	elseif thisIngredients == 4 then
		obj.unit.ingredients = {{"science-pack-1", 1},{"science-pack-2", 1},{"science-pack-3", 1},{"production-science-pack", 1}}
	elseif thisIngredients == 5 then
		obj.unit.ingredients = {{"science-pack-1", 1},{"science-pack-2", 1},{"science-pack-3", 1},{"production-science-pack", 1},{"high-tech-science-pack", 1}}
	end
	obj.unit.time = thisTime
	obj.order = thisOrder
	data.raw[obj.type][obj.name] = obj
end





function BetterBelts_BeltClass(className,classSpeed)

	BetterBelts_addItem("fast-transport-belt",className .. "-transport-belt","a[transport-belt]-d[" .. className .. "-transport-belt]")
	BetterBelts_addRecipe("fast-transport-belt",className .. "-transport-belt",{{"iron-gear-wheel", 5},{"express-transport-belt", 2}})
	BetterBelts_addEntity_Belt(className .. "-transport-belt",classSpeed)


	BetterBelts_addItem("fast-underground-belt",className .. "-underground-belt-v1","b[underground-belt]-d[" .. className .. "-underground-belt-v1]")
	BetterBelts_addItem("fast-underground-belt",className .. "-underground-belt-v2","b[underground-belt]-d[" .. className .. "-underground-belt-v2]")
	BetterBelts_addItem("fast-underground-belt",className .. "-underground-belt-v3","b[underground-belt]-d[" .. className .. "-underground-belt-v3]")
	BetterBelts_addRecipe("fast-underground-belt",className .. "-underground-belt-v1",{{"iron-gear-wheel", 20},{"express-underground-belt", 2}})
	BetterBelts_addRecipe("fast-underground-belt",className .. "-underground-belt-v2",{{"iron-gear-wheel", 20},{"BetterBelts_" .. className .. "-underground-belt-v1", 2}})
	BetterBelts_addRecipe("fast-underground-belt",className .. "-underground-belt-v3",{{"iron-gear-wheel", 20},{"BetterBelts_" .. className .. "-underground-belt-v2", 2}})
	BetterBelts_addEntity_undergroundBelt(className .. "-underground-belt-v1",classSpeed,15,className .. "-underground-belt")
	BetterBelts_addEntity_undergroundBelt(className .. "-underground-belt-v2",classSpeed,30,className .. "-underground-belt")
	BetterBelts_addEntity_undergroundBelt(className .. "-underground-belt-v3",classSpeed,45,className .. "-underground-belt")
	
	BetterBelts_addItem("fast-splitter",className .. "-splitter","c[splitter]-d[" .. className .. "-splitter]")
	BetterBelts_addRecipe("fast-splitter",className .. "-splitter",{{"iron-gear-wheel", 10},{"electronic-circuit", 15},{"express-splitter", 2}})
	BetterBelts_addEntity_Splitter(className .. "-splitter",classSpeed)
	
	BetterBelts_addItem("fast-loader",className .. "-loader","d[loader]-d[" .. className .. "-loader]")
	BetterBelts_addRecipe("fast-loader",className .. "-loader",{{"BetterBelts_" .. className .. "-splitter", 1},{"BetterBelts_" .. className .. "-transport-belt", 5}})
	BetterBelts_addEntity_Loader(className .. "-loader",classSpeed)
	
	classRecipes = {"-transport-belt","-underground-belt-v1","-underground-belt-v2","-underground-belt-v3","-splitter","-loader"}
	BetterBelts_addTechnology(className .. "-class",className .. "-transport-belt","unlock-recipe",classRecipes,{"logistics-3"},150,4,30,"a",className,BB.modName)
end



BetterBelts_BeltClass("ultra",0.2)


