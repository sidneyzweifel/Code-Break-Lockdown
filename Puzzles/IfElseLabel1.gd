extends Label

# Called when the node enters the scene tree for the first time.
func _ready():
	var rand = randi_range(0,1)
	
	self.text = "robots will capture prisoners that escapes. press
	the correct button to deactivate robots 
	int x = " + str(rand) + " ;
	if ( x == 0 ) {
	System.out.println (  red button deactivates  );
	}
	else {
	System.out.println (  blue button deactivates  );
	}"



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
