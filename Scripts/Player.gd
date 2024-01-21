extends CharacterBody2D

@export var speed = 800 #was going too slow for me so I changed speed

@export var is_in_popup = false

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed




func _physics_process(delta):
	if is_in_popup == false:
		get_input()
		move_and_slide()





func _on_pop_up_test_about_to_popup():
	print("I RAN")
	is_in_popup = true




func _on_pop_up_test_closed_window():
	print("MEMMEM")
	is_in_popup = false
