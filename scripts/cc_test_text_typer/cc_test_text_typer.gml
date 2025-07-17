///@desc Test Text Typer Integration

// 创建一个测试对话结构
var test_dialogue = {
	_dialogue: ["Hello! This is a test of the text_typer integration.{color:red}This text should be red!{color:white} And this should be white again."],
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

// 创建对话实例
var dialogue_instance = instance_create_depth(0, 0, -1000, oDialogue);
dialogue_instance.info = test_dialogue;

// 设置text_typer模式
dialogue_instance.use_text_typer = true;

// 测试命令转换
var test_text = "Hello {color:red}red text{color:white} white text";
var converted = dialogue_instance.func_convert_dialogue_commands(test_text);
show_debug_message("Original: " + test_text);
show_debug_message("Converted: " + converted);

show_debug_message("Text Typer Integration Test Started");
show_debug_message("Dialogue instance created with text_typer enabled"); 