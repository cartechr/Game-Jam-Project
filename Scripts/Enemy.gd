extends RigidBody2D

onready var Game = get_node("/root/game")


func _ready():
	pass

func _physics_process(delta):
	var bodies = get_colliding_bodies()
	for b in bodies:
		if b.name == 'Player':
			Game.update_lives(-1)	