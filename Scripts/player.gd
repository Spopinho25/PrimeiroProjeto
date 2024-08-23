extends CharacterBody2D

var died = false

const SPEED = 130.0
const JUMP_VELOCITY = -270.0

const FIREBALL = preload("res://fire_ball.tscn")
@onready var marker_position = $Marker2D.position

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animated_sprite = $AnimatedSprite2D

func die():
	died = true
	animated_sprite.play("morrer")

func _ready() -> void: 
	died = false
 
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	if died: return
	# Handle jump.
	if Input.is_action_just_pressed("pular") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	
	
	
	var direction = Input.get_axis("AndarEsquerda", "AndarDireita")
	
	if direction > 0:
		animated_sprite.flip_h = false
		
		
	elif direction < 0:
		animated_sprite.flip_h = true
			
		var fire_direction = 1
		if animated_sprite.flip_h:
			fire_direction = -1
		else:
			fire_direction = 1
			
			
	if Input.is_action_just_pressed("Atacar"):
		
		var fire_direction = -1 if animated_sprite.flip_h else 1
		var new_position = marker_position
		new_position.x *= fire_direction
	#	var marker_position = $Marker2D.position
	#	marker_position.x *= direction
		$Marker2D.position = new_position
		var fireball = FIREBALL.instantiate()
		fireball.direction = -1 if animated_sprite.flip_h else 1
		get_parent().add_child(fireball)
		fireball.position = $Marker2D.global_position
		
		
	
# Animações
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else: 
			animated_sprite.play("Correr")
	else: 
		animated_sprite.play("Pular")


	#movimento
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
