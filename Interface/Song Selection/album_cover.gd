extends TextureButton

@onready var songs = $"../Songs"
@onready var song_playing = $"../../../../SongPlaying"
@onready var albums = $"../.."

func _on_toggled(toggled_on) -> void:
	songs.visible = not songs.visible
	
	if toggled_on:
		var song_list := []
	
		# gets all the songs from the album
		for song_box in songs.get_children():
			for song in song_box.get_children():
				if song is CheckBox:
					song_list.append(song)
		
		# picks a random song to play
		var random_song = song_list.pick_random()
		random_song.emit_signal("pressed")
