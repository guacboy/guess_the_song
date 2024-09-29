extends Node

@onready var total_value = $TotalValue
@onready var correct_value = $CorrectValue
@onready var missed_value = $MissedValue

func _ready() -> void:
	total_value.text = str(Data.total_songs)
	correct_value.text = str(Data.correct_songs)
	missed_value.text = str(Data.missed_songs)
