extends CharacterBody2D

# Target scale proportion
@export var target_scale_proportion = Vector2(4, 4)  # Example

signal was_hit(body)

func _ready():
	# Start the scaling animation
	animate_scaling(target_scale_proportion)

func animate_scaling(target_scale: Vector2):
	var initial_scale = scale  # Current scale
	var final_scale = target_scale 
	var tween = create_tween()

	
	var sprite_node = $Sprite2D
	var sprite_size = sprite_node.texture.get_size() * sprite_node.scale

	# Calculate the position adjustment
	var position_adjustment = Vector2(0, (final_scale.y - initial_scale.y) / 2.0 * sprite_size.y)
	var final_position = position - position_adjustment

	# Animate the scale
	tween.parallel().tween_property(
		self,  # The object being animated
		"scale",  # The property to animate
		final_scale,  # Final value
		0.5  # Duration of the animation in seconds
	)

	# Animate the position to compensate for symmetrical scaling
	tween.parallel().tween_property(
		self,  # The object being animated
		"position",  # The property to animate
		final_position,  # Final value
		0.5  # Duration of the animation in seconds
	)
	tween.play()


func _on_player_detector_body_entered(body):
	if "reverse_gravity" in body:
		body.reverse_gravity()
	
