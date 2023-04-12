extends Node2D

@export var eggs:Array[CompressedTexture2D] =	[
						preload("res://assets/eggs/Egg (1).png"),
						preload("res://assets/eggs/Egg (2).png"),
						preload("res://assets/eggs/Egg (3).png"),
						preload("res://assets/eggs/Egg (4).png")
					]
@export var initailSpeed = 50
var eggceleration = 1.5

enum STATES{idle, jump} 

var state = STATES.idle

var speed = initailSpeed

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("jump"):
		GlobalContextProvider.egg.get_parent().owner.active = false
		GlobalContextProvider.egg.jump()
		pass
		
	if state == STATES.jump:
		speed -= eggceleration
		global_position.y -= speed
		pass
	pass

func jump():
	state = STATES.jump

func change_parent(bskt):
	get_parent().remove_child(self)
	bskt.get_node("Path2D/PathFollow2D/EggSlot").add_child(self)


func goIdle():
	state = STATES.idle
	global_position = get_parent().global_position
	speed = initailSpeed
