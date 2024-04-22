extends Node2D

@onready var p = $Window
@onready var detail = $Window/ColorRect/Detail
# Called when the node enters the scene tree for the first time.
func _ready():
	p.hide()
	detail.hide()
	pass # Replace with function body.



func _on_button_pressed():
	p.show()
	$Window/ColorRect/Start.show()
	$Window/ColorRect/Options.hide()
	$Window/ColorRect/Detail.hide()
	


func _on_window_close_requested():
	p.hide()

func for_loop_button_pressed(button_type):
	$Window/ColorRect/Options.hide()
	detail.show()
	$Window/ColorRect/Detail/OptionSelectedTitle.set_text(button_type)
	match button_type:
		"Starting condition":
			$Window/ColorRect/Detail/Description.set_text("determines what item the loop starts at")
		"Continuing condition":
			$Window/ColorRect/Detail/Description.set_text("determines the condition for the loop to continue")
		"Changing condition":
			$Window/ColorRect/Detail/Description.set_text("determine what happens each time the loop interates")


func _on_start_pressed():
	for_loop_button_pressed("Starting condition")
	pass # Replace with function body.


func _on_condtion_pressed():
	for_loop_button_pressed("Continuing condition")
	pass # Replace with function body.


func _on_change_pressed():
	for_loop_button_pressed("Changing condition")
	pass # Replace with function body.





func _on_demo_pressed():
	Puzzle4Autoload.handle_scene_changes_before_solving()
	var cur = get_tree().current_scene
	cur.queue_free()
	get_tree().change_scene_to_file("res://NPC/LoopGuide/LoopsDemo.tscn")


func _on_review_for_loops_pressed():
	$Window/ColorRect/Start.hide()
	$Window/ColorRect/Options.show()


func _on_go_back_options_pressed():
	$Window/ColorRect/Detail.hide()
	$Window/ColorRect/Options.show()



func _on_go_back_start_pressed():
	$Window/ColorRect/Options.hide()
	$Window/ColorRect/Start.show()
