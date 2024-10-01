extends CanvasLayer

@onready var main = $"../"



func _on_resume_pressed() -> void:
	main.pauseMenu()




func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_retry_pressed() -> void:
	main.restart()
