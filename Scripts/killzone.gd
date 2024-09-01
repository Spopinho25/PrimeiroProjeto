extends Area2D

@onready var timer = $Timer

var hasDied = false

func _on_body_entered(body):
	if hasDied == false:  
		print("You died!")
		timer.start()
		body.die()
		hasDied = true


func _on_timer_timeout():
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
	
