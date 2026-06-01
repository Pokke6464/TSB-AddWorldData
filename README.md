# TSB-AddWorldData
TSBのスポナーや報酬などを追加しやすくする二次創作。


## 概要
※このデータパックは「追加」をする物なので、既存の物の内容を変更したい場合は不要です。

TSBにはregisterを追加するだけでは反映されない、追加が困難な物が複数存在します。  
このデータパックでは追加した物のIDと位置を登録しておくことで最初にデータが入ったマーカーを配置し、  
プレイヤーがそのマーカーに近付くとデータを基に自動で指定された物を生成します。  
重い処理は最初に一気に行い、常時実行されるコマンドは2つだけ。

以下の5種類の物を追加できます。  
いずれもワールド内に配置される物なため、ここではこの5つをまとめて「ワールドデータ」と呼称します。  
・スポナー  
・報酬(チェスト、樽など)  
・商人  
・島(呪われた神器)  
・テレポーター


## 各対応Verや導入条件
Minecraft: v1.20.4  
The Sky Blessing: v1.0.6  
途中導入: 非推奨


## サンプルについて
サンプル(TSB_AddWorldData_Sample.zip)は使用例が含まれているバージョンです。  
最初の島と交易島にスポナー、報酬、商人、呪われた神器、テレポーターを追加しており、  
どのように記述するとどのようなことが可能なのかがわかるため、まずはサンプルを見ることをオススメします。  
※導入方法の部分で解凍不要と書いてありますが、中身のファイルを見る場合は解凍した方が見やすいです。


## 導入方法
TSB_AddWorldData_Sample.zipと、TSB_AddWorldData.zipの2種類が存在することに注意してください。  
最初はサンプルをダウンロードし、使用例を確認することを強く推奨します。

---
### [サンプル(使用例が含まれた物)を導入する場合]
1. ReleasesからTSB_AddWorldData_Sample.zipをダウンロード  
2. "一度もプレイしていない"TSBのワールドのdatapacksに、ダウンロードしたzipファイルを入れる(解凍不要)  

### [自分のデータパックに組み込みたい場合]
※組み込んだ場合は途中導入が非推奨になるため、配布の際はその旨を記載することを推奨します。  
1. ReleasesからTSB_AddWorldData.zipをダウンロード  
2. ダウンロードしたzipファイル内のadd_world_dataを、自身のデータパックのdataフォルダに入れる  
3. dataフォルダ内の`minecraft/tags/functions`内に`load.json`と`tick.json`を作成(既にある場合はこの手順は不要)  
4. `load.json`に`add_world_data:load`を、`tick.json`に`add_world_data:tick`を記述(記述方法はサンプルを参照)  
既に自身のデータパックにjsonファイルが存在していた場合は、カンマ(`,`)で区切って記述(改行すると見やすい)  
6. 追加したい物のデータを正しく記述

---
## 途中導入について
途中導入は非推奨と前述しましたが、途中導入で完全に機能しなくなる物はテレポーターのみとなっています。  
それ以外の物は途中導入でも生成されますが、スポナーや報酬はその位置にブロックがあれば上書きします。  
商人や呪われた神器を追加する場合は、途中導入は問題になりにくいです。


## ワールドデータの追加方法
最初にこの説明を読むよりも、前述のサンプルを参考にしつつ困った時に見るのがオススメです。

前提として、ここでは  
register = `asset/functions/ spawner|container|trader|island|teleporter /ID/register`  
world_data_register = `add_world_data/functions/world_data_register`  
とします。  

また、あくまでこのデータパックはregisterにデータを記述している物を配置するだけであり、  
registerが存在しないと配置できません。registerの追加方法は前述のサンプルを参考にしてください。

world_data_registerの`...WorldData.追加したい物 set value []`の`[]`の中に  
`{Type:"追加したい物(小文字)", ID:数値, Pos:"半角空白で区切った座標", Dimension:"ディメンション名"}`を記述します。  
IDとPosはregisterに記述されている物と一致させてください。  
**Dimensionは省略可能**で、省略した場合はoverworld(通常世界)に配置されます。  
アルファベットの大文字/小文字、ダブルクオーテーション(`"`)の有無に注意してください。


例として、IDが9000、位置が0 0 0のスポナーを追加する場合はworld_data_registerに以下のように記述します。  
```
...WorldData.spawner set value [{Type:"spawner", ID:9000, Pos:"0 0 0"}]
```

