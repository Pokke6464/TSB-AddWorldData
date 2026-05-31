#> asset:spawner/4000/register
#
# スポナーの定義データ
#
# @within function asset_manager:spawner/register/register.m


execute unless loaded 68 20 -17 run return 1

# ID (int)
    data modify storage asset:spawner ID set value 4000
# Pos ([int] @ 3)
    data modify storage asset:spawner Pos set value [68, 20, -17]
# 体力 (int) このスポナーから召喚されたMobがN体殺されると破壊されるか
    data modify storage asset:spawner HP set value 1
# SpawnPotentials(int | int[] | ({ Weight: int, Id: int })[]) MobAssetのIDを指定する
    data modify storage asset:spawner SpawnPotentials set value [55, 182]
# 一度に召喚する数 (int)
    data modify storage asset:spawner SpawnCount set value 1
# 召喚範囲 (int)
    data modify storage asset:spawner SpawnRange set value 1
# 初回召喚時間 (int)
    data modify storage asset:spawner Delay set value 1
# 最低召喚間隔 (int)
    data modify storage asset:spawner MinSpawnDelay set value 1
# 最大召喚間隔 (int)
    data modify storage asset:spawner MaxSpawnDelay set value 1
# 近くのエンティティの最大数 (int)
    data modify storage asset:spawner MaxNearbyEntities set value 1
# この範囲にプレイヤーが存在するとき、Mobの召喚を開始する // distance <= 100
    data modify storage asset:spawner RequiredPlayerRange set value 1
