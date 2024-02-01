extends Area2D

# If player collides with Area2D, change scene
func _on_body_entered(body):
	if body.name == "Player":
		
		# Scene name and position (x,y)
		Global.changeStage(Global.MAIN, 2034, -1138)
