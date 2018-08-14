extends Node2D

func _ready():
	$GUI/close.rect_position.x  = 30
	$GUI/load.rect_position.x  = 30
	$GUI/new.rect_position.x  = 30
	
	$GUI/close.rect_position.y  = get_viewport().size.y - 50
	
	$GUI/load.rect_position.y = $GUI/close.rect_position.y - 70
	$GUI/new.rect_position.y = $GUI/load.rect_position.y - 40
	
	$back.position = get_viewport().size/2


func _on_close_pressed():
	get_tree().quit()


func _on_new_pressed():
	G.playerParams.hp = 100
	G.playerParams.speed = 500
	get_tree().change_scene("res://Scenes/Main.tscn")


func _on_load_pressed():
	GM.newGame = false
	G.playerParams.speed = 500
	get_tree().change_scene("res://Scenes/Main.tscn")
