extends CharacterBody2D

var player
var chase = false
var SPEED = 100

func _physics_process(delta):
	if chase == true:
		player = get_node("../../Player/Player")
		var direction = (player.position - self.position).normalized()
		velocity = direction * SPEED
		get_node("AnimatedSprite2D").play("walk_side")

		if direction.x > 0:
			get_node("AnimatedSprite2D").flip_h = false
		elif direction.x <0:
			get_node("AnimatedSprite2D").flip_h = true
		elif direction.y > 0:
			get_node("AnimatedSprite2D").play("walk_front")
		elif direction.y < 0:
			get_node("AnimatedSprite2D").play("walk_back")
			
	else:
		get_node("AnimatedSprite2D").play("idle_front")
		velocity.x = 0
		velocity.y = 0
	move_and_slide()

func _on_player_detection_body_entered(body):
	if body.name == "Player":
		chase = true
		
func _on_player_detection_body_exited(body):
	if body.name == "Player":
		chase = false
