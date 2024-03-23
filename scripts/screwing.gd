extends StaticBody2D
@export var screw : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	var sample : StaticBody2D = screw.instantiate()
	add_child(sample)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
