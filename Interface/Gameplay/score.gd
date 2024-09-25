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
	
	# allows for the zero placeholders on the left
	var zero_placeholder: String = ""
	if current_score >= 10000000:
		pass
	elif current_score >= 1000000:
		zero_placeholder = "0"
	elif current_score >= 100000:
		zero_placeholder = "00"
	elif current_score >= 10000:
		zero_placeholder = "000"
	elif current_score >= 1000:
		zero_placeholder = "0000"
	elif current_score >= 100:
		zero_placeholder = "00000"
	elif current_score >= 10:
		zero_placeholder = "000000"
	
	# if player reaches max score, the score will cap
	if current_score >= 99999900:
		current_score = 99999900

	text = zero_placeholder + str(current_score)
