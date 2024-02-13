class_name Player extends CharacterBody2D

@export var input_enabled:bool = true
#@onready var sprite: Sprite2D = $Sprite2D ### sz commented out
#@onready var animation_player: AnimationPlayer = $AnimationPlayer ### sz commented out

#####our player script#######
@onready var animated_sprite = $AnimatedSprite2D
var direction = ""
@export var speed_ = 400
###############################

var move_dir:Vector2
const SPEED = 100.0


func _process(_delta: float) -> void:
	
	if Input.is_action_just_pressed("ui_cancel"):
		disable()
		SceneManager.load_new_scene("res://Menus/start_screen.tscn","wipe_to_right")

func _physics_process(_delta: float) -> void:
	if not input_enabled:
		return 
		
	move_dir = Vector2(Input.get_axis("ui_left", "ui_right"),Input.get_axis("ui_up", "ui_down"))
	#orient(move_dir) ### sz commented out
		
	#if move_dir != Vector2.ZERO: ### sz commented out
		#animation_player.play("walk") ### sz commented out
	#else: ### sz commented out
		#animation_player.play("idle") ### sz commented out
	
	if move_dir != Vector2.ZERO:
		var diagonal_dampening:float = 1
		if velocity.x != 0 and velocity.y != 0:
			diagonal_dampening = .7
		velocity.x = move_dir.x * SPEED * diagonal_dampening
		velocity.y = move_dir.y * SPEED * diagonal_dampening
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	####our player script#################
	get_input()
	move_and_slide()
	#######################################

#func orient(dir:Vector2) -> void: ### sz commented out
	#if dir.x: ### sz commented out
		#sprite.flip_h = dir.x < 0 ### sz commented out
		#animated_sprite.flip_h = dir.x < 0 ### our script

func disable():
	input_enabled = false
	#animation_player.play("idle")
	
func enable():
	animated_sprite.play("idle_side") ### our script
	input_enabled = true
	visible = true

###our player script###################
func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed_
	
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
###########################################################################
