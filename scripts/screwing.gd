extends StaticBody2D
@export var screw : PackedScene
@export var complete : Sprite2D
@export var speaker : AudioStreamPlayer2D
var screws = []
var progression = 0 

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in 4:
		var temp : StaticBody2D = screw.instantiate()
		temp.connect("connected", progress)
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
	
func progress():
	progression+=1
	print(progression)
	if progression >= 4:
		complete.visible = true
		speaker.play()
		await get_tree().create_timer(2).timeout
		get_parent().queue_free()
		
