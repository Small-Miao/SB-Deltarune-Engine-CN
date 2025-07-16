# 结构体文档

> 本文档自动生成，涵盖 `scripts/` 目录下主要GML结构体。属性说明和功能简述基于源码注释和命名推断。

## 基础结构体

### cc_base (对话/过场动画基类)

**继承关系**: 无父类，所有对话结构体的基类

| 属性 | 类型 | 说明 | 默认值/示例 |
| ---- | ---- | ---- | ----------- |
| _dialogue | 数组 | 对话文本数组 | get_text("t_bakesale") |
| _x, _y | 数组 | 对话框坐标 | [12], [1] 或 [156] |
| _xScale, _yScale | 数组 | 对话框缩放 | [296.5], [83.5] |
| _face, _faceAnimate | 数组 | 头像及动画 | [-1], [-1] |
| _font | 数组 | 字体 | [fDetermination] |
| _voice | 数组 | 声音 | [txt_text] |
| _textSpeed | 数组 | 文字速度 | [1] |
| _hideBox | 数组 | 隐藏对话框标志 | [0] |
| _seed | 数组 | 随机种子/自定义数据 | [] |
| _match | 布尔值 | 头像与声音自动匹配 | true |
| _box, _arrow | 数组 | 对话框类型与箭头 | [0], [-1] |
| _color, _jump | 数组 | 保留字段 | [] |
| _shopSprite | 数组 | 商店头像 | [-1] |
| _asteriskFace | 数组 | 星号头像 | [-1] |
| _printSeed | 数值/数组 | 打印种子 | -1 |
| _func, _funcLine, _funcAny | 函数/数组 | 回调函数 | -1, [], [] |
| _boxOffsetXY, _xOffset, _yOffset | 数组/数值 | 偏移量 | [17,18], 0, 18 |
| _moveAfter | 布尔值 | 是否可移动 | true |
| _proceedAnimate, _proceedAuto, _autoSkipText | 混合 | 自动推进相关 | -1, 0, [-1] |
| _moneyBox | 布尔值 | 显示金钱栏 | false |

**特殊说明**: 
- 战斗模式下会自动调整基础值
- 商店模式下会更改基础值
- 支持中英文混合文本渲染

---

### item_base (物品基类)

**继承关系**: 无父类，所有物品结构体的基类

| 属性 | 类型 | 说明 | 默认值/示例 |
| ---- | ---- | ---- | ----------- |
| _infoText | 数组 | 物品信息文本（名称、描述等） | ["Item Name","Overworld title","Battle title","Ability Name"] |
| _lightName | 字符串 | 亮面名称 | "LIGHTNAME" |
| _shopDescription | 字符串 | 商店描述 | "Shop Description" |
| _reactionText | 数组 | 角色使用反应文本 | ["","(Susie item Text)","(Ralsei item text)"] |
| _customBattleText | 混合 | 自定义战斗文本 | -1 |
| _numberExistence | 数值 | 唯一编号 | -1 |
| _attack, _defense, _magic | 数值 | 属性加成 | 0, 0, 0 |
| _heal | 数组 | 恢复量 | [100] |
| _tp | 数值 | 战斗TP加成 | 0 |
| _price | 数值 | 售价 | 100 |
| _imageIndex | 数值 | 图标索引 | -1 |
| _ability, _abilityImage | 混合/数值 | 赋予能力及其图标 | -1, 5 |
| _isKeyitem | 布尔值 | 是否为关键物品 | false |
| _seed | 数组 | 额外数据 | [] |
| _canSelect, _canSell | 布尔值 | 可选/可售标志 | true, true |
| _cantHave, _forceReact | 数组 | 限制与强制反应 | [], [] |
| _removeItem | 布尔值 | 使用后移除 | true |
| _sound | 数值 | 使用音效 | -1 |
| _func | 函数/数值 | 使用时触发函数 | -1 |
| _info, _drop | 混合 | 其他信息 | -1, -1 |

**特殊说明**: 
- 支持自动生成Kris反应文本
- 可设置影响全队的物品效果

---

### pep_base (角色基类)

