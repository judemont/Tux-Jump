extends Node2D

const DIV_MAX_PLATFORM = 1
const DIV_MIN_PLATFORM = 1
const VIEW_DIVISION_HEIGHT = 70
const DIVS_MARGIN = 50

var platform_scene = preload("res://scenes/platform.tscn")
var win_width = 0
var win_height = 0
var div_i = 0

func _ready() -> void:
	win_width = int(get_viewport().get_visible_rect().size.x)
	win_height = int(get_viewport().get_visible_rect().size.y)
	
	for i in range(50):
		generate_platforms()

func _process(delta: float) -> void:
	pass

func generate_platforms() -> void:
	
	var platforms_count = randi_range(DIV_MIN_PLATFORM, DIV_MAX_PLATFORM)
	
	var min_y = -div_i * VIEW_DIVISION_HEIGHT - (DIVS_MARGIN * div_i) +500
	var max_y = -(div_i + 1) * VIEW_DIVISION_HEIGHT - (DIVS_MARGIN * (div_i + 1)) +500
	
	for i in range(platforms_count):
		var platform = platform_scene.instantiate()
		var x = randi_range(-win_width/2 + 80, win_width/2 - 80)
		var y = randi_range(min_y, max_y)
		
		platform.position = Vector2(x, y)
		add_child(platform)
	
	div_i += 1
