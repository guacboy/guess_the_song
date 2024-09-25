extends AudioStreamPlayer2D

@export var current_song: String
@onready var song_duration = $SongDuration

# songs selected prior to starting game
var selected_songs_dict: Dictionary = {
	"BURN": preload("res://Music/Kanye West/Vultures 1/BURN - Kanye West & Ty Dolla $ign (lyrics).mp3")
}

var next_cnt: int = 1

func _ready() -> void:
	Signals.connect("on_new_song", _on_new_song)

func _input(event) -> void:
	if event.is_action_pressed("next") and next_cnt < 3:
		stop()
		next_cnt += 1
		var new_starting_position = (stream.get_length() / 3.0) * next_cnt
		play(new_starting_position)
		
		song_duration.stop() # stops any previous timers
		song_duration.start()
		print(new_starting_position, " ", song_duration.wait_time)

func _on_new_song(difficulty_duration: float) -> void:
	next_cnt = 1 # resets count
	
	stop() # stops any previous songs
	current_song = selected_songs_dict.keys().pick_random()
	stream = selected_songs_dict[current_song]
	play()
	
	song_duration.stop() # stops any previous timers
	song_duration.wait_time = difficulty_duration
	song_duration.start()

func _on_song_duration_timeout() -> void:
	stop()