**继承关系**: 无父类，所有角色结构体的基类

| 属性 | 类型 | 说明 | 默认值/示例 |
| ---- | ---- | ---- | ----------- |
| _infoText | 数组 | 角色信息文本（名称、称号） | ["Name","Title"] |
| _spriteWalk, _spriteIdle, _spriteFight 等 | 精灵/数组 | 角色各状态下的精灵 | an_kris_walk() |
| _numberExistence | 数值 | 唯一编号 | 0 |
| _isDarkner | 布尔值 | 是否为暗之民 | false |
| _attributeText, _attributeImage, _attributeValue, _attributeSymbols | 数组 | 属性相关 | ["AAA","BBB"], [2,2], [10,20], [0,0] |
| _greedText | 数组 | 装备偏好文本 | ["Weapon (NO)","Armor (NO)"] |
| _UIcolor, _UIface | 颜色/精灵 | UI颜色与头像 | c_red, sKris_Face |
| _buttons | 数组 | 可用按钮列表 | [0,1,2,3,4] |
| _damageColor, _actionColor | 颜色 | 受伤/行动颜色 | c_red, c_red |
| _soulOffset | 数值 | 灵魂偏移量 | 14 |
| _drawPower | 函数/数值 | 绘制能力 | -1 |
| _lockSpell, _lockToType | 混合/数值 | 锁定法术及类型 | -1, 0 |
| _killChange | 数组 | 击杀数据变化回调 | [function(_numb){...}, ...] |

**特殊说明**: 
- Kris=0, Susie=1, Ralsei=2，新增角色需要不同编号
- 支持自定义绘制函数
- 击杀数据变化支持回调函数

---

### enemy_base (敌人基类)

**继承关系**: 无父类，所有敌人结构体的基类

| 属性 | 类型 | 说明 | 默认值/示例 |
| ---- | ---- | ---- | ----------- |
| _name | 字符串 | 显示名称 | "Skip Name" |
| _spriteWalk, _spriteTouch, _spriteGlide, _spriteIdle 等 | 精灵 | 敌人各状态下的精灵 | sEB_Walk |
| _drawFunc | 函数/字符串 | 自定义绘制函数 | -1 |
| _textRandom, _flavourRandom, _flavourTired, _flavourSpare | 数组/字符串 | 随机文本与风味文本 | [["Text Random 0",100], ...] |
| _checkText | 数组 | 检查文本 | ["Check text default."] |
| _boubleOffsetXY, _slashOffsetXY | 数组 | 气泡/斜线偏移 | [-40,-20], [0,-20] |
| _reactionDistance, _reactionTime, _runSpeed, _exclamationOffset | 数值 | 遭遇相关参数 | 40, 30, 3, -50 |
| _spells | 数组 | 可用法术列表 | ["spell_dothing1","spell_dothing2","spell_dothing3","spell_dothing4"] |
| _hp, _attack, _defense, _money | 数值 | 属性数值 | 300, 10, 0, 100 |
| _handler | 对象 | 行为处理对象 | oHandler_Basic |
| _patterns | 数组 | 攻击模式列表 | [pattern1,pattern2,pattern3] |
| _recRequiredAmount, _recChapter, _recLV, _recElement | 数值/字符串 | 招募相关参数 | 5, 0, 3, "CAT" |
| _infoText | 数组 | 说明文本 | ["(Description)","attribute (LIKE)","attribute (DISLIKE)"] |
| _recSprite, _recDivide | 精灵/数值 | 招募相关精灵与分割数 | sKris_Down, 5 |

**特殊说明**: 
- 支持自定义绘制函数
- 招募系统有完整的参数配置

---

### spell_base (法术基类)

**继承关系**: 无父类，所有法术结构体的基类

| 属性 | 类型 | 说明 | 默认值/示例 |
| ---- | ---- | ---- | ----------- |
| _infoText | 数组 | 法术信息文本 | ["Name","Skip line 1",-1] |
| _tp | 数值 | 消耗TP | 0 |
| _partyHelp | 数组 | 需要协助的队员编号 | [] |
| _extraHeads | 数组 | 额外协助者 | [] |
| _selectType | 数值 | 选择类型（0即时/1敌人/2队友） | 2 |
| _isPacify | 布尔值 | 是否为安抚法术 | false |
| _alert | 布尔值 | 是否高亮提示可用 | false |
| _object | 对象 | 关联对象 | oSpell_Template |

