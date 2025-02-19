extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:

	if get_tree().current_scene.name == "corridoio":
		Global.bob_position = body.position
		var rand_num = randi_range(0,2)
		get_tree().call_deferred("change_scene_to_file",Global.lista_stanze[1])
	else:
		get_tree().call_deferred("change_scene_to_file","res://scenes/corridoio.tscn")
