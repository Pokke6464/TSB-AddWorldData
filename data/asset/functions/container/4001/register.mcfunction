#> asset:container/4001/register
#
# コンテナの定義データ
#
# @within function asset:container/4001/


execute unless loaded 24 3 20 run return 1

# ID (int)
    data modify storage asset:container ID set value 4001
# Pos ([int] @ 3)
    data modify storage asset:container Pos set value [24, 3, 20]
# ブロック (id(minecraft:block))
    data modify storage asset:container Block set value "minecraft:barrel[facing=up]"

# 以下はどちらかしか設定できない
# ルートテーブル (id(minecraft:loot_table)) (オプション)
    # data modify storage asset:container LootTable set value "undefined"
# アイテム ([id(minecraft:loot_table)] オプション)
    data modify storage asset:container Items set value [{Slot:0b,Item:{id:"diamond",Count:1b}}, {Slot:1b,Item:{PresetItem:"currency/",Count:2b}}, {Slot:2b,Item:{PresetItem:"currency/high",Count:3b}}, {Slot:3b,Item:{PresetItem:"sacred_shard/lv-1",Count:4b}}, {Slot:4b,Item:{PresetItem:"sacred_shard/red/lv-4",Count:5b}}, {Slot:5b,Item:1285}, {Slot:26b,Item:{id:"white_wool",Count:64b}}]