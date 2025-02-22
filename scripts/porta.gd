extends Sprite2D
@onready var apri_porta: AudioStreamPlayer = $apri_porta
@onready var color_rect: ColorRect = $black_transition

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# fade from black
	color_rect.color = Color(0, 0, 0, 1)
	var tween = create_tween()
	tween.tween_property(color_rect, "color:a", 0, 0.1)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	# Entrare in una stanza
	if get_tree().current_scene.name == "corridoio":
		Global.bob_position = body.position
		update_last_room(body.position.x)
		apri_porta.play()
		fade_to_black()
	else:
		apri_porta.play()
		fade_to_black()


func clock_tick(debug:bool):
	#Global.vita -=3 # to suicide
	if Global.minuto == 45:
		Global.minuto -= 45
	else:
		Global.minuto += 15
		return
	
	if Global.ora >= 24:
		Global.ora = 7
		Global.giorno += 1
		Global.vita -= len(Global.lista_quest_attive)
		Global.lista_quest_attive = Global.lista_quests.duplicate() #ogni giorno resetta quest
	else:
		Global.ora += 1
	if debug:
		print("Ora: " + str(Global.ora))
		print("Giorno: " + str(Global.giorno))

func fade_to_black():
	var tween = create_tween()
	tween.tween_property(color_rect, "color:a", 1.0, 0.2)
	tween.tween_callback(change_scene)

func change_scene():
	# Calcola la probabilità di randomizzazione (aumenta con i giorni)
	var prob_random = min(0.2 * Global.giorno, 0.8)  # 20% per giorno, max 80%
	var is_random = randf() < prob_random
	
	if get_tree().current_scene.name == "corridoio":
		if is_random:
			# Scelta casuale
			get_tree().call_deferred("change_scene_to_file", Global.lista_stanze[int(randi_range(0,6))])
		else:
			# Scelta basata su last_room_entered
			get_tree().call_deferred("change_scene_to_file", Global.lista_stanze[Global.last_room_entered])
	else:
		get_tree().call_deferred("change_scene_to_file", "res://scenes/corridoio.tscn")
	clock_tick(true)
	

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
