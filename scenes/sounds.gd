extends Node2D

@onready var jump1 = $Jump1
@onready var jump2 = $Jump2
@onready var jump3 = $Jump3

@onready var die1 = $Die1
@onready var die2 = $Die2
@onready var die3 = $Die3
var jump_sounds
var die_sounds

# Called when the node enters the scene tree for the first time.
func _ready():
	jump_sounds = [jump1,jump2,jump3]
	die_sounds = [die1,die2,die3]
	randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func jump():
	var index = randi_range(0, len(jump_sounds) - 1)
	jump_sounds[index].play()
	
func die():
	var index = randi_range(0, len(die_sounds) - 1)
	die_sounds[index].play()
