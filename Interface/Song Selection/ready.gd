extends Button

func _process(delta) -> void:
	if Data.selected_songs_dict.size() > 0:
		disabled = false
	else:
		disabled = true

func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://Interface/Gameplay/gameplay.tscn")
