data:extend({
  {
    type = 'technology',
    name = 'seed-extraction',
    icon = '__SimpleSaplings__/graphics/technology/seed-extraction.png',
    icon_size = 128,
    effects = {
      {
        type = 'unlock-recipe',
        recipe = 'sapling'
      }
    },
    prerequisites = {},
    unit = {
      count = 10,
      ingredients = {
        { 'science-pack-1', 1 },
        { 'science-pack-2', 1 }
      },
      time = 30
    }
  }
})
