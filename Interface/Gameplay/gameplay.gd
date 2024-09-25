extends Control

@onready var answer = $Answer
@onready var music = $Music

@onready var correct = $"Sound Effects/Correct"
@onready var wrong = $"Sound Effects/Wrong"

# songs selected prior to starting game
var selected_songs_dict: Dictionary = {
	"BURN": preload("res://Music/Kanye West/Vultures 1/BURN - Kanye West & Ty Dolla $ign (lyrics).mp3")
}
var current_song: String

# for tap vs hold backspace
var delete_time: float = 0.0
var delete_interval: float = 0.05
var initial_delete_delay: float = 0.3
var is_backspace_held: bool = false

func _ready() -> void:
	pick_song()

func _input(event) -> void:
	# checks answer
	if event.is_action_pressed("return"):
		if answer.get_parsed_text() == current_song:
			correct.play()
			Signals.emit_signal("on_combo_increment", true)
			Signals.emit_signal("on_score_increment")
		else:
			wrong.play()
			Signals.emit_signal("on_combo_increment", false)
		
		# resets text and plays next song
		answer.text = "[center]"
		pick_song()

# picks a new song
func pick_song() -> void:
	music.stop()
	current_song = selected_songs_dict.keys().pick_random()
	music.stream = selected_songs_dict[current_song]
	music.play()
