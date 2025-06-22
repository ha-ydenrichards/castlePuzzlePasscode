extends Node2D
@onready var first_digit = $MarginContainer/HBoxContainer/first_digit as Label
@onready var second_digit = $MarginContainer/HBoxContainer/second_digit as Label
@onready var third_digit = $MarginContainer/HBoxContainer/third_digit as Label
@onready var fourth_digit = $MarginContainer/HBoxContainer/fourth_digit as Label
@onready var fifth_digit = $MarginContainer/HBoxContainer/fifth_digit as Label
@onready var sixth_digit = $MarginContainer/HBoxContainer/sixth_digit as Label
@onready var seventh_digit = $MarginContainer/HBoxContainer/seventh_digit as Label

@onready var type_digit = $TypeDigit
@onready var win = $Win
@onready var wrong = $Wrong
@onready var delete = $Delete
@onready var reset = $Reset


@onready var margin_container = $MarginContainer as MarginContainer
@onready var title = $Title as Label
@onready var winning_text = $winning_text as Label
@onready var random_text = $random_text as Label


var current_passcode = ""
var passcode = "4582273"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if len(current_passcode) < 7:
		if Input.is_action_just_pressed("Press_1"):
			type_digit.play()
			fill_correct_digit("1")
		elif Input.is_action_just_pressed("Press_2"):
			type_digit.play()
			fill_correct_digit("2")
		elif Input.is_action_just_pressed("Press_3"):
			type_digit.play()
			fill_correct_digit("3")
		elif Input.is_action_just_pressed("Press_4"):
			type_digit.play()
			fill_correct_digit("4")
		elif Input.is_action_just_pressed("Press_5"):
			type_digit.play()
			fill_correct_digit("5")
		elif Input.is_action_just_pressed("Press_6"):
			type_digit.play()
			fill_correct_digit("6")
		elif Input.is_action_just_pressed("Press_7"):
			type_digit.play()
			fill_correct_digit("7")
		elif Input.is_action_just_pressed("Press_8"):
			type_digit.play()
			fill_correct_digit("8")
		elif Input.is_action_just_pressed("Press_9"):
			type_digit.play()
			fill_correct_digit("9")
		elif Input.is_action_just_pressed("Press_0"):
			type_digit.play()
			fill_correct_digit("0")

	# Press enter to submit the password if you have seven characters
	if Input.is_action_just_pressed("submit_password"):
		if len(current_passcode) == 7:
			if current_passcode == passcode:
				win.play()
				title.hide()
				margin_container.hide()
				random_text.hide()
				winning_text.show()
			else:
				wrong.play()
				current_passcode = ""
				first_digit.text = "-"
				second_digit.text = "-"
				third_digit.text = "-"
				fourth_digit.text = "-"
				fifth_digit.text = "-"
				sixth_digit.text = "-"
				seventh_digit.text = "-"
				
	# Press Shift to reset all digits in the password
	if Input.is_action_just_pressed("reset_password"):
		if len(current_passcode) > 0:
			reset.play()
			title.show()
			margin_container.show()
			random_text.show()
			winning_text.hide()
			current_passcode = ""
			first_digit.text = "-"
			second_digit.text = "-"
			third_digit.text = "-"
			fourth_digit.text = "-"
			fifth_digit.text = "-"
			sixth_digit.text = "-"
			seventh_digit.text = "-"
	elif Input.is_action_just_pressed("delete_digit"):
			if len(current_passcode) > 0:
				delete_digit()

# Function updates the labels accordingly				
func fill_correct_digit(digit) -> void:
	print(first_digit)
	if first_digit.text.contains("-"):
		first_digit.text = digit
	elif second_digit.text.contains("-"):
		second_digit.text = digit
	elif third_digit.text.contains("-"):
		third_digit.text = digit
	elif fourth_digit.text.contains("-"):
		fourth_digit.text = digit
	elif fifth_digit.text.contains("-"):
		fifth_digit.text = digit
	elif sixth_digit.text.contains("-"):
		sixth_digit.text = digit
	else:
		seventh_digit.text = digit
	current_passcode += digit

# Deletes each digit accordingly
func delete_digit() -> void:
	delete.play()
	var passcode_length = len(current_passcode)
	match passcode_length:
		1:
			first_digit.text = "-"
		2:
			second_digit.text = "-"
		3:
			third_digit.text = "-"
		4:
			fourth_digit.text = "-"
		5:
			fifth_digit.text = "-"
		6:
			sixth_digit.text = "-"
		7:
			seventh_digit.text = "-"
	current_passcode = current_passcode.left(current_passcode.length()-1)

	
