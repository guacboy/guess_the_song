extends Control

@onready var answer = $Answer
@onready var music = $Music

@onready var correct = $"Sound Effects/Correct"
@onready var wrong = $"Sound Effects/Wrong"

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

# songs selected prior to starting game
var selected_songs_dict: Dictionary = {
	"BURN": preload("res://Music/Kanye West/Vultures 1/BURN - Kanye West & Ty Dolla $ign (lyrics).mp3")
}
var current_song: String

var delete_time: float = 0.0
var delete_interval: float = 0.1
var initial_delete_delay: float = 0.3
var is_backspace_held: bool = false

func _ready() -> void:
	pickSong()

func _process(delta) -> void:
	# hold backspace to delete multiple characters
	if Input.is_action_pressed("backspace"):
		if is_backspace_held:
			delete_time -= delta
			if delete_time <= 0.0:
				deleteChar()
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
	and OS.get_keycode_string(event.keycode) in valid_keys_dict # checks if valid key
	and answer.get_parsed_text().length() < 50): # checks if max answer length
		answer.text += valid_keys_dict[OS.get_keycode_string(event.keycode)]
		music.stop()
	
	# tap backspace to delete a single character
	if event.is_action_pressed("backspace"):
		delete_time = initial_delete_delay
		deleteChar()
	
	# checks answer
	if event.is_action_pressed("return"):
		if answer.get_parsed_text() == current_song:
			correct.play()
		else:
			wrong.play()
		
		# resets text and plays next song
		answer.text = "[center]"
		pickSong()

# deleting a character
func deleteChar() -> void:
	answer.text = "[center]" + answer.get_parsed_text().substr(0, answer.get_parsed_text().length() - 1)

# picks a new song
func pickSong() -> void:
	music.stop()
	current_song = selected_songs_dict.keys().pick_random()
	music.stream = selected_songs_dict[current_song]
	music.play()