**特殊说明**: 
- 支持多人协助的法术
- 可选择类型影响目标选择

---

### shop_base (商店基类)

**继承关系**: 无父类，所有商店结构体的基类

| 属性 | 类型 | 说明 | 默认值/示例 |
| ---- | ---- | ---- | ----------- |
| _textMain | 数组 | 主要文本 | ["Buy","Sell","Talk","Exit"] |
| _textExit | 数组 | 退出文本 | ["Exit","Return","Exit"] |
| _textFlavour | 数组 | 风味文本 | ["* Flavour text enter shop.","* Flavour text exit back to main page."] |
| _textBuy | 数组 | 购买相关文本 | ["What would you like to buy?",...] |
| _textSell | 数组 | 出售相关文本 | ["Pick sell text.",...] |
| _textTalk | 字符串 | 对话文本 | "Let's talk about stuff." |
| _textLeave | 数组 | 离开文本 | ["* See you later goodbye everyone.",...] |
| _textTalkOptions | 数组 | 对话选项 | [["Talk 0","Talk 0(2)"],...] |
| _cutsceneTalk | 数组 | 对话过场动画 | [["cc_base","cc_test1"],...] |
| _items | 数组 | 商品列表 | ["item_burger","item_sharpAx",...] |
| _soldOut | 数组 | 售罄状态 | [false,false,true,false] |
| _music | 音频 | 背景音乐 | mus_sneaking |
| _mainButtons | 数组 | 主要按钮 | [0,1,2] |
| _voice | 音频 | 语音 | txt_text |
| _seed | 数组 | 额外数据 | [] |
| _spriteIdle | 精灵 | 空闲精灵 | sSeam1 |
| _spriteFlavour, _spriteBuy, _spriteSell | 数组 | 各种精灵 | [-1,-1], [-1,-1,-1,-1,-1], [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1] |
| _draw | 函数 | 绘制函数 | function(){...} |

**特殊说明**: 
- 支持完整的商店交互系统
- 包含购买、出售、对话、离开等完整流程

---

## 继承结构体

### 对话结构体 (继承自cc_base)

| 结构体名 | 说明 | 特殊属性 |
| -------- | ---- | -------- |
| cc_anything | 通用对话，可快速设置值 | 使用op.textCC, op.funcCC, op.faceCC |
| cc_test1 | 测试对话1 | 包含中文测试和特殊效果 |
| cc_test2 | 测试对话2 | 中文测试，使用fade动画 |
| cc_test3 | 测试对话3 | 使用csv文档，支持动态坐标 |
| cc_test4 | 测试对话4 | 使用csv文档 |
| cc_push1 | 推箱子对话 | 复杂的过场动画和角色动画 |
| cc_gameOver | 游戏结束对话 | 游戏结束相关 |
| cc_youWon | 胜利对话 | 胜利相关 |
| cc_giveUp | 放弃对话 | 放弃相关 |
| cc_flavourText | 风味文本对话 | 风味文本相关 |
| cc_shopExit | 商店退出对话 | 商店退出相关 |
| cc_shopFlavour | 商店风味对话 | 商店风味文本 |
| cc_shopThin | 商店精简对话 | 商店精简版本 |
| cc_itemChest | 物品箱对话 | 物品箱相关 |
| cc_cellPhone | 手机对话 | 手机相关 |
| cc_bouble_basic | 基础气泡对话 | 基础气泡效果 |

### 角色结构体 (继承自pep_base)

| 结构体名 | 说明 | 特殊属性 |
| -------- | ---- | -------- |
| pep_kris | Kris角色 | _numberExistence=0, _seed=["act"], 特殊绘制函数 |
| pep_susie | Susie角色 | _numberExistence=1, _seed=["greed"], 紫色主题 |
| pep_ralsei | Ralsei角色 | _numberExistence=2, _isDarkner=true, 绿色主题 |

