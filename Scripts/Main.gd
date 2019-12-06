extends Node2D

onready var Lives = $"CanvasLayer/lives + etc/Lives"
onready var Hearts = [$"CanvasLayer/lives + etc/Lives/Sprite3", $"CanvasLayer/lives + etc/Lives/Sprite2", $"CanvasLayer/lives + etc/Lives/Sprite"]

var heart_full = load("res://Assets/New Piskel-1.png (2).png")
var heart_half = load("res://Assets/Half Heart-1.png (1).png")
var heart_empty = load("res://Assets/Half Heart-1.png.png")
var is_moving = false


var lives = 6

func _unhandled_input(event):
	if Input.is_action_pressed("quit"):
		get_tree().quit()
		
func update_lives(delta):
	lives += delta
	for h in range(len(Hearts)):
		Hearts[h].texture = heart_full
		if lives < (h+1)*2:
			Hearts[h].texture = heart_empty
		if lives == (h*2)+1:
			Hearts[h].texture = heart_half
			

	



