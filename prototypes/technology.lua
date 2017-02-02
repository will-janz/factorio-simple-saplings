data:extend({
	-- {
	-- 	type = "technology",
	-- 	name = "green-fingers",
	-- 	icon = "__SimpleSaplings__/graphics/icons/plant-stick.png",
	-- 	effects = {
	-- 		{
	-- 			type = "unlock-recipe",
	-- 			recipe = "sapling"
	-- 		}
	-- 	},
	-- 	prerequisites = {},
	-- 	unit = {
	-- 		count = 10,
	-- 		ingredients = {
	-- 			{"science-pack-1", 1}
	-- 		},
	-- 		time = 10
	-- 	}
	-- },
	{
		type = "technology",
		name = "seed-extraction",
		icon = "__SimpleSaplings__/graphics/icons/plant-stick.png",
		effects = {
			{
				type = "unlock-recipe",
				recipe = "sapling"
			}
		},
		prerequisites = {},
		unit = {
			count = 10,
			ingredients = {
				{"science-pack-1", 1},
				{"science-pack-2", 1}
			},
			time = 30
		}
	}
})
