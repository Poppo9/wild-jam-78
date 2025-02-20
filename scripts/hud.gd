extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$days.text = "Day: " + str(Global.giorno)
	$hour.text = "Hour: " + str(Global.ora)
	$quest.text = "Quest: " + str(Global.quest)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
