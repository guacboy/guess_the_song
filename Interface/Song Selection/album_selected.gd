extends CheckBox

@onready var songs = $"../../Songs"

func _on_toggled(toggled_on):
	if toggled_on:
		# gets all the songs from the album
		for song_box in songs.get_children():
			for song in song_box.get_children():
				if song is CheckBox:
					song.button_pressed = true
	else:
		for song_box in songs.get_children():
			for song in song_box.get_children():
				if song is CheckBox:
					song.button_pressed = false
