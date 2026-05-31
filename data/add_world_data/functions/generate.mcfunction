#> add_world_data:generate
#
# 指定された物を生成する
#
# @within function add_world_data:tick

# 読み込まれていない場合はreturn
    execute unless loaded ~ ~ ~ run return 0

# 自身(マーカー)のデータを基に生成する
    data modify storage world_manager:nexus_loader Args.ID set from entity @s data.ID
    function world_manager:nexus_loader/try_load_asset/m with entity @s data

# 消す
    kill @s
