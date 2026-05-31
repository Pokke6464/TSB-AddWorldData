#> add_world_data:summon_marker.m
#
# プレイヤー検知用のマーカーを置く
#
# @within function add_world_data:tick

# マーカーを召喚
    $execute in $(Dimension) run summon marker $(Pos) {Tags:["WorldDataMarker"],data:{Type:$(Type),ID:$(ID)}}

# 使用したデータを消す
    data remove storage add_world_data: WorldDataList[-1]
    data remove storage add_world_data: Args

# リストが空になったら完全に消す
    execute unless data storage add_world_data: WorldDataList[] run data remove storage add_world_data: WorldDataList
