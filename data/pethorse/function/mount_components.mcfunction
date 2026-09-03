# mount invisible armor stand on invisible boat first (so pet sits on the back of the boat)
ride @e[type=armor_stand,tag=placeholder_zeashel_prh8dABkQm,limit=1,sort=nearest] mount @e[type=acacia_boat,tag=placeholder_zeashel_prh8dABkQm,limit=1,sort=nearest] 

# mount the nearest cat (later: or wolf) with Owner NBT on invisible boat after
execute as @e[type=minecraft:cat,distance=...10,limit=1] run ride @s mount @e[type=acacia_boat,tag=placeholder_zeashel_prh8dABkQm,limit=1,sort=nearest]

# then mount the boat (with the armor stand and pet) onto the horse
ride @e[type=acacia_boat,tag=placeholder_zeashel_prh8dABkQm,limit=1,sort=nearest] mount @e[type=minecraft:horse,limit=1,sort=nearest]
 