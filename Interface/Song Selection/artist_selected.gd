extends CheckBox

@onready var albums = $"../../Albums"

func _on_toggled(toggled_on):
	# gets the entire discovery of the artist
	if toggled_on:
		# gets all the albums
		for album in albums.get_children():
			# gets all the songs from the album
			for song_box in albums.get_children():
				for song in song_box.get_children():
					if song is CheckBox:
						song.button_pressed = true
	else:
		for album in albums.get_children():
			for song_box in albums.get_children():
				for song in song_box.get_children():
					if song is CheckBox:
						song.button_pressed = false
