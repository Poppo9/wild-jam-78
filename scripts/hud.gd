extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$days.text = "Day: " + str(Global.giorno)
	$hour.text = str(Global.ora).lpad(2,"0") + ":" + str(Global.minuto).lpad(2,"0")
	$quest.text = "Quest: " + str(Global.quest)
	$HP.text = str(Global.vita) + " HP"
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_quest():
	
	Global.quest = Global.quests[randi_range(0, len(Global.quests))]
	pass
