extends Node2D

func _process(_delta):
	if Input.is_action_just_pressed("Menu"):
		$CanvasLayer.show()

func _on_yes_button_pressed():
	get_tree().change_scene_to_file("res://scenes/Menu/menu_game.tscn")

func _on_no_button_pressed():
	$CanvasLayer.hide()
