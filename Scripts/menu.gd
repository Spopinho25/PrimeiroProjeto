extends Control

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/game.tscn")
	
	


func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/optionsmenu.tscn")


func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_how_to_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/HowToPlay.tscn")
