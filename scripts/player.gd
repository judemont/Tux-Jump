extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -800.0
const BOOST_VELOCITY = -1900
const GRAVITY = 1300.0
const GAME_OVER_LIMIT_Y = 590

var is_pressing = false

var win_width = 0
var win_height = 0
var initial_y = 0
var score = 0

var boost = false

func _ready() -> void:
	initial_y = position.y
	win_width = int(get_viewport().get_visible_rect().size.x)
	win_height = int(get_viewport().get_visible_rect().size.y)
	
func _physics_process(delta: float) -> void:
	if int(initial_y - position.y) > score*100:
		score = int((initial_y - position.y) / 100)
		get_node("../CanvasLayer/ScoreLabel").text = str(score)
	
	get_node("CollisionShape2D").disabled = round(velocity.y) <= 0
	if not is_on_floor():
		velocity.y += GRAVITY * delta
	elif boost:
		velocity.y += BOOST_VELOCITY
	else:
		velocity.y += JUMP_VELOCITY
	
	var mouse_x =  get_global_mouse_position().x

	if position.x > win_width /2 :
		position.x = -win_width/2
	elif position.x < -win_width /2 :
		position.x = win_width/2
	
	if is_pressing:
		if mouse_x > 0:
			velocity.x = SPEED
		else:
			velocity.x = -SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		

	if position.y > GAME_OVER_LIMIT_Y:
		Global.score = score
		var Score = ScoreManager.new()
		var highscore = Score.load_score()
		if score > highscore:
			Score.save_score(score)
		get_tree().change_scene_to_file("res://scenes/game_over.tscn") # Replace with function body.


	move_and_slide()


func _input(event):
	if (event is InputEventScreenTouch or event is InputEventMouseButton ):
		is_pressing = event.pressed 


func _on_body_entered(body: Node2D) -> void:
	boost = body.is_in_group("platforms_boost") # Replace with function body.
