extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:

	if get_tree().current_scene.name == "corridoio":
		var lista_stanze = ["res://scenes/stanza_gatto.tscn",
							"res://scenes/camera_2_0.tscn",
							"res://scenes/bagno.tscn",
		]
		
		get_tree().change_scene_to_file(lista_stanze[1])
	else:
		get_tree().change_scene_to_file("res://scenes/corridoio.tscn") # Replace with function body.
		#scena_corrente = get_tree().get_current_scene()
