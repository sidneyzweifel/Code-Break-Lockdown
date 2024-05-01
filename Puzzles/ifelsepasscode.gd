extends Label

@onready var ifelsepass = $"Passcode"

# Called when the node enters the scene tree for the first time.
func _ready():
	ifelsepass = Global.get_passcode()
	self.text = "day = wed;
hour = 18;

if ( day != sat || sun ) {
  if ( hour <= 12 ) {  
   37829;
  }
  else {  
   " + ifelsepass + ";  
  }
}
else {
  11028;
}"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
