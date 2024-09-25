extends Control

@onready var answer = $Answer
@onready var music = $Music

@onready var correct = $"Sound Effects/Correct"
@onready var wrong = $"Sound Effects/Wrong"

func _ready() -> void:
	Signals.emit_signal("on_new_song")

func _input(event) -> void:
	# checks answer
	if event.is_action_pressed("return"):
		if answer.get_parsed_text() == music.current_song:
			correct.play()
			Signals.emit_signal("on_combo_increment", true)
			Signals.emit_signal("on_score_increment")
		else:
			wrong.play()
			Signals.emit_signal("on_combo_increment", false)
		
		# resets text and plays next song
		answer.text = "[center]"
		Signals.emit_signal("on_new_song")
