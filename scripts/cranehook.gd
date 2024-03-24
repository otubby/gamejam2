extends Area2D
@export var rope : Sprite2D
@export var hook : Sprite2D
@export var colliding : CollisionShape2D
@export var box : Area2D
var overlapping = false
var connected = false
var startY = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("Hook")
	box.connect("overlappingHook", enter)
	box.connect("noOverlap", exit)
	var startY = box.global_position.y
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("CraneRight"):
		if !connected:
			position.x+=0.4
		elif startY < box.global_position.y and connected:
			position.x+=0.4
			box.position.x+=0.4
	elif Input.is_action_pressed("craneLeft"):
		if !connected:
			position.x-=0.4
		elif startY < box.global_position.y and connected:
			position.x-=0.4
			box.position.x-=0.4
	elif Input.is_action_pressed("craneUp") and rope.scale.y > 0:
		rope.scale.y -= .01
		rope.position.y -= .155
		hook.position.y -= .31
		colliding.position.y -= .31
		if connected:
			box.global_position.y -= .31
		pass
	elif Input.is_action_pressed("craneDown") and rope.scale.y < 100:
		rope.scale.y += .01
		rope.position.y += .155
		hook.position.y += .31
		colliding.position.y += .31
		if startY < box.global_position.y and connected:
			box.global_position.y +=.31
		
	elif Input.is_action_pressed("craneGrab") and overlapping:
		connected = !connected
		pass

func enter():
	overlapping = true
	pass
	
func exit():
	overlapping = false
	pass
