extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




func _on_pop_up_test_hallway_button():
	print("PLEASE")
	var vel = $Player.get_real_velocity()
	print(vel)
	
