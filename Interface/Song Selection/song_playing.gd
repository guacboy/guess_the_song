extends AudioStreamPlayer2D

@onready var artists = $"../Artists"

func _ready() -> void:
	var song_list := []
	
	# gets all the artists
	for artist_list in artists.get_children():
		for artist in artist_list.get_children():
			if artist is VBoxContainer:
				# gets all the albums
				for album in artist.get_children():
					# gets all the songs from the album
					for song_box in album.get_children():
						for song in song_box.get_children():
							if song is CheckBox:
								song_list.append(song)
		
		# picks a random song to play
		var random_song = song_list.pick_random()
		if random_song != null:
			random_song.emit_signal("pressed")
