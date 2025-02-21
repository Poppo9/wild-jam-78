extends Node2D

@onready var quest: Node2D = $"."
@onready var parent_node: Node2D = $".."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	var lista_quest = Global.lista_quest_attive 
	if body.name == "CharacterBody2D":
		if parent_node.name in lista_quest: 
			quest.queue_free()
			completa_quest(parent_node.name,lista_quest)
	print(lista_quest)


func completa_quest(quest: String, lista_quest):
	Global.vita -=1 #TODO
	print("rimuovo "+ quest + " da " + array_to_string(lista_quest))
	var index = Global.lista_quest_attive.find(quest) 
	if quest in Global.lista_quest_attive:
		Global.lista_quest_attive.remove_at(index)
	
func array_to_string(arr: Array) -> String:
	var s = ""
	for i in arr:
		s += String(i)
	return s
