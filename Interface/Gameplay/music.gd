extends AudioStreamPlayer2D

@export var current_song: String

# songs selected prior to starting game
var selected_songs_dict: Dictionary = {
	"BURN": preload("res://Music/Kanye West/Vultures 1/BURN - Kanye West & Ty Dolla $ign (lyrics).mp3")
}

func _ready() -> void:
	Signals.connect("on_new_song", _on_new_song)

func _on_new_song() -> void:
	stop()
	current_song = selected_songs_dict.keys().pick_random()
	stream = selected_songs_dict[current_song]
	play()
