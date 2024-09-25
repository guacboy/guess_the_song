extends RichTextLabel

var round_duration: int = 60

func _ready() -> void:
	on_round_duration_decrement()

func on_round_duration_decrement() -> void:
	await get_tree().create_timer(1.0).timeout
	round_duration -= 1
	text = str(round_duration)
	on_round_duration_decrement()
