extends Control

@onready var answer = $Answer
@onready var music = $Music
@onready var song_duration = $Music/SongDuration

# status
@onready var lives = $Status/Lives
@onready var skips = $Status/Skips

# sound effects
@onready var correct = $SoundEffects/Correct
@onready var wrong = $SoundEffects/Wrong

var difficulty_duration: float = 7.0

func _ready() -> void:
	Signals.emit_signal("on_new_song", difficulty_duration)

func _input(event) -> void:
	if event.is_action_pressed("return") or event.is_action_pressed("skip"):
		# checks if answer is empty
		if event.is_action_pressed("return") and answer.get_parsed_text() != "":
			# checks if answer is correct
			if answer.get_parsed_text() == music.current_song:
				correct.play()
				Signals.emit_signal("on_combo_increment", true)
				Signals.emit_signal("on_score_increment")
			else:
				wrong.play()
				Signals.emit_signal("on_combo_increment", false)
				Signals.emit_signal("on_status_decrement", lives)
		# otherwise, skips song
		else:
			Signals.emit_signal("on_combo_increment", false)
			Signals.emit_signal("on_status_decrement", skips)
		
		# resets text and plays next song
		answer.text = "[center]"
		Signals.emit_signal("on_new_song", difficulty_duration)
