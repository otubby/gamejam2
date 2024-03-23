extends Area2D
var dragging = false
var done = false

func _ready():
	add_to_group("Steel")
	pass

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
	if area.is_in_group("Steel"):
		done = true
		add_to_group("SteelFinished")
	pass # Replace with function body.
