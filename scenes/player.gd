extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -700.0
const GRAVITY = 980.0

var is_pressing = false
var jump = false

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += GRAVITY * delta
	elif jump:
		velocity.y += JUMP_VELOCITY
		jump = false	
	
	var mouse_x =  get_global_mouse_position().x

	
	if is_pressing:
		if mouse_x > 0:
			velocity.x = SPEED
		else:
			velocity.x = -SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	get_node("CollisionShape2D").disabled = velocity.y < 0

	move_and_slide()


func _input(event):
	if (event is InputEventScreenTouch or event is InputEventMouseButton ):
		is_pressing = event.pressed 


func collision(body: Node2D) -> void:
	jump = body.is_in_group("platforms")
		
