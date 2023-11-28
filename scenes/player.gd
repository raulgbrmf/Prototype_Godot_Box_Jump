extends CharacterBody2D


const SPEED = 270.0
var JUMP_VELOCITY = -500.0

var can_run: bool = true

var effect_explosion = preload("res://scenes/explosion.tscn")

signal was_hit

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity") * 1.5
	
func _ready():
	stop()

func _physics_process(delta):
	# Add the gravity.
	velocity.y += gravity * delta
	
	if is_on_floor() and Globals.get_levels() != 1 and can_run:
		run()
	elif Input.is_action_just_pressed("jump") and is_on_floor() and can_run:
		run()
		$AnimationPlayer.play("jump")
		velocity.y = JUMP_VELOCITY

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		$AnimationPlayer.play("jump")
		velocity.y = JUMP_VELOCITY

	move_and_slide()

func run():
	print("running")
	velocity.x = 1 * SPEED

func stop():
	print("stopping")
	velocity.x = 0
	
func destroy():
	var explosion = effect_explosion.instantiate()
	add_child(explosion)
	explosion.global_position = position
	velocity = Vector2(0,0)
	$AnimationPlayer.play("fade_out")
	
	
func create(pos):
	position = pos
	rotation = 0
	$AnimationPlayer.play("fade_in")
	
func hit():
	was_hit.emit()
	
func reverse_gravity():
	stop()
	can_run = false
	print("GRAVITY REVERSED")
	gravity = gravity * -1
	JUMP_VELOCITY = JUMP_VELOCITY * -1
	$StopTimer.start(0.01)

func _on_stop_timer_timeout():
	run()
	can_run = true