加えて、IDが9001、位置が0 1 0の物も追加したい場合は以下のように記述します。  
```
...WorldData.spawner set value [{Type:"spawner", ID:9000, Pos:"0 0 0"}, {Type:"spawner", ID:9001, Pos:"0 1 0"}]
```

更に加えて、IDが9002、位置が0 2 0、ディメンションがエンドの物も追加したい場合は以下のように記述します。  
```
...WorldData.spawner set value [{Type:"spawner", ID:9000, Pos:"0 0 0"}, {Type:"spawner", ID:9001, Pos:"0 1 0"}, {Type:"spawner", ID:9002, Pos:"0 2 0", Dimension:"the_end"}]
```


## デバッグ用のコマンドについて
デバッグ用のコマンドとして、`/function add_world_data:debug/generate.m`が存在します。  
これは指定した物を再生成するために使うもので、  
world_data_registerに登録されているTypeとIDを指定するだけで再生成が可能です。  
Typeにはspawner、container、trader、island、teleporterのいずれかを記述します。  
テレポーターの座標を変更してから再生成しても、テレポート位置は変化しないことに注意してください。

例として、IDが9000のスポナーを生成する場合は以下のように書きます。  
**Typeに書く文字は全て小文字**なことに注意してください。
```
/function add_world_data:debug/generate.m {Type:spawner,ID:9000}
```

## それぞれの詳しい情報や小技など
基本的な使い方はサンプルに使用例があるのでそれを参考に。

### [スポナー]
大抵のスポナーは  
`初回召喚時間(Delay)`が20  
`最低召喚間隔(MinSpawnDelay)`が80  
`最大召喚間隔(MaxSpawnDelay)`が180  
に設定されている。

`SpawnPotentials`は書き方がID単体、[]内にID、[]内の{}の中にIdとWeightを記述する3通りがあり、  
1つ目以外の書き方ではスポーンさせるモブを複数登録できる。  
3つ目の書き方では、Weightが高い方がスポーン確率が高くなる。  
例えば`[{Id:162,Weight:1},{Id:166,Weight:3}]`と書くと前者が低確率、後者が高確率でスポーンする。

### [報酬]
registerで指定するブロックは実はなんでも良い。dirtと書けばただの土が置かれたりする。

### [呪われた神器]
浄化された時に、自身と同じIDのテレポーターの起動状態をActivateに変更する。  
例えば、IDが1234の呪われた神器を浄化した場合、IDが1234のテレポーターが起動状態になる。

同じく浄化された時に、`island/(呪われた神器のID)/dispelled`を(存在するなら)実行する。  
これを使うことで専用アリーナがある島のように、浄化時にテレポーターの繋がりを増やすこともできる。  
ちなみに、このfunctionの実行者と実行座標は浄化された呪われた神器となっている。

浄化時にテレポーターの繋がりを増やしたい場合は以下が参考になる。  
https://github.com/ProjectTSB/Asset/blob/release/v1/Asset/data/asset/functions/island/25/dispelled.mcfunction

### [テレポーター]
テレポーターはregisterだけではなく、early_registerも必要。  
追加したearly_registerはassetの`tags/functions/teleporter/early_register`に登録しておく必要もある。  
これはテレポート先としてのデータで、テレポーター自体が未生成でも移動できるようにするために存在している。

early_registerの`GroupIDs`内に同じ文字列を持っているテレポーター同士が繋がる。大半はislandsが付いている。

`デフォルトの起動状態(ActivationState)`で設定できる3種類のそれぞれの意味は、  
InvisibleDeactivate: 透明で起動していない状態(大半のテレポーターの初期状態がこれ)  
VisibleDeactivate: 灰色で見えてはいるが起動していない状態  
Activate: 起動している状態  
となっている。

VisibleDeactivateはエンドのテレポーターで使用されており、これを起動するために  
エンド内ではプレイヤーから半径5マス以内に入ったテレポーターをActivateにする処理が常に実行されているので、  
エンドにテレポーターを追加する際は注意が必要。

通常のTSBの`テレポート先として見た時の色(Color)`で使われている色の数値は、  
デフォルトの白色: 255, 255, 255  
交易島などの水色: 128, 255, 255  
ボス専用アリーナの赤色: 255, 128, 128  
エンドの最奥などの紫色: 255, 128, 255  
となっている。行き先が別ディメンションの場合は、そのディメンション専用の色(緑/暗い赤/暗い紫)が優先される。

registerやworld_data_registerに登録せず、early_registerにのみ登録すると、  
その場所は一方通行のテレポート先になる。(early_registerに移動先にした時の情報が全てあるため)