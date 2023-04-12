extends Control


func _on_resume_button_pressed():
	get_tree().current_scene.resume_game()
	get_parent().hide()


func _on_main_menu_button_pressed():
	get_tree().reload_current_scene()
	pass # Replace with function body.
