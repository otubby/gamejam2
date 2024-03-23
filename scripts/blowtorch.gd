extends Area2D
var dragging = false
var welding = false
var weldingProg = 0
@export var bar : ProgressBar
@export var animPlayer : AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if dragging:
		global_position = get_global_mouse_position()
	if welding:
		bar.value+=0.3
		animPlayer.play("blowing")
	else:
		animPlayer.play("notblowing")
	if bar.value >= 100:
		get_parent().quene_free()

func _on_button_button_down():
	dragging=true
	pass # Replace with function body.

func _on_button_button_up():
	dragging = false
	pass # Replace with function body.

func _on_area_entered(area):
	if area.is_in_group("SteelFinished"):
		bar.visible = true
		welding = true
	pass # Replace with function body.
	
func _on_area_exited(area):
	if area.is_in_group("SteelFinished"):
		bar.visible = false
		welding = false
	pass # Replace with function body.


