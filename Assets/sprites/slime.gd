extends Node2D

const SPEED = 60

var direction = 1
var health: int = 100

@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_left = $RayCastLeft
@onready var animated_sprite = $AnimatedSprite2D

func die():
	queue_free()


func take_damage(damage_amount: int):
	health -= damage_amount
	if health <= 0:
		die()


func _process(delta):
	
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
	

	position.x += direction * SPEED * delta
