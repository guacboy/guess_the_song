extends TextureButton

@onready var songs = $"../Songs"

func _on_toggled(toggled_on) -> void:
	songs.visible = not songs.visible
