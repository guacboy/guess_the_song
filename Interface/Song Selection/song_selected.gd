extends CheckBox

@export var song_selected_ID: Dictionary = {}

func _on_toggled(toggled_on):
	var action: String = "del"
	
	if toggled_on:
		action = "add"
	
	for key in song_selected_ID:
		Data.selected_songs_dict[key] = song_selected_ID[key]
