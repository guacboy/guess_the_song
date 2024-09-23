extends Control

@onready var answer = $Answer

var valid_keys_dict: Dictionary = {
	"Q": "Q",
	"W": "W",
	"E": "E",
	"R": "R",
	"T": "T",
	"Y": "Y",
	"U": "U",
	"I": "I",
	"O": "O",
	"P": "P",
	"A": "A",
	"S": "S",
	"D": "D",
	"F": "F",
	"G": "G",
	"H": "H",
	"J": "J",
	"K": "K",
	"L": "L",
	"Z": "Z",
	"X": "X",
	"C": "C",
	"V": "V",
	"B": "B",
	"N": "N",
	"1": "1",
	"2": "2",
	"3": "3",
	"4": "4",
	"5": "5",
	"6": "6",
	"7": "7",
	"8": "8",
	"9": "9",
	"0": "0",
	"Apostrophe": "'",
	"Comma": ",",
	"Period": ".",
	"Slash": "/",
	"Space": " ",
}

func _input(event) -> void:
	if event.is_pressed():
		print(OS.get_keycode_string(event.keycode))
	if event.is_pressed() and OS.get_keycode_string(event.keycode) in valid_keys_dict:
		answer.text += valid_keys_dict[OS.get_keycode_string(event.keycode)]
