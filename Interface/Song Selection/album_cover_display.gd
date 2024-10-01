extends TextureRect

@export var album_cover_ID: Dictionary

func _ready() -> void:
	Signals.connect("on_new_album_cover", _on_new_album_cover)

func _on_new_album_cover(album_cover_name: String):
	for key in album_cover_ID:
		if key == album_cover_name:
			texture = album_cover_ID[key]
