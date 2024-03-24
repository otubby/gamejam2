extends Sprite2D
@export var verifier : PackedScene
var verifiers = []
var num = 0
@export var speaker : AudioStreamPlayer2D
@export var complete : Sprite2D
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in 4:
		var temp : Area2D = verifier.instantiate()
		add_child(temp)
		verifiers.append(temp)
		temp.connect("detected", enteredZone)
	verifiers[0].position = Vector2(24,12)
	verifiers[1].position = Vector2(-24,12)
	verifiers[2].position = Vector2(-24,-12)
	verifiers[3].position = Vector2(24,-12)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func enteredZone():
	num+=1
	if num >= 4:
		speaker.play()
		complete.visible = true
		await get_tree().create_timer(2).timeout
		get_parent().quene_free()
