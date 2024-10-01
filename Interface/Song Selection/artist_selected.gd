extends CheckBox

@onready var albums = $"../../Albums"

func _on_toggled(toggled_on) -> void:
	var song_list := []
	
	# gets the entire discovery of the artist
	if toggled_on:
		# gets all the albums
		for album_list in albums.get_children():
			for album in album_list.get_children():
				# gets all the songs from the album
				for song_box in album.get_children():
					for song in song_box.get_children():
						if song is CheckBox:
							song.button_pressed = true
							song_list.append(song)
		
		# picks a random song to play
		var random_song = song_list.pick_random()
		random_song.emit_signal("pressed")
	else:
		for album in albums.get_children():
			for song_box in album.get_children():
				for song in song_box.get_children():
					if song is CheckBox:
						song.button_pressed = false
