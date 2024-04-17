extends CanvasLayer

func change_scene_to_file(target: String) -> void:
	if %error: # if its the wrong input scene and has an error noise
		%error.play() # play error noise
	if %click: # if its the scene transition scene and has a click noise
		%click.play() # play clilck noise
		
	# play the transition
	$AnimationPlayer.play('dissolve')
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file(target)
	$AnimationPlayer.play_backwards('dissolve')
