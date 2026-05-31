#> add_world_data:tick
#
# 常時実行部分
#
# @within tag/function minecraft:tick

# プレイヤーが近づいたマーカーのデータから指定された物を生成
    execute at @a[sort=random,limit=4] as @e[type=marker,tag=WorldDataMarker,distance=..64,sort=nearest,limit=1] at @s run function add_world_data:generate

# リストが無ければreturn
    execute unless data storage add_world_data: WorldDataList run return 0

# リストの一番後ろのデータを持ったマーカーを配置する
    # データを取得
        data modify storage add_world_data: Args set from storage add_world_data: WorldDataList[-1]
    # ディメンションが未設定ならオーバーワールドにする
        execute unless data storage add_world_data: Args.Dimension run data modify storage add_world_data: Args.Dimension set value "overworld"
    # 召喚
        function add_world_data:summon_marker.m with storage add_world_data: Args
