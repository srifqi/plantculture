--plantculture by srifqi
--License: CC0 1.0 Universal

--plantculture API
plantculture={}

--plantculture.register() --register new sapling
--resulting "plantculture:<param.name>"
function plantculture.register(param)
	--register sapling
	minetest.register_node("plantculture:"..param.name,{
		description = param.desc,
		drawtype = "plantlike",
		tiles = {param.image},
		inventory_image = param.image,
		wield_image = param.image,
		paramtype = "light",
		walkable = false,
		is_ground_content = true,
		selection_box = {
			type = "fixed",
			fixed = {-0.2, -0.5, -0.2, 0.2, 0, 0.2}
		},
		groups = {snappy=2,dig_immediate=3,flammable=2,attached_node=1,plantculture=1},
		sounds = default.node_sound_leaves_defaults(),
	})
	--register abm
	minetest.register_abm({
		nodenames = {"plantculture:"..param.name},
		interval = param.interval,
		chance = param.chance,
		action = function(pos, node)
			local nu =  minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name
			local is_soil = minetest.get_item_group(nu, "soilculture")
			if is_soil == 0 then
				return
			end
			
			minetest.log("action",
				"A "..param.desc.." grows at "..minetest.pos_to_string(pos)
			)
			minetest.set_node(pos, {name=param.sapling})
		end,
	})
	--ragister crafting
	minetest.register_craft({
		output = 'plantculture:'..param.name..' '..param.crafting.sapling.amount,
		type = param.crafting.sapling.type or "",
		recipe = param.crafting.sapling.recipe
	})
	minetest.register_craft({
		output = 'plantculture:'..param.name..' '..param.crafting.trunk.amount,
		type = param.crafting.trunk.type or "",
		recipe = param.crafting.trunk.recipe
	})
	minetest.register_craft({
		output = 'plantculture:'..param.name..' '..param.crafting.leaf.amount,
		type = param.crafting.leaf.type or "",
		recipe = param.crafting.leaf.recipe
	})
end

--plantculture's soil
minetest.register_node("plantculture:soil",{
	description = "Sterilizated Soil",
	tiles = {
		"default_dirt.png","default_dirt.png^default_glass.png",
		"default_dirt.png^default_glass.png","default_dirt.png^default_glass.png",
		"default_dirt.png^default_glass.png","default_dirt.png^default_glass.png"
	},
	is_ground_content = true,
	groups = {crumbly=3,soil=1,soilculture=1},
	sounds = default.node_sound_dirt_defaults(),
})
minetest.register_craft({
	type = 'shapeless',
	output = 'plantculture:soil',
	recipe = {
		'default:dirt', 'default:glass', 'default:coal_lump'
	}
})
--End of API

--Register small sapling
plantculture.register({
	name = "small_sapling",
	desc = "Small Sapling",
	image = "plantculture_small_sapling.png",
	interval = 10,
	chance = 50,
	sapling = "default:sapling",
	crafting = {
		sapling = {
			amount = 4,
			recipe = {"default:sapling"},
			type = "shapeless"
		},
		trunk = {
			amount = 2,
			recipe = {
				"default:tree","default:tree","default:tree","default:tree",
				"default:tree","default:tree","default:tree","default:tree"
			},
			type = "shapeless"
		},
		leaf = {
			amount = 1,
			recipe = {
				"default:leaves","default:leaves","default:leaves","default:leaves",
				"default:leaves","default:leaves","default:leaves","default:leaves"
			},
			type = "shapeless"
		},
	},
})

--Register small jungle sapling
plantculture.register({
	name = "small_junglesapling",
	desc = "Small Jungle Sapling",
	image = "plantculture_small_junglesapling.png",
	interval = 10,
	chance = 50,
	sapling = "default:junglesapling",
	crafting = {
		sapling = {
			amount = 4,
			recipe = {"default:junglesapling"},
			type = "shapeless"
		},
		trunk = {
			amount = 2,
			recipe = {
				"default:jungletree","default:jungletree","default:jungletree","default:jungletree",
				"default:jungletree","default:jungletree","default:jungletree","default:jungletree"
			},
			type = "shapeless"
		},
		leaf = {
			amount = 1,
			recipe = {
				"default:jungleleaves","default:jungleleaves","default:jungleleaves","default:jungleleaves",
				"default:jungleleaves","default:jungleleaves","default:jungleleaves","default:jungleleaves"
			},
			type = "shapeless"
		},
	},
})