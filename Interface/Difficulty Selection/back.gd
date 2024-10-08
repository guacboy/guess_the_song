extends TextureButton

func _input(event) -> void:
	if Input.is_action_pressed("back"):
		get_tree().change_scene_to_file("res://Interface/Song Selection/song_selection.tscn")
		

func _on_pressed():
	get_tree().change_scene_to_file("res://Interface/Song Selection/song_selection.tscn")
