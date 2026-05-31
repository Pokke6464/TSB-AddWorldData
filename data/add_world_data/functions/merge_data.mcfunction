#> add_world_data:merge_data
#
# 登録したデータを1つにまとめる
#
# @within function add_world_data:load

# 1つの配列に全てのタイプのデータをまとめる。このまとめられたものが自動生成に、まとめられていないものがデバッグ用コマンドで使用される
    data modify storage add_world_data: WorldDataList append from storage add_world_data: WorldData.spawner[]
    data modify storage add_world_data: WorldDataList append from storage add_world_data: WorldData.container[]
    data modify storage add_world_data: WorldDataList append from storage add_world_data: WorldData.trader[]
    data modify storage add_world_data: WorldDataList append from storage add_world_data: WorldData.island[]
    data modify storage add_world_data: WorldDataList append from storage add_world_data: WorldData.teleporter[]
