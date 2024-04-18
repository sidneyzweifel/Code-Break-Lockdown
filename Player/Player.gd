extends CharacterBody2D

@export var speed = 800 #was going too slow for me so I changed speed
@export var has_door_access:bool = false

@onready var player = $"."

var player_position:Vector2

func _process(delta):
	get_player_postion()


func get_player_postion():
	player_position = player.position
	return player_position

@onready var animated_sprite = $AnimatedSprite2D
var direction = ""


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
	get_collision()


	
func get_collision():
	#https://docs.godotengine.org/en/stable/tutorials/physics/using_character_body_2d.html
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
#Each door added to the door group
#when player collides with door the global script decides what happens
#starts with player not having access
		if collision.get_collider().is_in_group("door"):
			Global.handle_door(has_door_access)
			pass
		if collision.get_collider().is_in_group("npc"): #might add future capbablitiy
			pass








