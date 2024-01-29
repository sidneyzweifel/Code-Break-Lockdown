extends CharacterBody2D
@onready var animated_sprite = $AnimatedSprite2D
var direction = ""
@export var speed = 400

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	
	if Input.is_action_pressed("left"):
		animated_sprite.play("walking_side")
		animated_sprite.flip_h = true
		direction = "l"
	
	elif Input.is_action_pressed("right"):
		animated_sprite.play("walking_side")
		animated_sprite.flip_h = false
		direction = "r"
	
	elif Input.is_action_pressed("up"):
		animated_sprite.play("walking_back")
		direction = "u"
	
	elif Input.is_action_pressed("down"):
		animated_sprite.play("walking_front")
		direction = "d"
	
	else:
		if(direction == "l" or direction == "r"):
			animated_sprite.play("idle_side")
		elif direction == "d":
			animated_sprite.play("idle_down")
		elif direction == "u":
			animated_sprite.play("idle_up")
			
				
func _physics_process(delta):
	get_input()
	move_and_slide()
	
