extends CharacterBody2D

@export var speed = 400
const gravity = 200.0
const WALK_SPEED = 400.0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func get_input():
	pass


func _process(delta):
	get_input()
	move_and_slide()
	
func _physics_process(delta):
	velocity.y += delta * gravity
	if Input.is_action_pressed("ui_left"):
		velocity.x = -WALK_SPEED
	elif Input.is_action_pressed("ui_right"):
		velocity.x =  WALK_SPEED
	else:
		velocity.x = 0
	var motion = velocity * delta
	move_and_collide(motion)
