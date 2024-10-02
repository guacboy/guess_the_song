extends Button

func _process(delta) -> void:
	if Data.difficulty_duration > 0.0:
		disabled = false
	else:
		disabled = true

func _on_pressed():
	SongPlayer.stop_song()
	get_tree().change_scene_to_file("res://Interface/Gameplay/gameplay.tscn")
