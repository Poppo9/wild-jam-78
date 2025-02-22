extends Node

@onready var audio_player = $AudioStreamPlayer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	# Load and play your music
	var music = load("res://audio/Village.mp3")
	audio_player.stream = music
	audio_player.stream.loop = true
	audio_player.finished.connect(_on_audio_finished)
	audio_player.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_audio_finished():
	# This will automatically restart the music when it ends
	audio_player.play()
