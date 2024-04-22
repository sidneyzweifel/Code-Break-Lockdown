extends Node2D


var inequality:String
var change_val:String

var paramters_set:bool = false
var for_loop_set:bool = false
var option_num:int = -1

var for_loop_method_num:int

var instruction:Array = ["i starts at ", 
"check if i is ", 
"the current value of i is "]

var loop_method
# Called when the node enters the scene tree for the first time.
func _ready():
	$"Window/ColorRect/VBoxContainer/instruction/current step explained".set_text("Please select parameters for loop")
	$"Window/ColorRect/VBoxContainer/nav_buttons/previous step".hide()
	$"Window/ColorRect/VBoxContainer/nav_buttons/next step".hide()
	$"Window/ColorRect/VBoxContainer/for loop".hide()
	$Window/ColorRect/VBoxContainer/nav_buttons/enter.show()



func _on_inequality_item_selected(index):
	match index:
		0:
			inequality = "less_than"
		1:
			inequality = "more_than"
		2: 
			inequality = "less_than_or_equal"
		3:
			inequality = "more_than_or_equal"
	pass # Replace with function body.


func _on_change_item_selected(index):
	match index:
		0:
			change_val = "increment"
		1:
			change_val = "decrement"
	pass # Replace with function body.


func _on_enter_pressed():
	#if the the user entered values match this case
	#then set the loop text to for(int i = 0; i < (or <=) 3; i++)
	if(inequality == "less_than" or inequality == "less_than_or_equal"):
		if(change_val == "increment"):
			paramters_set = true
			$Window/ColorRect/VBoxContainer/loop/for_loop.set_text("for (int i = 0; i")
			$Window/ColorRect/VBoxContainer/loop/i.set_text("3; i")
			
			$"Window/ColorRect/VBoxContainer/instruction/current step explained".hide()
			$Window/ColorRect/VBoxContainer/nav_buttons/enter.hide()
			$"Window/ColorRect/VBoxContainer/nav_buttons/previous step".show()
			$"Window/ColorRect/VBoxContainer/nav_buttons/next step".show()
		else:
			var error_txt:String = "With the parameters you have set the loop will not terminate or not run."
			$"Window/ColorRect/VBoxContainer/instruction/current step explained".set_text(error_txt)
	##if the the user entered values match this case
	#then set the loop text to for(int i = 3; i < (or <=) 0; i++)
	if(inequality == "more_than" or inequality == "more_than_or_equal"):
		if(change_val == "decrement"):
			paramters_set = true
			$Window/ColorRect/VBoxContainer/loop/for_loop.set_text("for (int i = 3; i")
			$Window/ColorRect/VBoxContainer/loop/i.set_text("0; i")
			
			$"Window/ColorRect/VBoxContainer/instruction/current step explained".hide()
			$Window/ColorRect/VBoxContainer/nav_buttons/enter.hide()
			$"Window/ColorRect/VBoxContainer/nav_buttons/previous step".show()
			$"Window/ColorRect/VBoxContainer/nav_buttons/next step".show()
		else:
			var error_txt:String = "With the parameters you have set the loop will not terminate or not run."
			$"Window/ColorRect/VBoxContainer/instruction/current step explained".set_text(error_txt)
	set_instruction_text("If you're happy with these parameters, press Next Step to continue.\n
	If you would like to change the parameters, click Previous Step.")
	$"Window/ColorRect/VBoxContainer/instruction/current step explained".show()


func _on_previous_step_pressed():
	#allow the player to reset the parameters they chose if they want something different
	if(paramters_set and !for_loop_set):
		paramters_set = false
		_ready()
	else:
		#previous button made into a button option to determine if loop should continue
		#this is the case where the user said No when the loop should have continued
		#will reset all the steps so the player has to start over with same paramater
		if(loop_continue()):
			set_instruction_text("Loop should continue. \nLet's go back and try again")
			$"Window/ColorRect/VBoxContainer/nav_buttons/previous step".hide()
			$"Window/ColorRect/VBoxContainer/nav_buttons/next step".set_text("Next" + "\n" + "Step")
			option_num = 0
			loop_method.reset_i(for_loop_method_num)
		else:
			#case if look should have ended 
			end_loop()
	pass # Replace with function body.
	



func _on_next_step_pressed():
	option_num += 1
	var for_loop_txt:String
	
	$Window/ColorRect/VBoxContainer/loop.hide()
	if(inequality == "less_than" and change_val == "increment"):
		for_loop_txt = "for (int i = 0; i < 3; i++)"
		for_loop_method_num = 1
	if(inequality == "less_than_or_equal" and change_val == "increment"):
		for_loop_txt = "for (int i = 0; i <= 3; i++)"
		for_loop_method_num = 2
	if(inequality == "more_than" and change_val == "decrement"):
		for_loop_txt = "for (int i = 3; i > 0; i--)"
		for_loop_method_num = 3
	if(inequality == "more_than_or_equal" and change_val == "decrement"):
		for_loop_txt = "for (int i = 3; i >= 0; i-- )"
		for_loop_method_num = 4
	if(!for_loop_set):
		set_loop_method(for_loop_method_num)
		for_loop_set = true
	$"Window/ColorRect/VBoxContainer/for loop/for_loop".set_text(for_loop_txt)
	$"Window/ColorRect/VBoxContainer/for loop".show()
	$"Window/ColorRect/VBoxContainer/nav_buttons/previous step".hide()
	next_option()
	pass # Replace with function body.


func set_loop_method(method_num):
	loop_method = Loop_Method.new()
	loop_method.set_values(method_num)

func set_instruction_text(txt):
	$"Window/ColorRect/VBoxContainer/instruction/current step explained".set_text(txt)

func next_option():
	var instruction_txt:String
	$"Window/ColorRect/VBoxContainer/instruction/current step explained".show()
	match option_num:
		0:
			instruction_txt = "Let's get started!"
			set_instruction_text(instruction_txt)
		1:
			#tell user what loop starts at
			instruction_txt = instruction[0] + str(loop_method.start_val)
			set_instruction_text(instruction_txt)
		2:
			#tells user next step
			#check if the condtional statement is true or not
			instruction_txt = instruction[1] + str(loop_method.check) + str(loop_method.end_val)
			set_instruction_text("Now let's check if " + instruction_txt)
		3:
			#walks the player through conditional statement and asks for understanding
			#by asking them if the loop should continue or not
			instruction_txt = instruction[2] + str(loop_method.current_val_of_i)
			instruction_txt += "\nIf the following statement makes sense, then the loop should continue: "
			instruction_txt += "\n" + str(loop_method.current_val_of_i) + " is " + str(loop_method.check) + str(loop_method.end_val)
			instruction_txt += "\n" + "Should loop continue?"
			set_instruction_text(instruction_txt)
			$"Window/ColorRect/VBoxContainer/nav_buttons/previous step".set_text("No")
			$"Window/ColorRect/VBoxContainer/nav_buttons/next step".set_text("Yes")
			$"Window/ColorRect/VBoxContainer/nav_buttons/previous step".show()
		4:
			if(loop_continue()):
				#option if player picked yes the loop should continue
				$"Window/ColorRect/VBoxContainer/nav_buttons/next step".set_text("Next" + "\n" + "Step")
				instruction_txt = str(loop_method.change_statement)
				set_instruction_text("That's right! " + instruction_txt)
			else:
				#will run when the loop should not continue 
				end_loop()
		5: 
			#tells the player the current value of i
			instruction_txt = instruction[2] + str(loop_method.change_i(for_loop_method_num))
			set_instruction_text(instruction_txt)
			option_num = 1
			
	pass


#will return true or false depending on loop method and condtions
func loop_continue():
	return loop_method.check_loop_terminate(for_loop_method_num)
	

#reset all loop parameters and all changed varibles and start again
func end_loop():
	$"Window/ColorRect/VBoxContainer/nav_buttons/previous step".set_text("Previous" + "\n" + "Step")
	$"Window/ColorRect/VBoxContainer/nav_buttons/next step".set_text("Next" + "\n" + "Step")
	$"Window/ColorRect/VBoxContainer/for loop".hide()
	$Window/ColorRect/VBoxContainer/loop.show()
	paramters_set = true
	for_loop_set = false
	option_num = -1
	$"Window/ColorRect/VBoxContainer/instruction/current step explained".show()
	$Window/ColorRect/VBoxContainer/nav_buttons/enter.show()
	_ready()
	set_instruction_text("Loop should end.\nFeel free to try again with different parameters!")

#go back to puzzle 4 scene
func _on_back_pressed():
	var cur = get_tree().current_scene
	cur.queue_free()
	get_tree().change_scene_to_file("res://Puzzles/Puzzle4_TEST.tscn")
