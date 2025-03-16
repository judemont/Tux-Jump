
class_name ScoreManager 


const SAVE_PATH = "user://score.save"

func save_score(highscore):
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	file.store_var(highscore)
	file.close()

func load_score() -> int:
	var highscore = 0
	if FileAccess.file_exists(SAVE_PATH):
		var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
		highscore = file.get_var()
		file.close()

	return highscore
