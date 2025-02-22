extends CharacterBody2D

@onready var parent_node: Node2D = $".."
var SPEED = 300.0
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var step_sound: AudioStreamPlayer = $steps
@onready var step_timer: Timer = Timer.new()  # Added timer
var last_direction = "s"
var is_moving = false

func _ready() -> void:
	if parent_node.name == "esterno":
		SPEED = 150
	# Setup step timer
	step_timer.wait_time = 0.3  # Adjust this to match your walking animation
	step_timer.connect("timeout", _on_step_timer_timeout)
	add_child(step_timer)

func _physics_process(_delta: float) -> void:
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

	# Modified sound handling
	if is_moving and !was_moving:
		step_timer.start()
		play_step()
	elif !is_moving and was_moving:
		step_timer.stop()
		step_sound.stop()

	velocity = direction * SPEED
	move_and_slide()

# New functions for step sounds
func play_step():
	randomize_sound(step_sound)
	step_sound.play()

func _on_step_timer_timeout():
	if is_moving:
		play_step()

# Your original randomize function
func randomize_sound(sound):
	sound.pitch_scale = randf_range(0.7,1.1)
