extends Control

func _ready() -> void:
	if SongPlayer.current_song_playing != null:
		SongPlayer.on_change_song(SongPlayer.current_song_playing)
