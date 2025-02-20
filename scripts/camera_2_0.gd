extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if (Global.giorno == 1) and (Global.ora == 7):
		$CharacterBody2D.position = Vector2 (5,30)
