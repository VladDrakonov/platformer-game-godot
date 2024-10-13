extends CanvasLayer

func _ready():
	if GlobalSystem.Solder == true:
		$SolderAnimatedSprite2D.set_deferred("visible",true)
		$OrcAnimatedSprite2D.set_deferred("visible",false)
	elif GlobalSystem.Orc == true:
		$OrcAnimatedSprite2D.set_deferred("visible",true)
		$SolderAnimatedSprite2D.set_deferred("visible",false)
		
func _on_level1_restart_button_pressed():
	get_tree().reload_current_scene()

func _on_quit_button_pressed():
	get_tree().quit()

func _on_menu_button_pressed():
	CheckpointSys.Lvl1Checkpoint1 = false
	CheckpointSys.Lvl1Checkpoint2 = false
	CheckpointSys.Lvl2Checkpoint1 = false
	CheckpointSys.Lvl3Checkpoint1 = false
	CheckpointSys.Lvl3Checkpoint2 = false
	CheckpointSys.Lvl3Checkpoint3 = false
	CheckpointSys.Lvl4Checkpoint1 = false
	CheckpointSys.Lvl4Checkpoint2 = false
	CheckpointSys.Lvl6Checkpoint1 = false
	CheckpointSys.Lvl6Checkpoint2 = false
	CheckpointSys.Lvl7Checkpoint1 = false
	CheckpointSys.Lvl7Checkpoint1 = false
	CheckpointSys.Lvl8Checkpoint1 = false
	CheckpointSys.Lvl8Checkpoint1 = false
	CheckpointSys.Lvl8Checkpoint2 = false
	CheckpointSys.Lvl8Checkpoint3 = false
	CheckpointSys.Lvl9Checkpoint1_1 = false
	CheckpointSys.Lvl9Checkpoint1_2 = false
	CheckpointSys.Lvl9Checkpoint3 = false
	CheckpointSys.Lvl10Checkpoint = false
	get_tree().change_scene_to_file("res://scenes/Menu/menu_game.tscn")
