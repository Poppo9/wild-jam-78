extends CharacterBody2D


const SPEED = 300.0
#const JUMP_VELOCITY = -400.0
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
var last_direction = "s"

func _physics_process(delta: float) -> void:
	# Funziona ma non mi piace
	#var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = Vector2.ZERO
	
	if Input.is_action_pressed("ui_right"):
		direction.x = 1
		animated_sprite.play("walk_d")
		last_direction = "d"
	elif Input.is_action_pressed("ui_left"):
		direction.x = -1
		animated_sprite.play("walk_a")
		last_direction = "a"
	elif Input.is_action_pressed("ui_up"):
		direction.y = -1
		animated_sprite.play("walk_w")
		last_direction = "w"
	elif Input.is_action_pressed("ui_down"):
		direction.y = 1
		animated_sprite.play("walk_s")
		last_direction = "s"
	else:
		animated_sprite.play("idle_" + last_direction)
	
	velocity = direction * SPEED
	move_and_slide()


	
	
