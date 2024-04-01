extends Label

@onready var binary_label = $"."

func _ready():
	# Access current_passcode variable from get_passcode() in global script
	var passcode = Global.get_passcode()
	
	# Convert passcode to binary
	var binary_string = convert_to_binary(passcode)

	# Displaying binary digits on separate lines
	for i in range(0, binary_string.length(), 4):
		var line = binary_string.substr(i, 4)  # Extract four characters
		line = line.replace("0", "u")  # Replace 0 with 'u (eye)'
		line = line.replace("1", "c")  # Replace 1 with 'c (full circle)'
		binary_label.text += line + "\n"

	print("Puzzle 3 passcode in binary: ", binary_string)
	print("Puzzle 3 passcode in symbols: ", binary_label.text)

# Function to convert 5 digit number to 5 separate binary numbers
func convert_to_binary(number):
	var number_str = str(number)
	var binary_digits = ""
	
	for i in range(number_str.length()):
		var digit = int(number_str[i])
		var binary_digit = ""

		# Convert the digit to binary and pad with leading zeros
		for j in range(4):
			binary_digit = str(digit % 2) + binary_digit
			digit = digit / 2
		binary_digits += binary_digit
		
	return binary_digits
