extends CharacterBody2D


const SPEED = 10.0


func _physics_process(delta):
		
	if Input.is_action_pressed("move_down"):
		velocity.y = direction * SPEED
	
	if Input.is_action_pressed("move_up"):
		velocity.y = -direction * SPEED
		
	if Input.is_action_just_pressed("move_left"):
		velocity.x = -direction * SPEED
		
	if Input.is_action_just_pressed("move_right"):
		velocity.x = direction * SPEED

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
