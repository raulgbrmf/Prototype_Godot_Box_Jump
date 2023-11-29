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
	elif Input.is_action_just_pressed("jump") and (is_on_floor() or is_on_ceiling())  and can_run:
		run()
		jump()

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and (is_on_floor() or is_on_ceiling()):
		jump()

	move_and_slide()

func jump():
	$AnimationPlayer.play("jump")
	$Sounds.jump()
	velocity.y = JUMP_VELOCITY

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
	$Sounds.die()
	$AnimationPlayer.play("fade_out")
	
	
func create(pos):
	can_run = false
	stop()
	$StopTimer.start(0.1)
	position = pos
	rotation = 0
	$AnimationPlayer.play("fade_in")
	
func hit():
	was_hit.emit()
	
func reverse_gravity():
	stop()
	can_run = false
	gravity = gravity * -1
	JUMP_VELOCITY = JUMP_VELOCITY * -1
	$StopTimer.start(0.1)

func _on_stop_timer_timeout():
	if is_on_floor() or is_on_ceiling():
		run()
		can_run = true
	else:
		$StopTimer.start(0.1)
