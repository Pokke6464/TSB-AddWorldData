#> asset:spawner/4001/register
#
# スポナーの定義データ
#
# @within function asset_manager:spawner/register/register.m


execute unless loaded 61 19 -23 run return 1

# ID (int)
    data modify storage asset:spawner ID set value 4001
# Pos ([int] @ 3)
    data modify storage asset:spawner Pos set value [61, 19, -23]
# 体力 (int) このスポナーから召喚されたMobがN体殺されると破壊されるか
    data modify storage asset:spawner HP set value 30
# SpawnPotentials(int | int[] | ({ Weight: int, Id: int })[]) MobAssetのIDを指定する
    data modify storage asset:spawner SpawnPotentials set value [{Id:162,Weight:1},{Id:166,Weight:3}]
# 一度に召喚する数 (int)
    data modify storage asset:spawner SpawnCount set value 1
# 召喚範囲 (int)
    data modify storage asset:spawner SpawnRange set value 5
# 初回召喚時間 (int)
    data modify storage asset:spawner Delay set value 1
# 最低召喚間隔 (int)
    data modify storage asset:spawner MinSpawnDelay set value 5
# 最大召喚間隔 (int)
    data modify storage asset:spawner MaxSpawnDelay set value 5
# 近くのエンティティの最大数 (int)
    data modify storage asset:spawner MaxNearbyEntities set value 20
# この範囲にプレイヤーが存在するとき、Mobの召喚を開始する // distance <= 100
    data modify storage asset:spawner RequiredPlayerRange set value 15
