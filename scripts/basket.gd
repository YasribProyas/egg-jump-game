extends Node2D

@export var progress_speed:float = 0.5

var progress_ratio:float = 0.25 : set = _progress_ratio_set
func _progress_ratio_set(val):
	$Path2D/PathFollow2D.progress_ratio = val
	progress_ratio = val


var active = false



func _process(delta):
	if active:
		$Path2D/PathFollow2D.progress_ratio+=delta*progress_speed
	


func tween_down(basketDistance):
	var tw = create_tween()
	tw.tween_property(self, "position:y", position.y+basketDistance, 1)
	if check_egg_exist():
		await tw.finished
		active = true

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
	pass # Replace with function body.

func _on_area_2d_area_entered(area):
	if area.name == "EggArea2D" and GlobalContextProvider.egg.speed < 0:
		if !check_egg_exist():
			GlobalContextProvider.egg.call_deferred("change_parent",self)
#			$Path2D/PathFollow2D/EggSlot.add_child(GlobalContextProvider.egg)
			get_tree().root.get_node("Main/Game").call_deferred("roll_next")
		else:
			active = true
		GlobalContextProvider.egg.goIdle()
		
	pass

func check_egg_exist():
#	return $Path2D/PathFollow2D/EggSlot/Egg != null
	return GlobalContextProvider.egg.get_parent() == $Path2D/PathFollow2D/EggSlot
