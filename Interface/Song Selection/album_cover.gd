extends TextureButton

@onready var songs = $"../Songs"

func _on_toggled(toggled_on):
	songs.visible = not songs.visible
