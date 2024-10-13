extends Node2D

var ArrowLock = false

func _process(delta) -> void:
	if ArrowLock == true:
		
		
func _on_letal_wall_body_entered(body) -> void:
	if body is CharacterBody2D:
		$DeadLayer.show()
		if GlobalSystem.Orc == true:
			$DeadLayer/OrcAnimatedSprite2D.play("Dead")
		if GlobalSystem.Solder == true:
			$DeadLayer/SolderAnimatedSprite2D.play("Dead")

func _on_collapse_body_entered(body):
	if body is CharacterBody2D:
		$TileMap/SmallCollapse.set_deferred("freeze",false)
		$TileMap/SmallCollapse/Timer.start()

func _on_timer_timeout():
	$TileMap/RigidBodyStatic/CollisionShape2D2.set_deferred("disabled",true)

func _on_pannel_area_body_entered(body):
	if body is CharacterBody2D:
		$TileMap/Text/StartEnterLabel.visible = true

func _on_pannel_area_body_exited(body):
	if body is CharacterBody2D:
		$TileMap/Text/StartEnterLabel.visible = false

func _on_dead_end_area_body_entered(body):
	if body is CharacterBody2D:
		$TileMap/Text/DeadEndLabe.visible = true

func _on_dead_end_area_body_exited(body):
	if body is CharacterBody2D:
		$TileMap/Text/DeadEndLabe.visible = false

func _on_collapse_area_body_entered(body):
	if body is CharacterBody2D:
		$TileMap/NextStepCollapse.set_deferred("freeze",false)


func _on_survivor_area_body_entered(body):
	if body is CharacterBody2D:
		$TileMap/Text/SurvivorNote.visible = true

func _on_survivor_area_body_exited(body):
	if body is CharacterBody2D:
		$TileMap/Text/SurvivorNote.visible = false

func _on_arrow_trap_body_entered(body):
	if body is CharacterBody2D:
		$TileMap/ArrowTrap/Arrow.visible = true
		$TileMap/ArrowTrap/Arrow2.visible = true
		$TileMap/ArrowTrap/Arrow3.visible = true
		ArrowLock = true
