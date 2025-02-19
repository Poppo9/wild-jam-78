extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	
	# Entrare in una stanza
	if get_tree().current_scene.name == "corridoio":
		Global.bob_position = body.position
		var rand_num = randi_range(0,2)
		# TODO AGGIUNGERE LOGICHE CHE IN FUNZIONE DEL GIORNO RANDOMIZZA O MENO LA STANZA
		update_last_room(body.position.x)
		get_tree().call_deferred("change_scene_to_file",Global.lista_stanze[Global.last_room_entered])
		clock_tick(true)
	#tornare al corridoio
	else:
		get_tree().call_deferred("change_scene_to_file","res://scenes/corridoio.tscn")
		update_last_room(body.position.x)

func clock_tick(debug:bool):
	if Global.ora >= 24:
		Global.ora -= 23
		Global.giorno +=1
	else:
		Global.ora += 1
	if debug:
		print("Ora: " + str(Global.ora))
		print("Giorno: " + str(Global.giorno))

func check_porta_entrata(x_body) -> int:
	var n_porta = -1
	if x_body < -130: #porta sx
		n_porta = 0
	elif x_body < -80: #fa schifo
		n_porta = 1
	elif x_body < -40: #fa schifo
		n_porta = 2
	elif x_body < 40: #fa schifo
		n_porta = 3
	elif x_body < 120: #fa schifo
		n_porta = 4
	elif x_body < 180: #fa schifo
		n_porta = 5
	else:
		n_porta = 6
	return n_porta

func update_last_room(x_body):
	if x_body < -130: #porta sx
		Global.last_room_entered = 0
	elif x_body < -80: #fa schifo
		Global.last_room_entered = 1
	elif x_body < -40: #fa schifo
		Global.last_room_entered = 2
	elif x_body < 40: #fa schifo
		Global.last_room_entered = 3
	elif x_body < 120: #fa schifo
		Global.last_room_entered = 4
	elif x_body < 180: #fa schifo
		Global.last_room_entered = 5
	else:
		Global.last_room_entered = 6

func is_stessa_stanza() -> bool:
	return false
