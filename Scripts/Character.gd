extends KinematicBody2D

const SPEED = 250
const GRAVITY = 10
const JUMP_POWER = -500
const FLOOR = Vector2(0, -1)

const PLASMABLAST = preload("res://Scenes/PlasmaBlast.tscn")

var velocity = Vector2()

var on_ground = false

func _physics_process(delta):
	if Input.is_action_pressed("forward"):
		velocity.x = SPEED
		$AnimatedSprite.play("run")
		$AnimatedSprite.flip_h = false
		if sign($Position2D.position.x) == -1:
			$Position2D.position.x *= -1
	elif Input.is_action_pressed("backward"):
		velocity.x = -SPEED
		$AnimatedSprite.play("run")
		$AnimatedSprite.flip_h = true
		if sign($Position2D.position.x) == 1:
			$Position2D.position.x *= -1
	else:
		velocity.x = 0
		if on_ground == true:
			$AnimatedSprite.play("idle")
	
	if Input.is_action_pressed("jump"):
		if on_ground == true:
			velocity.y = JUMP_POWER
			on_ground = false
	if Input.is_action_just_pressed("shoot"):
		var plasmablast = PLASMABLAST.instance()
		get_parent().add_child(plasmablast)
		plasmablast.position = $Position2D.global_position
	
	velocity.y += GRAVITY
	
	if is_on_floor():
		on_ground = true
	else:
		on_ground = false
	
	move_and_slide(velocity, FLOOR)
	
	