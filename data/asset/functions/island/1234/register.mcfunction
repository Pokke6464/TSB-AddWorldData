#> asset:island/1234/register
#
# 島の定義データ
#
# @within function asset_manager:island/register/register.m


execute unless loaded 23 15 -26 run return 1

# ID (int)
    data modify storage asset:island ID set value 1234
# Pos ([int] @ 3)
    data modify storage asset:island Pos set value [23, 15, -26]
# Rotation (float)
    data modify storage asset:island Rotation set value 0f
# BOSS ID (int) (Optional)
    # data modify storage asset:island BossID set value 
# BossDatapack (string) (Optional)
    # data modify storage asset:island BossDatapack set value ""
