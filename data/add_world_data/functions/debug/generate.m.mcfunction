#> add_world_data:debug/generate.m
#
# 指定した物を生成する
#
# @input args:
#   Type: strings
#   ID: int
# @private
# @user

# データの編集に対応するために更新
    function add_world_data:world_data_register

# エラーメッセージ
    $execute unless data storage add_world_data: WorldData.$(Type) run return run tellraw @s [{"storage":"global","nbt":"Prefix.ERROR"},{"text":"その Type は存在しません。","color":"white"}]
    $execute if data storage add_world_data: WorldData.$(Type) unless data storage add_world_data: WorldData.$(Type).[{ID:$(ID)}] run return run tellraw @s [{"storage":"global","nbt":"Prefix.ERROR"},{"text":"その ID は存在しません","color":"white"}]

# 召喚に必要なデータを取得
    $data modify storage add_world_data: Args.Type set value $(Type)
    $data modify storage add_world_data: Args.ID set value $(ID)
    $data modify storage add_world_data: Args.Pos set from storage add_world_data: WorldData.$(Type).[{ID:$(ID)}].Pos
    $data modify storage add_world_data: Args.Dimension set from storage add_world_data: WorldData.$(Type).[{ID:$(ID)}].Dimension
    # ディメンションが未設定ならオーバーワールドにする
        execute unless data storage add_world_data: Args.Dimension run data modify storage add_world_data: Args.Dimension set value "overworld"

# DPRから削除
    $data remove storage world_manager:nexus_loader DPR.$(Type).$(ID)

# マーカーを召喚
    function add_world_data:summon_marker.m with storage add_world_data: Args

# リセット
    data remove storage add_world_data: Args
