extends Node2D

var ArrowSpeed = 75

func _process(delta):
	var velocity = Vector2.ZERO
	
	velocity.x = ArrowSpeed * delta

func _on_area_2d_body_entered(body):
	if body is CharacterBody2D:
		$DeadLayer.show()
		if GlobalSystem.Orc == true:
			$DeadLayer/OrcAnimatedSprite2D.play("Dead")
		elif GlobalSystem.Solder == true:
			$DeadLayer/SolderAnimatedSprite2D.play("Dead")

