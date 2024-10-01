extends TextureButton

@onready var albums = $"../Albums"

func _on_toggled(toggled_on) -> void:
	albums.visible = not albums.visible

	# gets the entire discovery of the artist
	if toggled_on:
		var song_list := []
		
		# gets all the albums
		for album_list in albums.get_children():
			for album in album_list.get_children():
				# gets all the songs from the album
				for song_box in album.get_children():
					for song in song_box.get_children():
						if song is CheckBox:
							song_list.append(song)
		
		# picks a random song to play
		var random_song = song_list.pick_random()
		random_song.emit_signal("pressed")
