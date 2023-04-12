extends Node2D

var score:int = 0 : set = _on_score_change
func _on_score_change(val:int):
	$Game/HUD/Score.text = str(val)
	score = val

# Called when the node enters the scene tree for the first time.
func _ready():
	$Game.hide()
	$Menu.show()
	$Menu/mainMenu.show()
	$Menu/pauseMenu.hide()
	
	pass # Replace with function body.



func start_game():
	$Game.start()
	pass

func pause_game():
	GlobalContextProvider.egg.set_process(false)
	GlobalContextProvider.egg.get_parent().owner.set_process(false)
	$Menu.show()
	$Menu/pauseMenu.show()
func resume_game():
	GlobalContextProvider.egg.set_process(true)
	GlobalContextProvider.egg.get_parent().owner.set_process(true)
	$Game.show()
