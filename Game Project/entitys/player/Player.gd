extends KinematicBody2D

export (int) var speed = 400
export (int) var jump_speed = -1000
export (int) var gravity = 4000
export (int) var inertia = 100

var velocity = Vector2.ZERO

func _ready():
	$AnimatedSprite.play()

func get_input():
	velocity.x = 0
	if Input.is_action_pressed("right"):
		$AnimatedSprite.flip_h = false
		velocity.x += speed
	if Input.is_action_pressed("left"):
		$AnimatedSprite.flip_h = true
		velocity.x -= speed
	if Input.is_action_pressed("right") || Input.is_action_pressed("left"):
		$AnimatedSprite.animation = "walk"
	else:
		$AnimatedSprite.animation = "stand"

func _process(delta):
	get_input()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP, false, 4 ,PI/4, false)
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = jump_speed
	
	for index in get_slide_count():
		var collision = get_slide_collision(index)
		if collision.collider.is_in_group("bodies"):
			collision.collider.apply_central_impulse(-collision.normal * inertia)
