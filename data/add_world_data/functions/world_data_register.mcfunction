#> add_world_data:world_data_register
#
# 生成に必要なデータを登録する
#
# @within function 
#   add_world_data:load
#   add_world_data:debug/generate.m

# ID: 値
# Pos: "x y z"
# Dimension(省略可): "the_nether" | "the_end"

# テンプレート
# {ID:0, Pos:"0 0 0"}
# {ID:0, Pos:"0 0 0", Dimension:""}


# スポナーのIDと位置を登録
    data modify storage add_world_data: WorldData.spawner set value [{ID:4000, Pos:"68 20 -17"}, {ID:4001, Pos:"61 19 -23"}]

# 報酬のIDと位置を登録
    data modify storage add_world_data: WorldData.container set value [{ID:4000, Pos:"22 3 20"}, {ID:4001, Pos:"24 3 20"}]

# 商人のIDと位置を登録
    data modify storage add_world_data: WorldData.trader set value [{ID:4000, Pos:"25 7 11"}]

# 島(呪われた神器)のIDと位置を登録
    data modify storage add_world_data: WorldData.island set value [{ID:1234, Pos:"23 15 -26"}]

# テレポーターのIDと位置を登録
    data modify storage add_world_data: WorldData.teleporter set value [{ID:1234, Pos:"25 15 -26"}, {ID:4000, Pos:"3 99 77", Dimension:"the_nether"}]


# それが何なのかを識別できるようにするデータを追加
    execute if data storage add_world_data: WorldData.spawner[] run data modify storage add_world_data: WorldData.spawner[].Type set value "spawner"
    execute if data storage add_world_data: WorldData.container[] run data modify storage add_world_data: WorldData.container[].Type set value "container"
    execute if data storage add_world_data: WorldData.trader[] run data modify storage add_world_data: WorldData.trader[].Type set value "trader"
    execute if data storage add_world_data: WorldData.island[] run data modify storage add_world_data: WorldData.island[].Type set value "island"
    execute if data storage add_world_data: WorldData.teleporter[] run data modify storage add_world_data: WorldData.teleporter[].Type set value "teleporter"
