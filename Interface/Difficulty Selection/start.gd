extends Button

var tween := create_tween()

func _ready() -> void:
	on_slide_start_right_to_left(false)

func _process(delta) -> void:
	if Data.difficulty_duration > 0.0:
		disabled = false
	else:
		disabled = true

func _on_pressed():
	SongPlayer.stop_song()
	
	Signals.emit_signal("on_slide_song_name_left_to_right", true)
	Signals.emit_signal("on_slide_album_left_to_right", true)
	Signals.emit_signal("on_slide_mods_right_to_left", true)
	on_slide_start_right_to_left(true)
	await tween.finished
	
	get_tree().change_scene_to_file("res://Interface/Gameplay/gameplay.tscn")

func on_slide_start_right_to_left(is_reversed: bool) -> void:
	# prevents animation from overlapping
	if tween:
		tween.kill()
	tween = create_tween().set_parallel()
	
	# out of frame
	var starting_x_position: float = 1920.0
	var starting_opacity: float = 0.0
	
	if is_reversed:
		tween.tween_property(self, "position:x", starting_x_position, 0.3)
		tween.tween_property(self, "modulate:a", starting_opacity, 0.4)
	else:
		# in frame
		tween.tween_property(self, "position:x", 1344.0, 0.3).from(starting_x_position)
		tween.tween_property(self, "modulate:a", 1.0, 0.4).from(starting_opacity)
