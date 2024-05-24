extends Node


var newPositions: Array = []
var oldPositions: Array = []
var currentIndex: int = 0


func clear_positions():
	oldPositions = newPositions.duplicate()
	print(oldPositions)
	newPositions.clear()
	currentIndex = 0;
	

func add_new_point(pos: Vector2):
	newPositions.append(pos)


func fetch_new_point():
	if oldPositions.size() == 0:
		return Vector2(-1000,-1000) # HACK
	if currentIndex < oldPositions.size()-2:
		currentIndex+=1
	var cp = oldPositions[currentIndex]
	return cp


