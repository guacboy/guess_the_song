extends ProgressBar

@onready var delay = $Delay

func _process(delta) -> void:
	if value <= 0:
		delay.stop()
		get_tree().change_scene_to_file("res://Interface/Result/results.tscn")

func _on_delay_timeout() -> void:
	value -= 1
