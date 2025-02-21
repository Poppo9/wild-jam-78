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


func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	var lista_quest = Global.lista_quest_attive.duplicate() 
	if body.name == "CharacterBody2D":
		if parent_node.name in lista_quest: 
			quest.queue_free()
			completa_quest(parent_node.name,lista_quest)
	print(lista_quest)
	Global.lista_quest_attive = lista_quest.duplicate()


func completa_quest(quest: String, lista_quest):
	Global.vita -=1 #TODO
	print("rimuovo "+ quest + " da " + array_to_string(lista_quest))
	var index = lista_quest.find(quest) 
	if quest in lista_quest:
		lista_quest.remove_at(index)
	
func array_to_string(arr: Array) -> String:
	var s = ""
	for i in arr:
		s += String(i)
	return s
