extends CharacterBody2D

@onready var countdown = 500

const SPEED = 150.0
const JUMP_VELOCITY = -300.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	if GlobalSystem.Solder == true:
		$SolderAnimatedSprite.show()
		$OrcAnimatedSprite.hide()
	if GlobalSystem.Orc == true:
		$OrcAnimatedSprite.show()
		$SolderAnimatedSprite.hide()
		
	$CountDown.start()
	$NameLabel.text = str(GlobalSystem.PlayerName)
	
func _process(_delta):
	$TimerLabel.text = str(countdown)
	if countdown <= 0:
		$DeadLayer.show()
		$CountDown.stop()
		if GlobalSystem.boy == true:
			$DeadLayer/AnimatedSprite2D.play("Dead")

func _physics_process(delta):
	if not is_on_floor(): #regarde si le perso est sur le sol
		if GlobalSystem.Solder == true:
			$SolderAnimatedSprite.stop()
		elif GlobalSystem.Orc == true:
			$OrcAnimatedSprite.stop()
		$Timer.start()
		velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor() : #regarde si le joueur a appuyer et si il est sur le sol
		velocity.y = JUMP_VELOCITY

	var Direction = Input.get_axis("gauche", "droite") #prend les 2 input gauche et droite pour avancé ou reculé
	if Direction :
		velocity.x = Direction * SPEED 
	else :
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if  velocity.x != 0 : #regarde si le joueur avance (vector + grand que 0)
		if GlobalSystem.Solder == true:
			$SolderAnimatedSprite.play("walk")
			$SolderAnimatedSprite.flip_h = velocity.x < 0
		elif GlobalSystem.Orc == true:
			$OrcAnimatedSprite.play("walk")
			$OrcAnimatedSprite.flip_h = velocity.x < 0
			
	else :
		if GlobalSystem.Solder == true:
			$SolderAnimatedSprite.play("idle")
		if GlobalSystem.Orc == true:
			$OrcAnimatedSprite.play("idle")
		
	move_and_slide() #ca j'en sais rien c'etais avec le charactherBody2D

func _on_count_down_timeout():
	countdown -= 1
