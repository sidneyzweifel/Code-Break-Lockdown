extends CharacterBody2D

func _on_player_detection_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene_to_file("res://Scenes/If_Else_Puzzle_Yaxin.tscn")

"""var speed = 100
var player
var chase = false

func _physics_process(delta):
	if chase == true:

		player = get_node("../../Player/Player")
		var direction = (player.position - self.position).normalized()
		velocity.x = direction.x * speed
		
	else:

		velocity.x = 0
	move_and_slide()


func _on_player_detection_body_entered(body):
	if body.name == "Player":
		chase = true


func _on_player_detection_body_exited(body):
	if body.name == "Player":
		chase = false


func _on_player_attack_body_entered(body):
	get_tree().change_scene_to_file("res://Scenes/If_Else_Puzzle_Yaxin.tscn")
"""
