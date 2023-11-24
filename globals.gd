extends Node

var tries = 0
var levels = 1

var Level1 = "res://scenes/levels/level_1.tscn"
var Level2 = "res://scenes/levels/level_2.tscn"

var levels_list = [Level1, Level2]

func increase_tries():
	tries += 1
	
func reset_tries():
	tries = 0

func get_tries():
	return tries

func increase_levels():
	levels += 1
	
func get_levels():
	return levels 
