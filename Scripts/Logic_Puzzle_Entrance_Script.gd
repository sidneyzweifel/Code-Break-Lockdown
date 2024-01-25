extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# If player collides with Area2D, change scene
func _on_body_entered(body):
	if body.name == "Player":
		
		# Scene name and position (x,y)
		Global.changeStage(Global.LOGIC, -115, 139)