### 敌人结构体 (继承自enemy_base)

| 结构体名 | 说明 | 特殊属性 |
| -------- | ---- | -------- |
| enemy_jevil | Jevil敌人 | 特殊绘制函数draw_ene_jevil |
| enemy_viro | Virovirokun敌人 | _hp=75, _attack=20, _defense=5 |
| enemy_ambu | Ambu敌人 | 基础敌人配置 |

### 法术结构体 (继承自spell_base)

| 结构体名 | 说明 | 特殊属性 |
| -------- | ---- | -------- |
| spell_check | 检查法术 | _object=oSpell_Check |
| spell_healPrayer | 治疗祈祷 | 治疗相关 |
| spell_ultimateHeal | 终极治疗 | 终极治疗相关 |
| spell_rudeBuster | 粗鲁破坏者 | 攻击法术 |
| spell_pacify | 安抚法术 | _isPacify=true |
| spell_plus | 加号法术 | 增益法术 |
| spell_standard | 标准法术 | 标准配置 |
| spell_dothing1-4 | 做事情1-4 | 通用动作法术 |

### 物品结构体 (继承自item_base)

#### 食物物品 (a_food_items)
| 结构体名 | 说明 | 特殊属性 |
| -------- | ---- | -------- |
| item_burger | 汉堡 | _heal=[60,100], _price=110, _customBattleText="YUM YUM BURGER" |
| item_pinecone | 松果 | _heal=[3], _price=56, 特殊反应文本 |

#### 武器物品 (b_weapon_items)
| 结构体名 | 说明 | 特殊属性 |
| -------- | ---- | -------- |
| item_maneAx | 鬃毛斧 | _numberExistence=1 |
| item_redScarf | 红围巾 | _numberExistence=2 |
| item_sharpAx | 锋利斧 | _attack=999, 特殊反应 |
| item_sharpBlade | 锋利刀 | _attack=2, _defense=2, _magic=2, _ability="morecut" |
| item_woodBlade | 木刀 | _attack=4, _defense=1, _magic=6 |
| item_fireSword | 火焰剑 | _imageIndex=2 |

#### 防具物品 (c_armor_items)
| 结构体名 | 说明 | 特殊属性 |
| -------- | ---- | -------- |
| item_amberCard | 琥珀卡 | 基础防具 |
| item_whiteRibbon | 白丝带 | 基础防具 |
| item_sparkle | 闪光 | 基础防具 |

#### 特殊物品 (d_special_items)
| 结构体名 | 说明 | 特殊属性 |
| -------- | ---- | -------- |
| item_cellPhone | 手机 | 关键物品 |
| item_ballOfJunk | 垃圾球 | 特殊物品 |

---

## 结构体分类说明

### 核心系统结构体
- **对话系统**: cc_base及其子类，支持复杂的对话和过场动画
- **物品系统**: item_base及其子类，涵盖食物、武器、防具、特殊物品
- **角色系统**: pep_base及其子类，定义游戏中的各种角色
- **敌人系统**: enemy_base及其子类，定义战斗中的敌人
- **法术系统**: spell_base及其子类，定义各种战斗法术
- **商店系统**: shop_base，完整的商店交互系统

### 继承关系特点
- **基类设计**: 所有结构体都有清晰的基类，便于扩展和维护
- **属性继承**: 子类继承父类的所有属性，可选择性重写
- **功能扩展**: 子类可以添加新的属性和方法
- **类型安全**: 通过constructor确保类型一致性

### 使用建议
- **创建实例**: 使用`struct("结构体名")`创建实例
- **属性访问**: 通过`实例名.属性名`访问属性
- **类型检查**: 使用`instanceof()`检查结构体类型
- **数组管理**: 使用`has_struct()`检查数组中是否包含特定结构体

---

> 注意：所有结构体属性均采用下划线前缀命名规范，部分属性有详细注释，部分需结合命名和上下文推断功能。结构体支持继承和扩展，便于游戏内容的模块化管理。 