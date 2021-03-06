for name, tree in pairs (data.raw['tree']) do
    if not(string.find(name, 'dead') or string.find(name, 'dry') or string.find(name, 'coral') or string.find(name, 'stick') or name == 'sapling') then
        if tree.minable then
            tree.minable.result = nil
            tree.minable.results = {
                {
                    type = 'item',
                    name = 'raw-wood',
                    amount_min = 4,
                    amount_max = 4,
                    probability = 1
                },
                -- Construction robots won't be able to grab seeds, only manual mining can
                {
                    type = 'item',
                    name = 'sapling',
                    amount_min = 2,
                    amount_max = 4,
                    probability = 1
                }
            }
        end
    end
end
