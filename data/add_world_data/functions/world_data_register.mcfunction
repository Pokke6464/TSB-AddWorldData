#> add_world_data:world_data_register
#
# 生成に必要なデータを登録する
#
# @within function 
#   add_world_data:load
#   add_world_data:debug/generate.m

# スポナーのIDと位置を登録
    data modify storage add_world_data: WorldData.spawner set value [{Type:"spawner", ID:4000, Pos:"68 20 -17"}, {Type:"spawner", ID:4001, Pos:"61 19 -23"}]

# 報酬のIDと位置を登録
    data modify storage add_world_data: WorldData.container set value [{Type:"container", ID:4000, Pos:"22 3 20"}, {Type:"container", ID:4001, Pos:"24 3 20"}]

# 商人のIDと位置を登録
    data modify storage add_world_data: WorldData.trader set value [{Type:"trader", ID:4000, Pos:"25 7 11"}]

# 島(呪われた神器)のIDと位置を登録
    data modify storage add_world_data: WorldData.island set value [{Type:"island", ID:1234, Pos:"23 15 -26"}]

# テレポーターのIDと位置を登録
    data modify storage add_world_data: WorldData.teleporter set value [{Type:"teleporter", ID:1234, Pos:"25 15 -26"}, {Type:"teleporter", ID:4000, Pos:"3 99 77", Dimension:"the_nether"}]
