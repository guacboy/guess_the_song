extends ColorRect

@onready var song_name_scroll = $SongNameScroll

var tween := create_tween()

func _ready() -> void:
	Signals.connect("on_slide_song_name_right_to_left", _on_slide_song_name_right_to_left)
	Signals.connect("on_slide_song_name_left_to_right", _on_slide_song_name_left_to_right)
	
	if get_tree().current_scene.name == "DifficultySelection":
		_on_slide_song_name_left_to_right(false)
	if get_tree().current_scene.name == "SongSelection":
		_on_slide_song_name_right_to_left(false)

func _on_slide_song_name_right_to_left(is_reversed: bool) -> void:
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
		tween.tween_property(self, "position:x", 960.0, 0.3).from(starting_x_position)
		tween.tween_property(self, "modulate:a", 1.0, 0.4).from(starting_opacity)

func _on_slide_song_name_left_to_right(is_reversed: bool) -> void:
	# prevents animation from overlapping
	if tween:
		tween.kill()
	tween = create_tween().set_parallel()
		
	var starting_x_position: float = -960.0
	var starting_opacity: float = 0.0
	
	if is_reversed:
		tween.tween_property(self, "position:x", starting_x_position, 0.3)
		tween.tween_property(self, "modulate:a", starting_opacity, 0.4)
	else:
		tween.tween_property(self, "position:x", 0.0, 0.3).from(starting_x_position)
		tween.tween_property(self, "modulate:a", 1.0, 0.4).from(starting_opacity)
