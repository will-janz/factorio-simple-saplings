data:extend({
  {
    type = 'tree',
    name = 'sapling',
    icon = '__SimpleSaplings__/graphics/icons/plant-stick.png',
    flags = { 'placeable-neutral', 'breaths-air', 'not-repairable' },
    minable = {
      hardness = 0.1,
      mining_time = 0.5,
      result = 'sapling'
    },
    max_health = 20,
    corpse = 'small-remnants',
    collision_box = {
      { -0.15, -0.15 },
      { 0.15, 0.15 }
    },
    selection_box = {
      { -0.4, -0.4 },
      { 0.4, 0.4 }
    },
    drawing_box = {
      { -0.5, -0.5 },
      { 0.5, 0.5 }
    },
    vehicle_impact_sound = {
      filename = '__base__/sound/car-wood-impact.ogg',
      volume = 1.0
    },
    pictures = {
      filename = '__SimpleSaplings__/graphics/entity/plant-stick.png',
      priority = 'extra-high',
      width = 123,
      height = 124,
      shift = { 0.6, -1.4 }
    }
  }
})
