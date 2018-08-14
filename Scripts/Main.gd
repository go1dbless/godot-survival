extends Node2D

func _ready():
	if(GM.newGame):
		GM.generateWorld()
	else:
		GM.loadWorld()
