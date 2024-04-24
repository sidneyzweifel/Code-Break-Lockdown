extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	
	var rand2 = randi_range(1,9)
	
	self.text = "only the door leading to the cafeteria is 
the safe route. 

int x = " + str(rand2) + " ;             

if ( x < 7 ) {
  if ( x < 4 ) {
	System.out.println (  door1 leads to cafe  );
  }
  else {
	System.out.println (  door2 leads to cafe  );
  }
}
else {
	System.out.println (  door3 leads to cafe  );
}"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
