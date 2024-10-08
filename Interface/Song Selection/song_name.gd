extends RichTextLabel

func _ready() -> void:
	Signals.connect("on_new_song_name", _on_new_song_name)
	
	_on_new_song_name(SongPlayer.current_song_name_text)

func _on_new_song_name(song_name) -> void:
	SongPlayer.current_song_name_text = song_name
	# displays current song playing
	if song_name != null:
		text = song_name
