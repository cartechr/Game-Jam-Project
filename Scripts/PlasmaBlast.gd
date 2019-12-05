extends Area2D

const SPEED = 500
var velocity = Vector2()
var direction = 1



    
func set_plasmablast_direction(dir):
	direction = dir
	if dir == -1:
		$AnimatedSprite.flip_h = true

func _physics_process(delta):
	var bodies = get_colliding_bodies()
	for body in bodies:
		if body.is_in_group("Enemy"):
			if body.get_parent().name == "enemies":
				get_node("/root/game")
	translate(velocity)
	velocity.x = SPEED * delta * direction
	$AnimatedSprite.play("shoot")
  
	
	

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
