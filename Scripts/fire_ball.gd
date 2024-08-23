extends Area2D

const SPEED = 220
var direction = 1
var velocity = Vector2()



func _ready():
	pass

func _physics_process(delta):
	velocity.x  = SPEED * delta * direction
	translate(velocity)
	$AnimatedSprite2D.play("FireBall")



func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
