extends Node2D
@onready var damage_sound: AudioStreamPlayer = $damage_sound
@onready var ronf: AudioStreamPlayer = $ronf
@onready var background: ColorRect = $background


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	background.visible = false
	if (Global.ora != 7) and (Global.minuto !=0):
		Global.record = str(Global.giorno) + ", hour " + str(Global.ora-1).lpad(2,"0") + "," + str(Global.minuto).lpad(2,"0")

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Global.vita <= 0:
		get_tree().change_scene_to_file("res://scenes/killscreen.tscn")
	
	if Global.ora > 23:
		print("provaaaa")
		addormentati()
	
	$days.text = "DAY " + str(Global.giorno)
	$hour.text = str(Global.ora).lpad(2,"0") + ":" + str(Global.minuto).lpad(2,"0")
	$remaining_quests.text = str(len(Global.lista_quest_attive)) #- len(Global.lista_quest_attive)) + "/" +str(len(Global.lista_quests))
	$HP.text = str(Global.vita) + " HP"
	if len(Global.lista_quest_attive) > 0:
		var mia_quest = str(Global.lista_quest_attive[0])
		$quest.text = "\"..." + str(Global.mapping_nomi.get(mia_quest, "")) + "\"" 
	else:
		$quest.text = "\"...\""

#func update_quest():
	#
	#Global.quest = Global.quests[randi_range(0, len(Global.quests))]
	#pass
	
func addormentati() -> void:
	Global.giorno +=1
	Global.ora = 7
	Global.minuto = 0
	Global.vita -= len(Global.lista_quest_attive)
	if len(Global.lista_quest_attive) > 0:
		damage_sound.play()
		await damage_sound.finished
	else:
		ronf.play()
		background.visible = true  
		await ronf.finished  

	Global.lista_quest_attive = Global.lista_quests.duplicate()
	#quest.queue_free()
	get_tree().call_deferred("change_scene_to_file", "res://scenes/camera_2_0.tscn")
