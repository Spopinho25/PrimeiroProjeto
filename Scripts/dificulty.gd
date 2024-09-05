extends Control



func _on_easy_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Easygame.tscn")


func _on_medium_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/game.tscn")


func _on_hard_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Hardgame.tscn")
