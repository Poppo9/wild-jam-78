extends Node2D

@onready var quest: Node2D = $"."
@onready var parent_node: Node2D = $".."

func _ready() -> void:
	if len(Global.lista_quest_attive) > 0:
		if parent_node.name == Global.lista_quest_attive[0]:
			pass
		else:	
			quest.queue_free()
	else:	
		quest.queue_free()


func _process(_delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	var lista_quest = Global.lista_quest_attive.duplicate() 
	if body.name == "CharacterBody2D":
		if parent_node.name in lista_quest:
			if parent_node.name == "camera":
				addormentati()
				return
			elif parent_node.name in Global.quest_lunghe:
				Global.ora += 1
				if Global.ora > 24:
					addormentati()
					return
			quest.queue_free()
			completa_quest(parent_node.name,lista_quest)
	print(lista_quest)
	Global.lista_quest_attive = lista_quest.duplicate()

func addormentati() -> void:
	Global.giorno +=1
	Global.ora = 7
	Global.minuto = 0
	Global.vita -= len(Global.lista_quest_attive)
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
