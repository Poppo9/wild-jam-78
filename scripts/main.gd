extends Node2D

const MAX_HUNGER = 100
var hunger = MAX_HUNGER
var time = Time.get_time_dict_from_system()
const threshold = 0.1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(time)
	set_hunger_label() # Replace with function body.

func set_hunger_label() -> void:
	$Hungerlabel.text = "Hunger: %s" % hunger

func set_hunger_bar() -> void:
	$Hungerbar.value = hunger	
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var new_time = Time.get_time_dict_from_system()
	if abs(time.second - new_time.second) > 3:
		hunger -= 0.1
		set_hunger_bar()
	
	
