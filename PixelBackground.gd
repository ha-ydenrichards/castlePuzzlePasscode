extends Sprite2D

@onready var spade_1 = $"../Spade1"
@onready var spade_2 = $"../Spade2"
@onready var spade_3 = $"../Spade3"
@onready var spade_4 = $"../Spade4"
@onready var diamond_1 = $"../Diamond1"
@onready var diamond_2 = $"../Diamond2"
@onready var diamond_3 = $"../Diamond3"
@onready var diamond_4 = $"../Diamond4"
@onready var club_1 = $"../Club1"
@onready var club_2 = $"../Club2"
@onready var club_3 = $"../Club3"
@onready var club_4 = $"../Club4"
@onready var heart_1 = $"../Heart1"
@onready var heart_2 = $"../Heart2"
@onready var heart_3 = $"../Heart3"
@onready var heart_4 = $"../Heart4"

@onready var button_click = $"../ButtonClick"
@onready var swap = $"../Swap"
@onready var reset = $"../Reset"
@onready var win = $"../Win"
@onready var timer = $"../Timer"
@onready var win_song = $"../win_song"



var slots = {
	"slot 1": null, "slot 2": null, "slot 3": null, "slot 4": null
}

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if slots["slot 1"] == "Spade" and slots["slot 2"] == "Heart" and slots["slot 3"] == "Heart" and slots["slot 4"] == "Club":
		win_song.play()
		timer.start(10)
		slots["slot 1"] = null
		slots["slot 2"] = null
		slots["slot 3"] = null
		slots["slot 4"] = null
	
func _on_spade_button_pressed():
	button_click.play()
	if slots["slot 1"] == null:
		spade_1.show()
		slots["slot 1"] = "Spade"
	elif slots["slot 2"] == null:
		spade_2.show()
		slots["slot 2"] = "Spade"
	elif slots["slot 3"] == null:
		spade_3.show()
		slots["slot 3"] = "Spade"
	elif slots["slot 4"] == null:
		spade_4.show()
		slots["slot 4"] = "Spade"
		
func _on_diamond_button_pressed():
	button_click.play()
	if slots["slot 1"] == null:
		diamond_1.show()
		slots["slot 1"] = "Diamond"
	elif slots["slot 2"] == null:
		diamond_2.show()
		slots["slot 2"] = "Diamond"
	elif slots["slot 3"] == null:
		diamond_3.show()
		slots["slot 3"] = "Diamond"
	elif slots["slot 4"] == null:
		diamond_4.show()
		slots["slot 4"] = "Diamond"


func _on_swap_button_pressed():
	swap.play()
	var swapped_item = null
	if slots["slot 1"] != null:
		swapped_item = swap_func("slot 1")
		slots["slot 1"] = swapped_item
		if swapped_item == "Spade":
			spade_1.show()
			club_1.hide()
		elif swapped_item == "Club":
			spade_1.hide()
			club_1.show()
		elif swapped_item == "Diamond":
			diamond_1.show()
			heart_1.hide()
		else:
			heart_1.show()
			diamond_1.hide()
	if slots["slot 2"] != null:
		swap_func("slot 2")
		swapped_item = swap_func("slot 2")
		slots["slot 2"] = swapped_item
		if swapped_item == "Spade":
			spade_2.show()
			club_2.hide()
		elif swapped_item == "Club":
			spade_2.hide()
			club_2.show()
		elif swapped_item == "Diamond":
			diamond_2.show()
			heart_2.hide()
		else:
			heart_2.show()
			diamond_2.hide()
	if slots["slot 3"] != null:
		swap_func("slot 3")
		swapped_item = swap_func("slot 3")
		slots["slot 3"] = swapped_item
		if swapped_item == "Spade":
			spade_3.show()
			club_3.hide()
		elif swapped_item == "Club":
			spade_3.hide()
			club_3.show()
		elif swapped_item == "Diamond":
			diamond_3.show()
			heart_3.hide()
		else:
			heart_3.show()
			diamond_3.hide()
	if slots["slot 4"] != null:
		swap_func("slot 4")
		swapped_item = swap_func("slot 4")
		slots["slot 4"] = swapped_item
		if swapped_item == "Spade":
			spade_4.show()
			club_4.hide()
		elif swapped_item == "Club":
			spade_4.hide()
			club_4.show()
		elif swapped_item == "Diamond":
			diamond_4.show()
			heart_4.hide()
		else:
			heart_4.show()
			diamond_4.hide()
		
func swap_func(slot) -> String:
	if slots[slot] == "Spade":
		return "Club"
	elif slots[slot] == "Club":
		return "Spade"
	elif slots[slot] == "Heart":
		return "Diamond"
	else:
		return "Heart"

func _on_reset_button_pressed():
	reset.play()
	spade_1.hide()
	spade_2.hide()
	spade_3.hide()
	spade_4.hide()
	diamond_1.hide()
	diamond_2.hide()
	diamond_3.hide()
	diamond_4.hide()
	club_1.hide()
	club_2.hide()
	club_3.hide()
	club_4.hide()
	heart_1.hide()
	heart_2.hide()
	heart_3.hide()
	heart_4.hide()
	slots["slot 1"] = null
	slots["slot 2"] = null
	slots["slot 3"] = null
	slots["slot 4"] = null


func _on_timer_timeout():
	get_tree().change_scene_to_file("res://win_screen.tscn")
