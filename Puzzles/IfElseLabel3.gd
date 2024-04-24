extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	var rand3 = randi_range(1,9)
	
	self.text = "robot working as guard will be have the key

int x = " + str(rand3) + " ;

if ( x < 4 ) {
  System.out.println (  robot 1 is guard  );
}
else if ( x < 7 ) {
  System.out.println (  robot 2 is guard  );
}
else {
  System.out.println (  robot 3 is guard  );
}
"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
