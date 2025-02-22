extends Node2D
@onready var label: Label = $Label
@onready var morte: AudioStreamPlayer = $morte


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.text = "\"...IT survived untill day " + str(Global.giorno) + ", hour " + str(Global.ora).lpad(2,"0") + ":" + str(Global.minuto).lpad(2,"0") + "...\""
	morte.play()
	while morte.playing:
		pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	Global.giorno = 1
	Global.ora = 7
	Global.minuto = 0
	Global.last_room_entered = 0
	Global.vita = Global.max_life
	Global.lista_quest_attive = []
	Global.bob_position = Vector2(-125,-40)
	Global.lista_quest_attive = Global.lista_quests
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
