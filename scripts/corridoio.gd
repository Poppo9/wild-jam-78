extends Node2D

var pg_scene = preload("res://scenes/pg.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var instance = pg_scene.instantiate()
	instance.scale= Vector2(1.2,1.2)
	instance.position = Global.bob_position
	if Global.bob_position.x < -130: #porta sx
		instance.position = Global.bob_position + Vector2(20,0)
		Global.last_room_entered = 0
	elif Global.bob_position.x < -80: #fa schifo
		instance.position = Global.bob_position + Vector2(0,20)
		Global.last_room_entered = 1
	elif Global.bob_position.x < -40: #fa schifo
		instance.position = Global.bob_position + Vector2(0,20)
		Global.last_room_entered = 2
	elif Global.bob_position.x < 40: #fa schifo
		instance.position = Global.bob_position + Vector2(0,20)
		Global.last_room_entered = 3
	elif Global.bob_position.x < 120: #fa schifo
		instance.position = Global.bob_position + Vector2(0,20)
		Global.last_room_entered = 4
	elif Global.bob_position.x < 180: #fa schifo
		instance.position = Global.bob_position + Vector2(0,20)
		Global.last_room_entered = 5
	else:
		instance.position = Global.bob_position + Vector2(-20,0)
		Global.last_room_entered = 6
	print("porta uscita" + str(Global.last_room_entered))
	add_child(instance)
