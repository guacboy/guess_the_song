extends AudioStreamPlayer2D

var current_song_playing: AudioStreamMP3

func stop_song():
	if is_playing():
		stop()

func on_change_song(song_ID: AudioStreamMP3):
	stop_song()
	stream = song_ID
	play()
