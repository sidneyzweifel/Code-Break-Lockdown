extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func play_title_music():
	%ambient.stop()
	%title.play()
	
func title_music_playing():
	if %title.is_playing():
		return true
	else:
		return false
	
func play_ambient_music():
	%ambient.play()
	%title.stop()
	
