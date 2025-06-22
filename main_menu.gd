extends Node2D

# Change to Passcode Puzzle Scene
func _on_passcode_button_pressed():
	get_tree().change_scene_to_file("res://passcode.tscn")

# Change to Heart Spade Puzzle Screen
func _on_heart_spade_button_pressed():
	get_tree().change_scene_to_file("res://heart_spade_puzzle.tscn")
