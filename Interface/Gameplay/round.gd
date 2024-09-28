extends RichTextLabel

var round_duration_second: int = 60

func _ready() -> void:
	on_round_duration_decrement()

func on_round_duration_decrement() -> void:
	await get_tree().create_timer(1).timeout
	
	round_duration_second -= 1
	
	text = str(round_duration_second)
	on_round_duration_decrement()
