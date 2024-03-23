extends StaticBody2D
var rotationProg = 0
var rotating = false
var lockedIn = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if rotating and !lockedIn:
		rotation+=0.0349066
		rotationProg+=1
		print(rotationProg)
	if rotationProg >= 180:
		lockedIn = true

func _on_button_button_down():
	rotating = true
	pass # Replace with function body.

func _on_button_button_up():
	rotating = false
	pass # Replace with function body.
