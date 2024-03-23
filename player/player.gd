extends CharacterBody2D

@export var speed = 150
@export var sprite2d : Sprite2D
const gravity = 500.0
const WALK_SPEED = 400.0
const JUMP_FORCE = 175.0
var isBatmanMode = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_input():
	pass

func attack():
	pass

func _process(delta):
	get_input()
	move_and_slide()
	
	if Input.is_action_just_pressed("costumeSwitch") and isBatmanMode == false:
		sprite2d.set_frame(2)
		isBatmanMode = true
	elif isBatmanMode == true:
		sprite2d.set_frame(1)
		isBatmanMode = false
	
	if Input.is_action_just_pressed("attack") and isBatmanMode == true:
		attack()

func _physics_process(delta):
	velocity.y += delta * gravity
	
	if Input.is_action_pressed("ui_left"):
		velocity.x = -WALK_SPEED
	elif Input.is_action_pressed("ui_right"):
		velocity.x =  WALK_SPEED
	else:
		velocity.x = 0
	if Input.is_action_pressed("ui_up") and is_on_floor():
		velocity.y = -JUMP_FORCE
	
	var motion = velocity * delta
	move_and_collide(motion)
