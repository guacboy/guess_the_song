extends TextureButton

@onready var albums = $"../Albums"

func _on_toggled(toggled_on):
	albums.visible = not albums.visible
