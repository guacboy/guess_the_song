extends TextureRect

func _ready() -> void:
	Signals.connect("on_new_album_cover", _on_new_album_cover)
	
	if SongPlayer.current_album_cover != null:
		for key in SongPlayer.album_cover_dict:
			if key == SongPlayer.current_album_cover:
				texture = SongPlayer.album_cover_dict[key]

func _on_new_album_cover(album_cover_name: String):
	for key in SongPlayer.album_cover_dict:
		if key == album_cover_name:
			SongPlayer.current_album_cover = album_cover_name
			texture = SongPlayer.album_cover_dict[key]
