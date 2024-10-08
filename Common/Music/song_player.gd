extends AudioStreamPlayer2D

var current_song_playing: AudioStreamMP3
var current_song_name_text
@export var album_cover_dict: Dictionary
var current_album_cover: String
		
func stop_song() -> void:
	if is_playing():
		stop()
	
func on_change_song(song_ID: AudioStreamMP3) -> void:
	stop_song()
	stream = song_ID
	play()
