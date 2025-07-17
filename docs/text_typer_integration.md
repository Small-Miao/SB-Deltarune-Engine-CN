# oDialogue 与 text_typer 集成文档

## 概述

本集成将 `text_typer` 的文字渲染系统整合到 `oDialogue` 对象中，提供更强大的文字渲染功能和更好的中文字符支持。

## 主要特性

### 1. 自动文字渲染
- 使用 `text_typer` 进行逐字符渲染
- 支持中英文混合显示
- 自动字体切换（中文使用中文字体，英文使用英文字体）

### 2. 命令系统兼容
- 支持原有的 oDialogue 命令格式
- 自动转换命令格式以适配 text_typer
- 支持颜色、字体、声音等命令

### 3. 可切换模式
- 可以通过 `use_text_typer` 变量控制是否使用 text_typer
- 保留原有的渲染系统作为备用

## 使用方法

### 基本设置

```gml
// 创建对话实例
var dialogue_instance = instance_create_depth(0, 0, -1000, oDialogue);
dialogue_instance.info = dialogue_struct;

// 启用 text_typer 模式
dialogue_instance.use_text_typer = true;
```

### 对话结构示例

```gml
var dialogue_struct = {
    _dialogue: ["Hello! {color:red}This is red text!{color:white} And this is white again."],
    _x: [50],
    _y: [100],
    _xScale: [300],
    _yScale: [100],
    _face: [-1],
    _faceAnimate: [-1],
    _font: [0],
    _voice: [0],
    _textSpeed: [2],
    _hideBox: [0],
    _box: [0],
    _arrow: [-1],
    _color: [],
    _jump: [],
    _shopSprite: [-1],
    _asteriskFace: [-1],
    _proceedAuto: 180,
    _autoSkipText: [-1],
    _match: false,
    _funcLine: [-1],
    _printSeed: [-1],
    _seed: [],
    _func: -1,
    _moveAfter: false,
    _boxOffsetXY: [17, 18],
    _yOffset: 20,
    _moneyBox: false
};
```

### 支持的命令

#### 颜色命令
```gml
{color:red}     // 红色文字 (转换为 {color_text 16711680})
{color:yellow}  // 黄色文字 (转换为 {color_text 16776960})
{color:white}   // 白色文字 (转换为 {color_text 16777215})
{color:rng}     // 随机颜色
```

#### 延迟命令
```gml
{delay:30}      // 延迟30帧 (转换为 {sleep 30})
```

#### 脚本命令
```gml
{func:script_name}  // 执行脚本 (转换为 {script script_name})
```

#### 声音命令
```gml
{voice:0}       // 设置声音 (转换为 {voice 0})
```

#### 字体命令
```gml
{font:0}        // 设置字体 (转换为 {font 0})
```

## 技术细节

### 命令转换

系统会自动将 oDialogue 的命令格式转换为 text_typer 格式：

- `{color:red}` → `{color_text 16711680}` (使用 make_color_rgb 创建颜色值)
- `{delay:30}` → `{sleep 30}`
- `{func:script_name}` → `{script script_name}`

### 字体处理

- 中文字符自动使用中文字体 (`fCNFont`)
- 英文字符使用英文字体
- 自动计算字符宽度和间距

### 实例管理

- text_typer 实例会在对话结束时自动销毁
- 支持多个对话实例同时存在
- 每个对话实例都有独立的 text_typer 实例

## 故障排除

### 常见问题

1. **文字不显示**
   - 检查 `use_text_typer` 是否设置为 `true`
   - 确认 text_typer 对象存在
   - 检查字体资源是否正确加载

2. **命令不生效**
   - 确认命令格式正确
   - 检查命令转换函数是否正常工作
   - 验证 text_typer 的命令处理系统

3. **颜色命令错误**
   - 确保使用正确的颜色名称：`red`, `yellow`, `white`
   - 颜色命令会自动转换为 RGB 值
   - 如果遇到 "unable to convert string to number" 错误，检查颜色命令格式

4. **性能问题**
   - 如果遇到性能问题，可以设置 `use_text_typer = false` 使用原有系统
   - 检查是否有过多的 text_typer 实例同时存在

### 调试信息

启用调试模式可以查看详细信息：

```gml
// 测试命令转换
var test_text = "Hello {color:red}red text{color:white} white text";
var converted = dialogue_instance.func_convert_dialogue_commands(test_text);
show_debug_message("Original: " + test_text);
show_debug_message("Converted: " + converted);
```

### 错误修复

#### v1.1 修复内容
- 修复了颜色命令转换错误
- 将颜色字符串转换为具体的 RGB 值
- 解决了 "unable to convert string to number" 错误

## 更新日志

### v1.1
- 修复颜色命令转换错误
- 改进命令处理系统
- 添加更多调试信息

### v1.0
- 初始集成版本
- 支持基本的文字渲染
- 支持颜色和格式命令
- 添加命令转换系统

## 未来计划

- 添加更多 text_typer 特性支持
- 优化性能和内存使用
- 添加更多自定义选项
- 改进命令系统兼容性 