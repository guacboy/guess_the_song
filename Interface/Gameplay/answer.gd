extends RichTextLabel

@onready var music = $"../Music"

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
	"M": "M",
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

# for tap vs hold backspace
var delete_time: float = 0.0
var delete_interval: float = 0.05
var initial_delete_delay: float = 0.3
var is_backspace_held: bool = false

func _process(delta) -> void:
	# hold backspace to delete multiple characters
	if Input.is_action_pressed("backspace"):
		if is_backspace_held:
			delete_time -= delta
			if delete_time <= 0.0:
				delete_char()
				delete_time = delete_interval
		else:
			delete_time -= delta
			if delete_time <= 0.0:
				is_backspace_held = true
				delete_time = delete_interval
	else:
		is_backspace_held = false

func _input(event) -> void:
	if (event.is_pressed()
	and event is InputEventKey # checks if keyboard
	and OS.get_keycode_string(event.keycode) in valid_keys_dict # checks if valid key
	and self.get_parsed_text().length() < 50): # checks if max answer length
		text += valid_keys_dict[OS.get_keycode_string(event.keycode)]
		music.stop()
	
	# tap backspace to delete a single character
	if event.is_action_pressed("backspace"):
		delete_time = initial_delete_delay
		delete_char()

# deleting a character
func delete_char() -> void:
	text = "[center]" + self.get_parsed_text().substr(0, self.get_parsed_text().length() - 1)
