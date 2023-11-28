extends CanvasLayer

func _ready():
	$LevelCount.text =  str(Globals.get_levels()) + "/20"
	$Tries.text = str(Globals.get_tries())

func update():
	$LevelCount.text =  str(Globals.get_levels()) + "/20"
	$Tries.text = str(Globals.get_tries())
	$StartMessage.visible = false

func start_message_off():
	pass
