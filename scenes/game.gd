extends Node2D

const view_divisions = 5
const div_max_platform = 3
const div_min_platform = 1

var platform_scene = load("res://scenes/platform.tscn")
var win_width = 0
var win_height = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	win_width = int(get_viewport().get_visible_rect().size.x)
	win_height = int(get_viewport().get_visible_rect().size.y)
	print("A" + str(win_width))
	var view_division_height = win_height / view_divisions
	print(win_width)
	print(view_division_height)
	
	for i in range(view_divisions):
		var min_y = view_division_height * i - win_height/2
		var max_y = view_division_height * (i+1) - win_height/2
		for y in range(randi_range(div_min_platform,div_max_platform)):
			spawn_platform(randi_range(min_y+50, max_y))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func spawn_platform(y):
	var platform = platform_scene.instantiate()
	var x = randi_range(-win_width/2 +80, win_width /2 -80) 
	print(x)
	platform.position = Vector2(x, y)	
	add_child(platform)
