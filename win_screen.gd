extends Node2D
@onready var win = $win
@onready var reset = $reset


# Called when the node enters the scene tree for the first time.
func _ready():
	win.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("reset_password"):
		reset.play()
		get_tree().change_scene_to_file("res://heart_spade_puzzle.tscn")
