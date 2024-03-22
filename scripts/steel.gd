extends StaticBody2D
var dragging = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if dragging:
		position.x = get_global_mouse_position().x

func _on_button_button_up():
	dragging = false

func _on_button_button_down():
	dragging = true
