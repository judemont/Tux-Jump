extends Control

func _ready() -> void:
	var Score = ScoreManager.new()
	var bestscore = Score.load_score()
	get_node("ColorRect/BestScoreLabel").text = "BEST SCORE: " + str(bestscore)
	get_node("ColorRect/ScoreLabel").text = "SCORE: " + str(Global.score)


func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn") # Replace with function body.


func _on_home_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/home.tscn") # Replace with function body.
