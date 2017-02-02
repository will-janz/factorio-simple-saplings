require "util"

local max_grow_time = 50000.0
local tree_types = {"tree-01",
					"tree-02",
					"tree-02-red",
					"tree-03",
					"tree-04",
					"tree-05",
					"tree-06"
					}

script.on_init(function()
	-- Create the growing times table
	global.growing_times = {}
end)

script.on_event(defines.events.on_built_entity, function(event)
	if event.created_entity.name == "sapling" then
		-- Set the time this tree should grow
		table.insert(global.growing_times, {position = event.created_entity.position, time = event.tick + max_grow_time})
		table.sort(global.growing_times, function(a, b) return a.time < b.time end)
	end
end)

script.on_event(defines.events.on_tick, function(event)
	while #global.growing_times > 0 do
		if event.tick < global.growing_times[1].time then break end

		finish_tree(global.growing_times[1].position)
		table.remove(global.growing_times, 1)
	end
end)

script.on_event(defines.events.on_entity_died, function(event)
	destroy_treestick(event)
end)
script.on_event(defines.events.on_preplayer_mined_item, function(event)
	destroy_treestick(event)
end)

function destroy_treestick(event)
	if (event.entity.name == "sapling") then
		for k, v in pairs(global.growing_times) do
			if v.position.x == event.entity.position.x and v.position.y == event.entity.position.y then
				table.remove(global.growing_times, k)
				return
			end
		end
	end
end

function finish_tree(pos)
	tree = game.surfaces.nauvis.find_entity("sapling", pos)
	if tree then
		tree.destroy()
		newtree = tree_types[math.random(#tree_types)]
		if game.surfaces.nauvis.can_place_entity({name = newtree, position = pos}) then
			game.surfaces.nauvis.create_entity({name = newtree, position = pos})
		end
	end
end
