class_name Loop_Method extends Node

var start_val: int
var current_val_of_i: int
var end_val: int
var check:String
var change_statement:String

#functions used in LoopsDemo 
#each loop method treated like an Object

func set_values(loop_method_num:int):
	match loop_method_num:
		1:
			start_val = 0
			current_val_of_i = 0
			end_val = 3
			check = "less than "
			change_statement = "add 1 to i"
		2:
			start_val = 0
			current_val_of_i = 0
			end_val = 3
			check = "less than or equal to "
			change_statement = "add 1 to i"
			
		3:
			start_val = 3
			current_val_of_i = 3
			end_val = 0
			check = "more than "
			change_statement = "subtract 1 from i"
		4:
			start_val = 3
			current_val_of_i = 3
			end_val = 0
			check = "more than or equal to "
			change_statement = "subtract 1 from i"
	pass
	
func change_i(loop_method_num:int):
	match loop_method_num:
		1:
			self.current_val_of_i += 1
		2:
			self.current_val_of_i += 1
		3:
			self.current_val_of_i -= 1
		4:
			self.current_val_of_i -= 1
	return current_val_of_i
	
	
func check_loop_terminate(loop_method_num:int):
		match loop_method_num:
			1:
				return self.current_val_of_i < self.end_val
			2:
				return self.current_val_of_i <= self.end_val
			3:
				return self.current_val_of_i > self.end_val
			4:
				return self.current_val_of_i >= self.end_val

#if player gets loop continue question incorrect need to reset i
func reset_i(loop_method_num:int):
	match loop_method_num:
		1:
			self.current_val_of_i = 0
		2:
			self.current_val_of_i = 0
		3:
			self.current_val_of_i = 3
		4:
			self.current_val_of_i = 3
	return current_val_of_i

