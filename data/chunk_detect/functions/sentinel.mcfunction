# Must be run @as a sentinel

execute store result score #chunk_x chunk_detect run data get entity @s Pos[0]
execute store result score #chunk_z chunk_detect run data get entity @s Pos[2]

scoreboard players operation #chunk_x chunk_detect /= #chunk_size chunk_detect
scoreboard players operation #chunk_z chunk_detect /= #chunk_size chunk_detect

function #chunk_detect:chunk_generated

kill @s