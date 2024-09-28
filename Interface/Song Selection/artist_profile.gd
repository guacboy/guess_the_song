extends TextureButton

@onready var albums = $"../Albums"

func _on_toggled(toggled_on) -> void:
	albums.visible = not albums.visible
