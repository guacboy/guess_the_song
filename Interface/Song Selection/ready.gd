extends Button

var tween := create_tween()

func _ready() -> void:
	on_slide_ready_right_to_left(false)

func _process(delta) -> void:
	if Data.selected_songs_dict.size() > 0:
		disabled = false
	else:
		disabled = true

func _on_pressed() -> void:
	Signals.emit_signal("on_slide_song_name_right_to_left", true)
	Signals.emit_signal("on_slide_album_right_to_left", true)
	on_slide_ready_right_to_left(true)
	await tween.finished
	
	get_tree().change_scene_to_file("res://Interface/Difficulty Selection/difficulty_selection.tscn")

func on_slide_ready_right_to_left(is_reversed: bool) -> void:
	# prevents animation from overlapping
	if tween:
		tween.kill()
	tween = create_tween().set_parallel()
	
	var starting_x_position: float = 1920.0
	var starting_opacity: float = 0.0
	
	if is_reversed:
		tween.tween_property(self, "position:x", starting_x_position, 0.3)
		tween.tween_property(self, "modulate:a", starting_opacity, 0.4)
	else:
		tween.tween_property(self, "position:x", 1344.0, 0.3).from(starting_x_position)
		tween.tween_property(self, "modulate:a", 1.0, 0.4).from(starting_opacity)
