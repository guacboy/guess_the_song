extends Node

func _ready() -> void:
	Signals.connect("on_status_decrement", _on_status_decrement)

func _on_status_decrement(status_type: HBoxContainer) -> void:
	for status in status_type.get_children():
		status.queue_free()
		break
