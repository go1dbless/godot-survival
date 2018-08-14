extends Node

const MAP_FILE_PATH = 'user://map.data'

var newGame = true
var maxTiles = 50
var maxRocks = 20

var rock = preload("res://Prefabs/rock.tscn")

var mapPoints = {
	tiles = [],
	rocks = []
}

var fs  = File.new()


func addTiles():
	for i in range( (maxTiles*2)*-1 , maxTiles * 2):
		for j in range( (maxTiles*2)*-1 , maxTiles * 2):
			$'../Main/TileMap'.set_cell(j,i,2)
	
	randomize()
	
	for i in range(maxTiles*-1,maxTiles):
		for j in range(maxTiles*-1, maxTiles):
			$'../Main/TileMap'.set_cell(j,i, rand_range(0,2))


func saveData():
	fs.open(MAP_FILE_PATH,File.WRITE)
	fs.store_string( to_json(mapPoints) )
	
	fs.close()
	
func loadWorld():
	fs.open(MAP_FILE_PATH, File.READ)
	var loadedMapData = parse_json(fs.get_as_text())
	fs.close()
	
	drawTiles(loadedMapData.tiles)
	drawRocks(loadedMapData.rocks)

	
func generateWorld():
	addTiles()
#	addRocks()
	
#	saveData()
	