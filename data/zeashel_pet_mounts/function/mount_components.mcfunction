# mount invisible armor stand on invisible boat first (so pet sits on the back of the boat)
ride @e[type=armor_stand,tag=zeashel_pet_mounts.placeholder_h8dABkQm,limit=1,sort=nearest] mount @e[type=acacia_boat,tag=zeashel_pet_mounts.placeholder_h8dABkQm,limit=1,sort=nearest] 

# mount the nearest cat (later: or wolf) with Owner NBT on invisible boat after
execute as @e[type=acacia_boat,tag=zeashel_pet_mounts.placeholder_h8dABkQm,limit=1,sort=nearest] at @s run ride @e[type=minecraft:cat,limit=1,distance=..10,sort=nearest] mount @s

# then mount the boat (with the armor stand and pet) onto the horse
ride @e[type=acacia_boat,tag=zeashel_pet_mounts.placeholder_h8dABkQm,limit=1,sort=nearest] mount @e[type=minecraft:horse,limit=1,sort=nearest]
 