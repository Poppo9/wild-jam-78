extends CharacterBody2D


const SPEED = 300.0
#const JUMP_VELOCITY = -400.0
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var step_sound: AudioStreamPlayer = $steps

var last_direction = "s"
var is_moving = false

func _physics_process(delta: float) -> void:
	# Funziona ma non mi piace
	#var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = Vector2.ZERO
	var was_moving = is_moving
	
	if Input.is_action_pressed("ui_right"):
		direction.x = 1
		animated_sprite.play("walk_d")
		last_direction = "d"
		is_moving = true
	elif Input.is_action_pressed("ui_left"):
		direction.x = -1
		animated_sprite.play("walk_a")
		last_direction = "a"
		is_moving = true
	elif Input.is_action_pressed("ui_up"):
		direction.y = -1
		animated_sprite.play("walk_w")
		last_direction = "w"
		is_moving = true
	elif Input.is_action_pressed("ui_down"):
		direction.y = 1
		animated_sprite.play("walk_s")
		last_direction = "s"
		is_moving = true
	else:
		animated_sprite.play("idle_" + last_direction)
		is_moving = false

	# Gestione del suono
	randomize_sound(step_sound)

	if is_moving and !was_moving:
		step_sound.play()
	elif !is_moving and was_moving:
		step_sound.stop()

	velocity = direction * SPEED

	move_and_slide()

func randomize_sound(sound):
	sound.pitch_scale = randf_range(0.7,1.1)
