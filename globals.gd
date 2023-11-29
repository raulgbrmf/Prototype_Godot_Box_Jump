extends Node

var tries = 0
var levels = 1

var Level1 = "res://scenes/levels/level_1.tscn"
var Level2 = "res://scenes/levels/level_2.tscn"
var Level3 = "res://scenes/levels/level_3.tscn"
var Level4 = "res://scenes/levels/level_4.tscn"
var Level5 = "res://scenes/levels/level_5.tscn"
var Level6 = "res://scenes/levels/level_6.tscn"
var Level7 = "res://scenes/levels/level_7.tscn"
var Level8 = "res://scenes/levels/level_8.tscn"
var Level9 = "res://scenes/levels/level_9.tscn"
var Level10 = "res://scenes/levels/level_10.tscn"
var Level11 = "res://scenes/levels/level_11.tscn"
var Level12 = "res://scenes/levels/level_12.tscn"
var Level13 = "res://scenes/levels/level_13.tscn"

var levels_list = [Level1, Level2, Level3, Level4, Level5, Level6, Level7, 
Level8, Level9, Level10, Level11, Level12, Level13]



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

func reset_levels():
	levels = 1
