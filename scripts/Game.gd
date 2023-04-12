extends Node2D

var BasketPre = preload("res://Basket.tscn")
var EggPre = preload("res://Egg.tscn")
@export var basketDistance = 750
@export var basketStartPos = 2000

var lastBasketPos = basketStartPos

# Called when the node enters the scene tree for the first time.
func _ready():
	var mainBasket = BasketPre.instantiate()
	$baskets.add_child(mainBasket)
	mainBasket.position.y = basketStartPos
	
	var egg = EggPre.instantiate()
	mainBasket.get_node("Path2D/PathFollow2D/EggSlot").add_child(egg)
	GlobalContextProvider.egg = egg
	
	lastBasketPos = spawn_basket(lastBasketPos - basketDistance).position.y
	lastBasketPos = spawn_basket(lastBasketPos - basketDistance).position.y
#	lastBasketPos = spawn_basket(lastBasketPos - basketDistance).position.y
	lastBasketPos-=basketDistance
	
	pass # Replace with function body.

func start():
	show()
	GlobalContextProvider.egg.get_parent().owner.active = true
	pass

func roll_next():
	lastBasketPos = spawn_basket(lastBasketPos).position.y
	get_parent().score += 1
	for basket in $baskets.get_children():
		basket.tween_down(basketDistance)
func spawn_basket(pos:float):
	var spawned_basket = BasketPre.instantiate()
	$baskets.add_child(spawned_basket)
	spawned_basket.global_position.y = pos
	spawned_basket.progress_ratio = RandomNumberGenerator.new().randf_range(0.25, 0.75)
	return spawned_basket

func _on_pause_button_pressed():
	get_tree().current_scene.pause_game()
	pass # Replace with function body.
