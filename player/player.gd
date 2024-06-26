extends CharacterBody2D

@export var speed = 150
@export var sprite2d : AnimatedSprite2D
@export var attackArea : Area2D
var kill = false
const gravity = 100.0
const WALK_SPEED = 30.0
const JUMP_FORCE = 25.0
var isBatmanMode = false
@onready var globalVars = get_node("/root/GlobalVars")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func get_input():
	pass

func attack():
	if isBatmanMode:
		sprite2d.play("attack", 0.9)
		for body in attackArea.get_overlapping_bodies():
			if body.is_in_group("enemy"):
				globalVars.playerKill = true
				#print(globalVars.playerKill)
			else:
				pass
				#globalVars.playerKill = false
				#print(globalVars.playerKill)
		#print(sprite2d.get_playing_speed())
	elif not isBatmanMode:
		for body in attackArea.get_overlapping_areas():
			if body.is_in_group("button1"):
				get_tree().reload_current_scene()

func _process(delta):
	get_input()
	move_and_slide()
	
	if Input.is_action_pressed("costumeSwitch") and not isBatmanMode:
		sprite2d.set_frame(1)
		isBatmanMode = true
		
	elif Input.is_action_pressed("costumeSwitchCivilian") and isBatmanMode:
		sprite2d.set_frame(0)
		isBatmanMode = false

	if Input.is_action_just_pressed("attack") and isBatmanMode == true:
		attack()

func _physics_process(delta):
	velocity.y += delta * gravity
	
	
	if Input.is_action_pressed("ui_left"):
		sprite2d.flip_h = false
		attackArea.position.x = -5
		velocity.x = -WALK_SPEED
		if not isBatmanMode:
			sprite2d.play("Walk_Civ")
		elif isBatmanMode:
			sprite2d.play("Walk_Bat")
	elif Input.is_action_pressed("ui_right"):
		velocity.x =  WALK_SPEED
		sprite2d.flip_h = true
		attackArea.position.x = 5
		if not isBatmanMode:
			sprite2d.play("Walk_Civ")
		elif isBatmanMode:
			sprite2d.play("Walk_Bat")
	else:
		velocity.x = 0
		if not isBatmanMode:
			sprite2d.play("StandStill_Civ")
			if Input.is_action_pressed("attack"):
				attack()
		elif isBatmanMode:
			#print(sprite2d.get_playing_speed())
			if Input.is_action_pressed("attack") and isBatmanMode == true:
				attack()
				#print("test")
			else:
				sprite2d.play("StandStill_Bat")
				globalVars.playerKill = false
	if Input.is_action_pressed("ui_up") and is_on_floor():
		velocity.y = -JUMP_FORCE
	
	var motion = velocity * delta
	move_and_collide(motion)
