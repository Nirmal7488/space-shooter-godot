
extends CanvasLayer

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS

	$Panel/RestartButton.pressed.connect(_restart_game)

func _restart_game() -> void:
	print("Restart button clicked!")

	get_tree().paused = false
	get_tree().reload_current_scene()
