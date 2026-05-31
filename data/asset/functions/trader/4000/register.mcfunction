#> asset:trader/4000/register
#
# 商人の定義データ
#
# @within function asset_manager:trader/register/register.m

execute unless loaded 25 7 11 run return 1

# ID (int)
    data modify storage asset:trader ID set value 4000
# Pos ([int] @ 3)
    data modify storage asset:trader Pos set value [25, 7, 11]
# 名前 (TextComponent) (オプション)
    data modify storage asset:trader Name set value '{"text":"TEST"}'
# 方向 (float) (オプション)
    data modify storage asset:trader Rotation set value 0f

# 取引 テスト
    data modify storage asset:trader Trades append value {}
    data modify storage asset:trader Trades[-1].BuyA set value {id:"diamond",Count:1b}
    data modify storage asset:trader Trades[-1].BuyB set value {PresetItem:"currency/",Count:2b}
    data modify storage asset:trader Trades[-1].Sell set value {PresetItem:"currency/high",Count:1b}

# 取引 解呪進行率3%で解放
    data modify storage asset:trader Trades append value {}
    data modify storage asset:trader Trades[-1].BuyA set value 1285
    data modify storage asset:trader Trades[-1].Sell set value {PresetItem:"sacred_shard/lv-4",Count:64b}
    data modify storage asset:trader Trades[-1].RequiredProgress set value 3
