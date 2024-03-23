extends StaticBody2D
@export var screw : PackedScene
@export var complete : Sprite2D
var screws = []

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in 4:
		var temp : StaticBody2D = screw.instantiate()
		add_child(temp)
		screws.append(temp)
		
	screws[0].position = Vector2(40,40)
	screws[1].position = Vector2(-40,-40)
	screws[2].position = Vector2(40,-40)
	screws[3].position = Vector2(-40,40)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
