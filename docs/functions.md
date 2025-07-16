# 脚本函数文档

> 本文档自动生成，涵盖 `scripts/` 目录下主要GML函数。参数说明和功能简述基于源码注释和命名推断。

## 数学与工具函数 (scr_math)

| 函数名 | 参数 | 说明 |
| ------ | ---- | ---- |
| pos_to_ang | _x1, _y1, _x2, _y2, _returnNumb=false | 返回两个点的方向字符串或编号 |
| existence_to_numb | __numberExistence=0 | 根据numberExistence返回队伍中的索引 |
| string_to_color | _string="red" | 颜色名转颜色常量 |
| hex_to_dec | _hex | 十六进制字符串转十进制数 |
| get_keybind | _numb, _brackets=true, _forceKeyboardText=false, _isForPrint=false | 获取按键绑定的字符串表示 |
| get_gamepadBind | _gp | 获取手柄按键的图片索引 |
| ability_amount | _ability | 统计队伍中某能力的数量 |

## 文本渲染函数 (scr_text)

| 函数名 | 参数 | 说明 |
| ------ | ---- | ---- |
| print | _text="Skip", _x=0, _y=0, _font=fDetermination, _sep=12, _width=320, _xscale=1, _yscale=1, _angle=0, _c1=c_white, _c2=c_white, _c3=c_white, _c4=c_white, _alpha=1, _seed=[], _sprites=-1 | 在绘制事件中绘制比例文本，支持中英文混合 |
| start_cutscene | _struct_text, _forceTextWait=0, _continueOrders=false | 开始过场动画 |
| anything_cutscene | _dialogue=["Test"], _func=-1, _face=[-1] | 快速创建过场动画 |
| get_text | _realText | 从csv文档返回一个数组 |
| get_text_string | _realText | 从csv文档返回单个字符串 |

## 音频控制函数 (scr_sound)

| 函数名 | 参数 | 说明 |
| ------ | ---- | ---- |
| music | _soundid, _force=false, _loops=true | 开始播放新音乐并停止之前的音乐 |
| music_fade | _soundid=op.currentMusic, _level=0, _time=1000, _stop=false | 淡出音乐 |
| music_stop | _soundid=op.currentMusic | 停止音乐 |
| sound | _soundid=-1, _loops=false, _stopSoundid=false | 播放音效 |

## 队伍管理函数 (scr_party)

| 函数名 | 参数 | 说明 |
| ------ | ---- | ---- |
| reset_party_position | _keepPos=false | 重置所有队员位置到Kris上方 |
| party_lerp | 无 | 让队伍在过场动画后无缝走回队列 |
| party_heal | _numb=0, _amount=[100], _everyone=false, _autoHeal=false | 增加队员生命值 |
| party_damage | _numb=0, _amount=100 | 减少队员生命值 |
| set_party_stats | _numb=1, _hpMax=100, _attack=0, _defense=0, _magic=0, _guts=3, _level=1, _weapon, _armor1=-1, _armor2=-1, _spells=[] | 强制设置队员属性 |

## 结构体管理函数 (scr_structs)

| 函数名 | 参数 | 说明 |
| ------ | ---- | ---- |
| struct | _struct_text | 基于字符串创建结构体并放入str变量 |
| has_struct | _array, _struct_text | 检查数组是否包含结构体 |
| add_party | _struct_text | 添加队员到队伍 |
| remove_party | __numberExistence | 从队伍中移除队员 |
| add_item | _struct_text, _key=false, _cc=false | 添加物品到暗世界背包 |
| add_weapon | _struct_text, _cc=false | 添加武器到背包 |
| add_armor | _struct_text, _cc=false | 添加防具到背包 |
| add_money | _money=1, _cc=false | 增加金钱 |
| add_spell | _pep, _struct_text | 为当前队伍中的队员添加法术 |
| equip_item | _pep=0, _spot=0, _grab=0 | 装备物品 |
| add_itemlight | _struct_text | 添加亮面物品 |
| add_cell | _struct_text | 添加手机 |
| create_shop | _struct_text="shop_base", _quickShop=false | 创建商店 |
| auto_kris_reaction | _array=["(Susie item Text)","(Ralsei item Text)"] | 自动生成Kris反应文本 |

## 结构体更新函数 (scr_structsUpdate)

| 函数名 | 参数 | 说明 |
| ------ | ---- | ---- |
| updatestruct_items | 无 | 更新所有物品数组中的结构体 |
| updatestruct_party | 无 | 更新队伍数组中的结构体 |

## 模式生成函数 (scr_pattern)

