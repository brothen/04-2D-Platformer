extends Node

onready var SM = get_parent()
onready var player = get_node("../..")

onready var prev_direction = player.direction

func _ready():
	yield(player, "ready")

func start():
	player.set_animation("Crouching")
	player.jump_power = Vector2.ZERO

func physics_process(_delta):
	if Input.is_action_pressed("crouch"):
		if player.get_node("Chimney/Down").is_colliding():
			var c=player.get_node("Chimney/Down").get_collider()
			if c.is_in_group("Chimneys"):
				get_tree().change_scene("res://Levels/Level2.tscn")
			if c.is_in_group("Finish"):
				get_tree().change_scene("res://Levels/Finish.tscn")
	else:
		player.velocity = Vector2.ZERO
		SM.set_state("Idle")
