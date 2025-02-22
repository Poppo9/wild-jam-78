extends Node2D

@onready var quest: Node2D = $"."
@onready var parent_node: Node2D = $".."
@onready var ding: AudioStreamPlayer = $ding
@onready var damage_sound: AudioStreamPlayer = $damage_sound
@onready var ronf: AudioStreamPlayer = $ronf
@onready var background: ColorRect = $background

func _ready() -> void:
	if len(Global.lista_quest_attive) > 0:
		if parent_node.name == Global.lista_quest_attive[0]:
			pass
		else:	
			quest.queue_free()
	else:	
		quest.queue_free()
	background.visible = false


func _process(_delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	var lista_quest = Global.lista_quest_attive.duplicate() 
	if body.name == "CharacterBody2D":
		if parent_node.name in lista_quest:
			if parent_node.name == "camera":
				Global.lista_quest_attive = [] #svuota quest attive
				addormentati()# TODO non dovrebbe subire danni ma il giorno aumenta
				return
			else:
				if parent_node.name in Global.quest_lunghe:
					Global.ora += 1
				ding.play()
				#while ding.playing:
					#pass
				if Global.ora > 24:
					addormentati()
					return
			quest.get_node("Area2D/CollisionShape2D").queue_free()
			quest.get_node("AnimatedSprite2D").queue_free()
			completa_quest(parent_node.name,lista_quest)
	print(lista_quest)
	Global.lista_quest_attive = lista_quest.duplicate()

func addormentati() -> void:
	Global.giorno +=1
	Global.ora = 7
	Global.minuto = 0
	Global.vita -= len(Global.lista_quest_attive)
	if len(Global.lista_quest_attive) > 0:
		damage_sound.play()
		while damage_sound.playing:
			pass
	else:
		ronf.play()
		background.visible = true  
		await ronf.finished  

	Global.lista_quest_attive = Global.lista_quests.duplicate()
	quest.queue_free()
	get_tree().call_deferred("change_scene_to_file", "res://scenes/camera_2_0.tscn")


func completa_quest(input_quest: String, lista_quest):
	print("rimuovo "+ input_quest + " da " + array_to_string(lista_quest))
	var index = lista_quest.find(input_quest) 
	if input_quest in lista_quest:
		lista_quest.remove_at(index)
	
func array_to_string(arr: Array) -> String:
	var s = ""
	for i in arr:
		s += String(i)
	return s
