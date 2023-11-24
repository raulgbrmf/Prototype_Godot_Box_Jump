extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Player.create($SpawnPoint.position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	restart_level()


func _on_end_body_entered(body):
	if body == $Player:
		body.destroy()
		$RespawnTimer.start()
		

func restart_level():
	if Input.is_action_pressed("enter"):
		print("entered")
		$Player.destroy()
		$RespawnTimer.start()


func _on_respawn_timer_timeout():
	$Player.create($SpawnPoint.position)
	$RespawnTimer.stop()
