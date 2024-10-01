extends CheckBox

@onready var songs = $"../../Songs"

func _on_toggled(toggled_on) -> void:
	var song_list := []
	
	if toggled_on:
		# gets all the songs from the album
		for song_box in songs.get_children():
			for song in song_box.get_children():
				if song is CheckBox:
					song.button_pressed = true
					song_list.append(song)
		
		# picks a random song to play
		var random_song = song_list.pick_random()
		random_song.emit_signal("pressed")
	else:
		for song_box in songs.get_children():
			for song in song_box.get_children():
				if song is CheckBox:
					song.button_pressed = false
