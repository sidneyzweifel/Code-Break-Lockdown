extends CharacterBody2D

@export var speed = 800 #was going too slow for me so I changed speed

@onready var door_passcode = "res://WIP_Scences/passcode_enter.tscn"

var player_position

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed


func _physics_process(delta):
	get_input()
	move_and_slide()
	get_collision()
	player_position = global_position
	print(player_position)

	
func get_collision():
	#https://docs.godotengine.org/en/stable/tutorials/physics/using_character_body_2d.html
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		#get that the player collied with door and open the passcode entering scene
		print("I collided with ", collision.get_collider().name, i)
		if collision.get_collider().is_in_group("door"):
			
			get_tree().change_scene_to_file(door_passcode)
			pass








