extends RigidBody2D


var BLAST = preload("res://Scenes/EnemyBlast.tscn")


func _ready():
	$AnimatedSprite.play("Boss")



