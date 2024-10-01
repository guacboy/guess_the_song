extends ScrollContainer

@onready var scroll_right_timer = $ScrollRightTimer
@onready var scroll_left_timer = $ScrollLeftTimer
@onready var song_playing = $"../../SongPlaying"

# inital delay before starting loop
func _on_inital_delay_timeout():
	scroll_right_timer.emit_signal("timeout")

# scrolls the the right
func _on_scroll_right_timer_timeout():
	var tween := create_tween().set_trans(Tween.TRANS_LINEAR)
	tween.tween_property(self, "scroll_horizontal", get_h_scroll_bar().max_value, 10.0)
	scroll_left_timer.start()

# scrolls the the left
func _on_scroll_left_timer_timeout():
	var tween := create_tween().set_trans(Tween.TRANS_LINEAR)
	tween.tween_property(self, "scroll_horizontal", 0, 10.0)
	scroll_right_timer.start()
