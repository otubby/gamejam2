extends StaticBody2D
@export var rope : Sprite2D
@export var hook : Sprite2D
@export var colliding : CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("CraneRight"):
		position.x+=0.4
	elif Input.is_action_pressed("craneLeft"):
		position.x-=0.4
	elif Input.is_action_pressed("craneUp") and rope.scale.y > 0:
		rope.scale.y -= .01
		rope.position.y -= .155
		hook.position.y -= .31
		colliding.position.y -= .31
		pass
	elif Input.is_action_pressed("craneDown") and rope.scale.y < 100:
		rope.scale.y += .01
		rope.position.y += .155
		hook.position.y += .31
		colliding.position.y += .31
		pass
	elif Input.is_action_pressed("craneGrab"):
		pass
