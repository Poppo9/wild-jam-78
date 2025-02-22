extends TileMapLayer
@onready var nuvole: TileMapLayer = $"."



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready() -> void:
	var muovi_nuvole = create_tween()
	muovi_nuvole.tween_property(nuvole,"position:x", 200, 60)
