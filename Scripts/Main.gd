extends Node2D

onready var Lives = $"lives + etc/Lives"
onready var Hearts = [$"lives + etc/Lives/Sprite", $"lives + etc/Lives/Sprite2", $"lives + etc/Lives/Sprite3"]

var heart_full = load("res://Assets/New Piskel-1.png (2).png")
var heart_half = load("res://Assets/Half Heart-1.png (1).png")
var heart_empty = load("res://Assets/Half Heart-1.png.png")
var is_moving = false
var velocity = Vector2()
const SPEED = 30
const FLOOR = Vector2(0, -1)

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
	

