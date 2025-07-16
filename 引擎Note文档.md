# SB-Deltarune-Engine 引擎Note文档

## 概述

本文档整理了SB-Deltarune-Engine中各个系统的note文件，为开发者提供快速参考。

## 1. 文本系统 (nText)

### print() 函数参数
- `"fa_center"`: 在中间设置轴心点
- `"fa_right"`: 在右侧设置轴心点
- `"menu"` 或 `"menu_yellow"`: 允许文本与菜单变量交互
- `"soul1"`, `"soul2"`, `"soul3"`, `"soul4"`: 在菜单词旁边绘制灵魂
- `"bc1"`: 根据文本颜色给文本细投影
- `"bc2"`: 给文本粗黑色投影
- `"bc3"`: 特殊背景效果
- `"bc4"`: 给文本深蓝色轮廓
- `"fade"`: 对文本应用未使用的酷炫效果
- `"blur"`: 使文本模糊，如开场创建角色时

### 文本获取函数
- `get_text()`: 从CSV文档返回字符串数组
- `get_text_string()`: 返回单个字符串

### 其他说明
- 要添加带自动语音的新头像，需先在scr_variant中创建face枚举

## 2. 战斗系统 (nBattle)

### Seed参数
- `"enemyGlide"`: Boss战时战斗结束让敌人回到原位置
- `"keeptarget"`: 模式结束时不清零目标变量
- `"xspare0/1/2"`: 在对应敌人仁慈计量表上放置X图形
- `"grayspare0/1/2"`: 使对应敌人仁慈计量表变灰且无法选择
- `"corner"`: 让灵魂从右上角生成
- `"noCheck"`: 从行动菜单移除检查选项
- `"swoon"`: 角色血量耗尽时设为-999且不自动恢复
- `"purify"`: 不招募战斗的敌人
- `"stopEnd"`: 敌人消失时不结束战斗，设置ob.endSignal为true

### 重要变量
- `oMenuBattle.target`: 锁定目标队员(0/1/2/"all"，-1为默认)
- `oMenuBattle.enemyStatus`: 给敌人名称旁添加状态
- `oMenuBattle.loop`: 控制战斗冻结状态

### 函数
- `enemy_extraStats()`: 临时增加敌人属性
- `party_extraStats()`: 临时增加队员属性
- `add_enemy()`: 战斗中添加敌人
- `force_enemyTurn()`: 强制开始敌人回合
- `force_partyTurn()`: 强制开始队员回合

## 3. 对话系统 (nDialouge)

### 命令格式
- `{setup}`: 设置#符号运行的命令
- `{color}`: 改变文本颜色
- `{sprite}`: 在文本框中绘制精灵
- `{jump}`: 强制文本在下一行开始
- `{delay}`: 文本打印机暂停指定帧数
- `{auto}`: 指定时间内自动进入下一页
- `{func}`: 触发结构体中的函数

### Seed参数
- `"noConfirm"`: 使Z和C键无效
- `"proportional"`: 文本按比例而非等宽间距

### 其他变量
- `op.ccImage`: 对话打印时的动画控制
- `op.ccLine`: 当前对话行数

## 4. 角色系统 (nChar)

### Seed参数
- `"oblivious"`: 让敌人角色不追击

### 动画Seed
- `"subnumber"`: 精灵所有帧播放完动画完成
- `"autooff"`: 禁用自动设置的值
- `"jump"`: 移动时产生跳跃效果
- `"jumpOffset"`: 球精灵跳跃时使用
- `"override"`: 立即播放新动画
- `"fadeEffect"`: 移动时留下淡化轨迹
- `"fadeFast"`: 淡化效果消失更快
- `"faceUp/Down/Left/Right"`: 动画完成后朝向

### 交互参数
- `"look"`: 交互时看向玩家
- `"speed1"`: 交互时image_speed设为1
- `"defaultUp/Down/Left/Right"`: 对话完成或生成时的默认朝向

## 5. 物品系统 (nItems)

### Seed参数
- `"everyone"`: 影响队伍所有人而非个人
- `"noShopTitle"`: 移除商店物品类型文本

## 6. 队伍系统 (nParty)

### Seed参数
- `"greed"`: 不能替换护甲为空并降级武器（Susie特性）

## 7. 过场动画系统 (nCutscene)

### 函数
- `camera_move()`: 移动摄像机
- `camera_reset()`: 将摄像机重置到玩家位置

## 8. 特殊功能 (nSpecial)

### 调试
- 按F1打开调试菜单
- 可在op创建事件顶部禁用调试菜单

### 重要函数
- `declare_gamestats()`: 设置队员属性
- `regular_room_transition()`: 房间转换

### 变量
- `oMenuShop.image`: 商店头像子图像变量

## 9. 制作人员 (nCredits)

### 创作者
- Sad Bread

### 帮助
- Markus
- Ben

### 特别感谢
- tweex
- zem

---

*本文档基于SB-Deltarune-Engine的note文件整理而成* 