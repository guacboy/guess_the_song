extends TextureRect

var tween := create_tween()

func _ready() -> void:
	Signals.connect("on_new_album_cover", _on_new_album_cover)
	Signals.connect("on_slide_album_right_to_left", _on_slide_album_right_to_left)
	Signals.connect("on_slide_album_left_to_right", _on_slide_album_left_to_right)
	
	# displays same album cover from song_selection to difficulty_selection
	for key in SongPlayer.album_cover_dict:
		if key == SongPlayer.current_album_cover:
			texture = SongPlayer.album_cover_dict[key]
			
			if get_tree().current_scene.name == "DifficultySelection":
				_on_slide_album_left_to_right(false)
			if get_tree().current_scene.name == "SongSelection":
				_on_slide_album_right_to_left(false)

func _on_new_album_cover(album_cover_name: String):
	# prevents album redisplaying when clicked again
	if album_cover_name == SongPlayer.current_album_cover:
		return
	for key in SongPlayer.album_cover_dict:
		if key == album_cover_name:
			SongPlayer.current_album_cover = album_cover_name
			texture = SongPlayer.album_cover_dict[key]
	
	_on_slide_album_right_to_left(false)

func _on_slide_album_right_to_left(is_reversed: bool) -> void:
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
		tween.tween_property(self, "position:x", 896.001, 0.3).from(starting_x_position)
		tween.tween_property(self, "modulate:a", 1.0, 0.4).from(starting_opacity)
	
func _on_slide_album_left_to_right(is_reversed: bool) -> void:
	# prevents animation from overlapping
	if tween:
		tween.kill()
	tween = create_tween().set_parallel()
	
	var starting_x_position: float = -732
	var starting_opacity: float = 0.0
	
	if is_reversed:
		tween.tween_property(self, "position:x", starting_x_position, 0.3)
		tween.tween_property(self, "modulate:a", starting_opacity, 0.4)
	else:
		tween.tween_property(self, "position:x", -448.0, 0.3).from(starting_x_position)
		tween.tween_property(self, "modulate:a", 1.0, 0.4).from(starting_opacity)
