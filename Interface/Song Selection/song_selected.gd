extends CheckBox

@export var song_selected_ID: Dictionary = {}

func _on_toggled(toggled_on) -> void:
	if toggled_on:
		for key in song_selected_ID:
			Data.selected_songs_dict[key] = song_selected_ID[key]
	else:
		for key in song_selected_ID:
			Data.selected_songs_dict.erase(key)
