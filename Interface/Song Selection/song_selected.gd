extends CheckBox

@onready var artist_name = $"../../../../../ArtistProfile/ArtistName"
@onready var album_name = $"../../../AlbumCover/AlbumName"
@onready var song_name = $"../../../../../../../SongNameBackground/SongNameScroll/SongName"

@export var artist_feature_name: String
@export var song_selected_ID: Dictionary

func _on_toggled(toggled_on) -> void:
	if toggled_on:
		for key in song_selected_ID:
			Data.selected_songs_dict[key] = song_selected_ID[key]
	else:
		for key in song_selected_ID:
			Data.selected_songs_dict.erase(key)

func _on_pressed() -> void:
	for key in song_selected_ID:
		# avoids repeating start of song if same song is being toggled
		if SongPlayer.current_song_playing != song_selected_ID[key]:
			SongPlayer.current_song_playing = song_selected_ID[key]
			SongPlayer.on_change_song(song_selected_ID[key])
			
			# displays current song playing
			song_name.text = key + " - " + artist_name.text
			if artist_feature_name != null:
				song_name.text += " (ft. " + artist_feature_name + ")"
				
	Signals.emit_signal("on_new_album_cover", album_name.text)
