data:extend(
{
	{
		type = "item",
		name = "seed",
		icon = "__SimpleSaplings__/graphics/icons/seed.png",
		flags = { "goes-to-main-inventory" },
		fuel_value = "1MJ",
		subgroup = "raw-material",
		order = "a[seed]",
		stack_size = 100
	},
	{
		type = "item",
		name = "sapling",
		icon = "__SimpleSaplings__/graphics/icons/plant-stick.png",
		flags = { "goes-to-quickbar" },
		subgroup = "production-machine",
		order = "a[sapling]",
		place_result = "sapling",
		stack_size = 10
	}
})
