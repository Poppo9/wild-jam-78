extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$days.text = "Day: " + str(Global.giorno)
	$hour.text = str(Global.ora).lpad(2,"0") + ":" + str(Global.minuto).lpad(2,"0")
	$HP.text = str(Global.vita) + " HP"
	if len(Global.lista_quest_attive) > 0:
		var mia_quest = str(Global.lista_quest_attive[0])
		$quest.text = "Quest: " + str(Global.mapping_nomi.get(mia_quest, "Nessuna quest"))
	else:
		$quest.text = "Quest: "

func update_quest():
	
	Global.quest = Global.quests[randi_range(0, len(Global.quests))]
	pass
