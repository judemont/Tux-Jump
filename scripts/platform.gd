extends StaticBody2D

var win_width = 0
var win_height = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	win_width = int(get_viewport().get_visible_rect().size.x)
	win_height = int(get_viewport().get_visible_rect().size.y)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var camera_y = get_node("../Camera2D").position.y
	if position.y-camera_y > win_height/2:
		get_node("../../Game").generate_platforms()
		queue_free()
