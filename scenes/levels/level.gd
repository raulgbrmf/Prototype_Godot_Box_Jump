extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$Player.create($SpawnPoint.position)
	randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	restart_level()

func restart_level():
	if Input.is_action_pressed("enter"):
		print("entered")
		$Player.destroy()
		$RespawnTimer.start()

func choose_random_index(array):
	var array_size = len(array)
	return (randi() % array_size)

func _on_respawn_timer_timeout():
	$Player.create($SpawnPoint.position)
	$RespawnTimer.stop()

func _on_player_was_hit():
	$Player.destroy()
	$RespawnTimer.start()

func _on_end_body_entered(body):
	if body == $Player:
		get_tree().change_scene_to_file(Globals.levels_list[choose_random_index(Globals.levels_list)])
