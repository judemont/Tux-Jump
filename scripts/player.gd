extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const GRAVITY = 980.0

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += GRAVITY * delta
	else:
		velocity.y = JUMP_VELOCITY 

	var mouse_x =  get_global_mouse_position().x
	print(mouse_x)
	if mouse_x > 0:
		velocity.x = SPEED
		print("ah")
	else:
		velocity.x = -SPEED
		#velocity.x = move_toward(velocity.x, 0, SPEED)
		print("Oh")

	move_and_slide()
