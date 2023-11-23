extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var running: bool = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
	
func _ready():
	stop()

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	if is_on_floor():
		run()

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	move_and_slide()

func run():
	running = true
	velocity.x = 1 * SPEED

func stop():
	running = false
	velocity.x = 0
	
func destroy():
	$AnimationPlayer.play("fade_out")
	
func create(pos):
	position = pos
	$AnimationPlayer.play("fade_in")
