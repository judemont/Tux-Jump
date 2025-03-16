extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var Score = ScoreManager.new()
	var bestscore = Score.load_score()
	get_node("ColorRect/BestScoreLabel").text = "BEST SCORE: " + str(bestscore)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn") # Replace with function body.
