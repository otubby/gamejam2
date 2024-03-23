extends StaticBody2D
var rotationProg = 0
var rotating = false
var lockedIn = false
@export var bar : ProgressBar
@export var sprite : Sprite2D
signal connected

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if rotating and !lockedIn:
		sprite.rotation+=0.0349066
		rotationProg+=1
	if rotationProg >= 180:
		lockedIn = true
		bar.visible = false
		emit_signal("connected")
	bar.value = rotationProg

func _on_button_button_down():
	rotating = true
	bar.visible = true
	pass # Replace with function body.

func _on_button_button_up():
	rotating = false
	bar.visible = false
	pass # Replace with function body.
