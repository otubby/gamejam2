extends CharacterBody2D

@export var sprite : AnimatedSprite2D
@export var raycast : RayCast2D

var speed = 400
var direction = Vector2.RIGHT
var gravity = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.flip_h = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity.x = direction.x * speed * delta
	move_and_slide()
	sprite.play("walk")
	if not is_on_floor():
		velocity.y += gravity * delta
		
	if is_on_floor() and not raycast.is_colliding():
		direction *= -1
		if sprite.flip_h:
			sprite.flip_h = false
		elif not sprite.flip_h:
			sprite.flip_h = true
		
	if is_on_wall():
		direction *= -1
		if sprite.flip_h:
			sprite.flip_h = false
		elif not sprite.flip_h:
			sprite.flip_h = true
	
	raycast.position.x = 4 * direction.x
