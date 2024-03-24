extends Area2D
signal overlappingHook
signal noOverlap
var overlapping = false
# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("SteelBox")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if overlapping:
		emit_signal("overlappingHook")
	else:
		emit_signal("noOverlap")
	pass

func _on_area_entered(area):
	if (area.is_in_group("Hook")):
		overlapping = true
	pass # Replace with function body.

func _on_area_exited(area):
	if area.is_in_group("Hook"):
		overlapping = false
	pass # Replace with function body.
