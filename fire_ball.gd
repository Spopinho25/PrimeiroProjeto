extends Area2D

const SPEED = 2000
var velocity = Vector2()

func _ready():
	pass

func _physics_process(delta):
	velocity.x = SPEED * delta
	translate(velocity)
	$AnimatedSprite2D.play("FireBall")


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
