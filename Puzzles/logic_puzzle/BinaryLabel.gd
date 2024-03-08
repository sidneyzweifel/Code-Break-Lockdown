extends Label

@onready var binary_label = $"."

func _ready():
	# access current_passcode variable from get_passcode() in global script
	var passcode = Global.get_passcode()
	
	# convert passcode to binary
	var binary_digits = convert_to_binary(passcode)

	# displaying binary digits on the passcode_label
	for binary_digit in binary_digits:
		binary_label.text += binary_digit + "\n"
	
	print(binary_digits)

# function to convert 5 digit number to 5 seperate binary nnumbers
func convert_to_binary(number):
	var number_str = str(number)
	var binary_digits = []
	
	for i in range(number_str.length()):
		var digit = int(number_str[i])
		var binary_digit = ""

		# convert the digit to binary and pad with leading zeros
		for j in range(4):
			binary_digit = str(digit % 2) + binary_digit
			digit = digit / 2
		binary_digits.append(binary_digit)
		
	return binary_digits
