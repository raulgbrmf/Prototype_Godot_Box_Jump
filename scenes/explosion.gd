extends GPUParticles2D


# Called when the node enters the scene tree for the first time.
func _ready():
	one_shot = true

func _on_timer_timeout():
	queue_free()
