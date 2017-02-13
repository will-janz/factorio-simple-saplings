require 'util'

local avg_grow_time = 60 * 60 * 5 --5 minutes, until a random modifier is applied
local max_grow_swing = 60 * 60 * 1.5 --1.5 minutes either way
local tree_types = {
  'tree-01',
  'tree-02',
  'tree-02-red',
  'tree-03',
  'tree-04',
  'tree-05',
  'tree-06'
}

script.on_event(defines.events.on_built_entity, function(event)
  if event.created_entity.name == 'sapling' then
    --Get a random grow tick
    local grow_tick = (avg_grow_time or 60*60*5) + math.random(-max_grow_swing, max_grow_swing)
    --Get or create the global tick to grow on
    global.growing_times[grow_tick] = global.growing_times[grow_tick] or {}
    --local reference because speed and things
    local sapling = global.growing_times[grow_tick]
    sapling[#sapling+1] = {entity=event.created_entity}
  end
end)

-- Grow trees every few ticks
script.on_event(defines.events.on_tick, function(event)
  --Is there a sapling ready to grow this tick
  if global.growing_times[event.tick] then
    --Loop through all saplings ready to grow this tick
    for _, sapling in ipairs(global.growing_times[event.tick]) do
      --If the sapling is still valid then make tree!
      if sapling and sapling.entity and sapling.valid then
        local newtree = tree_types[math.random(1,#tree_types)]
        sapling.entity.surface.create_entity{name=newtree, position = sapling.entity.position}
        sapling.entity.destroy()
      end
    end
    --Remove the data from the table
    global.growing_times[event.tick] = nil
  end
end)


local function initSimpleSaplings()
  -- Create the growing times table
  -- If something here is changed between releases you'll get a weird error
  -- https://github.com/Blu3wolf/Treefarm-Lite/issues/60 they're had a similar issue
  global.growing_times = global.growing_times or {}
end

script.on_init(initSimpleSaplings)

script.on_configuration_changed(initSimpleSaplings)
