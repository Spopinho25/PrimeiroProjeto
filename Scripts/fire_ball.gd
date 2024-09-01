extends Node2D

const SPEED = 500
var damage: int = 10
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
	
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemies"):
		body.take_damage(damage)
	queue_free()
