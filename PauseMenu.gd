extends Control

func _ready():
	$".".visible = true
	get_tree().paused = true
	
func _process(delta):
	testEsc()


func resume():
	get_tree().paused = false
	#$AnimationPlayer.play_backwards("blur")
	$".".visible = false
	
	
func pause():
	$".".visible = true
	get_tree().paused = true
	#$AnimationPlayer.play("blur")
	
	
func testEsc():
	if Input.is_action_just_pressed("esc"):
		print_debug("Escape key pressed")
		if get_tree().paused:
			print_debug("Game is paused")
			resume()
		else:
			print_debug("Game is not paused")
			pause()


func _on_resume_pressed():
	resume()


func _on_restart_pressed():
	get_tree().reload_current_scene()


func _on_quit_pressed():
	get_tree().quit()
