extends Node2D


# Triggers when the "Play" button is pressed; Starts the game
func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://msc/playable_area.tscn")


# Triggers when the "Quit" button is pressed; Exits the game
func _on_quit_button_pressed():
	get_tree().quit()
