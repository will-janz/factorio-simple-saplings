require 'util'

local max_grow_time = 500
local tree_types = {
  'tree-01',
  'tree-02',
  'tree-02-red',
  'tree-03',
  'tree-04',
  'tree-05',
  'tree-06'
}

function initSimpleSaplings()
  game.print("[SimpleSaplings] init tree growing")
  -- Create the growing times table
  -- If something here is changed between releases you'll get a weird error
  -- https://github.com/Blu3wolf/Treefarm-Lite/issues/60 they're had a similar issue
  global.growing_times = {}
  global.grow_interval = 250

end

script.on_init(function()
  initSimpleSaplings()
end)

script.on_load(function()
  if global.grow_interval == nil then
    initSimpleSaplings()
  end
end)



-- Grow trees every few ticks
script.on_event(defines.events.on_tick, function(event)
  if event.tick % global.grow_interval == 0 and #global.growing_times > 0 then
    game.print("[SimpleSaplings] Trying to grow trees...")

    for index = #global.growing_times, 1, -1 do
      sapling = global.growing_times[index]

      if event.tick >= sapling.time then
        game.print("[SimpleSaplings] Growing a tree..." .. serpent.block(index) .. ',, ' .. serpent.block(sapling))
        finish_tree(sapling.position)
        table.remove(global.growing_times, index)
      end
    end
  end
end)

script.on_event(defines.events.on_built_entity, function(event)
  if event.created_entity.name == 'sapling' then
    -- Set the time this tree should grow
    table.insert(global.growing_times, { position = event.created_entity.position, time = event.tick + max_grow_time })
  end
end)

script.on_event(defines.events.on_entity_died, function(event)
  destroy_treestick(event)
end)

script.on_event(defines.events.on_preplayer_mined_item, function(event)
  destroy_treestick(event)
end)

function destroy_treestick(event)
  if (event.entity.name == 'sapling') then
    for k, v in pairs(global.growing_times) do
      if v.position.x == event.entity.position.x and v.position.y == event.entity.position.y then
        table.remove(global.growing_times, k)
        return
      end
    end
  end
end

function finish_tree(pos)
  tree = game.surfaces.nauvis.find_entity('sapling', pos)

  if tree then
    tree.destroy()
    newtree = tree_types[math.random(#tree_types)]

    if game.surfaces.nauvis.can_place_entity({ name = newtree, position = pos }) then
      game.surfaces.nauvis.create_entity({ name = newtree, position = pos })
    end
  end
end