| 函数名 | 参数 | 说明 |
| ------ | ---- | ---- |
| pattern_objects | _boxX=160, _boxY=85, _boxXscale=74, _boxYscale=74, _timer=100, _spawnSoul=true, _soulMode="red", _spawnBox=true | 生成模式对象 |
| spawn_bullet_ext | _sprite=sBullet, _subimg=0, _x=0, _y=0, _xscale=1, _yscale=1, _imageAngle=0, _direction=0, _col=c_white, _alpha=1, _walkXY=[0,0,0,0,10], _tp=1, _damage=-1, _seed=[] | 生成扩展子弹 |
| spawn_bullet | _sprite=sBullet, _subimg=0, _x=0, _y=0, _walkXY=[0,0,0,0,10], _damage=-1, _seed=[] | 生成子弹 |

## 变体函数 (scr_variant)

| 函数名 | 参数 | 说明 |
| ------ | ---- | ---- |
| variant_csv | 无 | 加载包含的csv文档 |
| variant_face_match | _face | 根据当前使用的头像自动设置语音 |
| variant_face_offset | 无 | 偏移对话头像 |
| variant_white_symbols | 无 | 返回白色符号列表 |
| variant_novoice_symbols | 无 | 返回无声音符号列表 |
| variant_font | _font | 设置字体等宽宽度 |
| variant_recruits | _chapter | 决定招募背景颜色 |
| variant_fightheads | 无 | 战斗头像变体 |
| variant_shortcutdoor | 无 | 快捷门变体 |

## 过渡效果函数 (scr_transition)

| 函数名 | 参数 | 说明 |
| ------ | ---- | ---- |
| transition | _mode="fade", _func=-1, _func2=-1 | 执行过渡效果 |

## 游戏状态函数 (scr_op)

| 函数名 | 参数 | 说明 |
| ------ | ---- | ---- |
| declare_gamestats | 无 | 声明并重置游戏主要状态 |

## 变量重置函数 (scr_variables)

| 函数名 | 参数 | 说明 |
| ------ | ---- | ---- |
| res_i | 无 | 重置i系列变量 |
| res_j | 无 | 重置j系列变量 |
| res_k | 无 | 重置k系列变量 |
| res_u | 无 | 重置u系列变量 |
| res_all | 无 | 重置所有变量 |

## 动画存储函数 (scr_store_animations)

| 函数名 | 参数 | 说明 |
| ------ | ---- | ---- |
| an_kris_walk | 无 | 返回Kris行走动画数组 |
| an_susie_walk | 无 | 返回Susie行走动画数组 |
| an_ralsei_walk | 无 | 返回Ralsei行走动画数组 |
| an_noelle_walk | 无 | 返回Noelle行走动画数组 |
| an_queen_walk | 无 | 返回Queen行走动画数组 |
| an_lancer_walk | 无 | 返回Lancer行走动画数组 |
| draw_ene_test | 无 | 绘制测试敌人 |
| draw_ene_jevil | 无 | 绘制Jevil敌人 |

## 菜单控制函数 (scr_menu)

| 函数名 | 参数 | 说明 |
| ------ | ---- | ---- |
| reset_cursor | 无 | 重置光标 |
| use_cursor | 无 | 使用光标 |
| force_undo | _amount=1 | 强制撤销函数 |
| vertical_cursor | _length=1 | 垂直光标 |
| horizontal_cursor | _length=1 | 水平光标 |
| wide_cursor | _length=1 | 宽光标 |
| prompt | _func=[-1], _text=["Skip"], _xy=-1, _width=-1, _fa=["L"], _autoDimensions=-1 | 提示框 |
| numberPrompt | _numberArray=[1,2,3,4], _maxNumber=9, _func=-1 | 数字提示框 |

## 控制函数 (scr_control)

| 函数名 | 参数 | 说明 |
| ------ | ---- | ---- |
| master_reset | 无 | 主重置函数 |
| update_allData | 无 | 更新所有数据 |
| update_stats | 无 | 更新状态 |
| add_progress | _value | 添加进度 |
| has_progress | _value | 检查是否有进度 |
| menu_room | 无 | 菜单房间 |

---

## 函数分类说明

### 核心系统函数
- **数学工具**: 坐标转换、颜色处理、按键绑定等
- **文本渲染**: 支持中英文混合的文本绘制系统
- **音频控制**: 音乐和音效的播放、停止、淡出等
- **队伍管理**: 队员的生命值、位置、装备等管理

### 结构体管理函数
- **结构体操作**: 创建、检查、添加各种游戏对象
- **物品系统**: 物品、武器、防具的添加和管理
- **商店系统**: 商店创建和物品交易

### 游戏逻辑函数
- **模式生成**: 战斗模式、子弹生成等
- **过渡效果**: 场景切换和动画效果
- **菜单控制**: 各种UI交互和光标控制

### 工具函数
- **变量重置**: 临时变量的清理和管理
- **动画存储**: 角色动画数组的预定义
- **变体函数**: 游戏内容的本地化和个性化

---

> 注意：所有函数参数均采用下划线前缀命名规范，返回值多为void或特定数据类型。函数注释风格不统一，部分有详细说明，部分需结合命名和上下文推断功能。 