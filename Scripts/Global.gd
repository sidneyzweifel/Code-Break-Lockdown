extends CanvasLayer

const MAIN = preload("res://Scenes/Main.tscn")
const VARIABLES = preload("res://Scenes/Variables_Puzzle_Gretta.tscn")
const IF_ELSE = preload("res://Scenes/If_Else_Puzzle_Yaxin.tscn")
const LOOPS = preload("res://Scenes/Loops_Puzzle_Sarah.tscn")
const LOGIC = preload("res://Scenes/Logic_Puzzle_Sidney.tscn")

# Hide loading screen initially
func _ready():
	get_node("ColorRect").hide()
	get_node("Label").hide()

func changeStage(stage_path, x, y):
	# Show loading screen when stage is changed
	get_node("ColorRect").show()
	get_node("Label").show()
	
	# Fade in
	get_node("AnimationPlayer").play("TransIn")
	await get_node("AnimationPlayer").animation_finished
	
	# Change to new scene
	var stage = stage_path.instantiate()
	get_tree().get_root().get_child(1).free() # release current scene 
	get_tree().get_root().add_child(stage) # replace with new scene
	
	# Spawn player in specific spot depending on scene
	stage.get_node("Player").position = Vector2(x,y)
	
	# Fade out
	get_node("AnimationPlayer").play("TransOut")
	await get_node("AnimationPlayer").animation_finished
	
	# Hide loading screen after stage is changed
	get_node("ColorRect").hide()
	get_node("Label").hide()
