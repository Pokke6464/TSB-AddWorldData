#> add_world_data:load
#
# #load時に初回ならデータを登録する
#
# @within tag/function minecraft:load

# 既に実行済みならreturn
    execute if data storage add_world_data: {FirstJoin:1b} run return 0

# 追加に必要なデータを登録する
    function add_world_data:world_data_register

# 登録したデータを1つにまとめる
    function add_world_data:merge_data

# 二度と実行されないようにする
    data modify storage add_world_data: FirstJoin set value 1b
