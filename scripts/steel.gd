extends Area2D
var dragging = false
var done = false

func _process(delta):
	if dragging and !done:
		position.x = get_global_mouse_position().x

func _on_button_button_down():
	dragging = true
	pass # Replace with function body.

func _on_button_button_up():
	dragging = false
	pass # Replace with function body.

func _on_area_entered(area):
	done = true
	pass # Replace with function body.
