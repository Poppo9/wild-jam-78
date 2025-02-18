extends Node2D

var pg_scene = preload("res://scenes/pg.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var instance = pg_scene.instantiate()
	instance.scale= Vector2(1.2,1.2)
	instance.position = Global.bob_position
	if Global.bob_position.x < -130: #fa schifo
		instance.position = Global.bob_position + Vector2(20,0)
		print(1)
	elif Global.bob_position.x < 200: #fa schifo
		instance.position = Global.bob_position + Vector2(0,20)
		print(2)
	else:
		instance.position = Global.bob_position + Vector2(-20,0)
		print(3)

	add_child(instance)
