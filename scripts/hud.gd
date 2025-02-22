extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Global.vita <= 0:
		get_tree().change_scene_to_file("res://scenes/killscreen.tscn")

	$days.text = "Day: " + str(Global.giorno)
	$hour.text = str(Global.ora).lpad(2,"0") + ":" + str(Global.minuto).lpad(2,"0")
	$HP.text = str(Global.vita) + " HP"
	if len(Global.lista_quest_attive) > 0:
		var mia_quest = str(Global.lista_quest_attive[0])
		$quest.text = "\"..." + str(Global.mapping_nomi.get(mia_quest, "")) + "\"" 
	else:
		$quest.text = "\"...\""

func update_quest():
	
	Global.quest = Global.quests[randi_range(0, len(Global.quests))]
	pass
