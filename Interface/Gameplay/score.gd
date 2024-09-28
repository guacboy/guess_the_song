extends RichTextLabel

# scoring system
var current_score: int = 0
var combo: int = 0

func _ready():
	Signals.connect("on_combo_increment", _on_combo_increment)
	Signals.connect("on_score_increment", _on_score_increment)

func _on_combo_increment(is_increment: bool) -> void:
	combo += 1
	
	if !is_increment:
		combo = 0

func _on_score_increment() -> void:
	current_score += 100 * combo
	
	# if player reaches max score, the score will cap
	if current_score >= 99999900:
		current_score = 99999900

	text = str(current_score).pad_zeros(8)
