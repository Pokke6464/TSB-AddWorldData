#> asset:island/1234/dispelled
# @within function asset_manager:island/dispel/dispelled.m

# ブロック設置
    setblock 23 14 -20 jigsaw
    fill 24 14 -20 42 14 -20 magenta_glazed_terracotta[facing=west]

# テレポート
    execute as @a[distance=..10] in the_nether run tp @s -5 98 73 -90 0
