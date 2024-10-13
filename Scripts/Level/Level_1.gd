extends Node2D

func _ready():
	SystemLevel.Level = 1
	$Musique.play()
	if CheckpointSys.Lvl1Checkpoint1 == true:
		$Player.position = Vector2(1624, 935)
	if CheckpointSys.Lvl1Checkpoint2 == true:
		$Player.position = Vector2(-349, 935)
		
func _on_mur_letal_body_entered(body) :
	if body is CharacterBody2D :
		$DeadLayer.show()
		if GlobalSystem.Solder == true:
			$DeadLayer/SolderAnimatedSprite2D.play("Dead")
		if GlobalSystem.Orc == true:
			$DeadLayer/OrcAnimatedSprite2D.play("Dead")

func _on_win_area_body_entered(body):
	if body is CharacterBody2D:
		$WinLayer.show()
		$Player/MobileControle.hide()
		SystemLevel.Level = 2
		CheckpointSys.Lvl1Checkpoint1 = false
		CheckpointSys.Lvl1Checkpoint2 = false
		
func _on_checkpoint_1_body_entered(body):
	if body is CharacterBody2D:
		CheckpointSys.Lvl1Checkpoint1 = true

func _on_checkpoint_2_body_entered(body):
	if body is CharacterBody2D:
		CheckpointSys.Lvl1Checkpoint2 = true

