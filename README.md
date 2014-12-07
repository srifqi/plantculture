plantculture
============

Plant culture mod for Minetest

##License
For code: CC0 1.0 Universal (http://creativecommons.org/publicdomain/zero/1.0/)

For texture: CC BY-SA 4.0 (http://creativecommons.org/licenses/by-sa/4.0/)

##plantculture API
This mod includes an API

###```plantculture.register()```
Register a sapling

####Syntax
```lua
plantculture.register(param)
```
Where ```param``` is a table:
- ```name``` : an itemstring (```"plantculture:name"```)
- ```desc``` : the description text of the node
- ```image``` : the texture of the node (will be drawed ```'plantlike'```)
- ```interval``` : abm's interval
- ```chance``` : chance per interval
- ```sapling``` : the sapling that this node will grows up to
- ```crafting``` : a table that consist of ```sapling```, ```trunk```, ```leaf``` that consist of:
  - ```amount``` : amount of result
  - ```recipe``` : crafting recipe
  - ```type``` : crafting recipe type
  
####Example
```lua
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
```
