extends Node

var _levels: Dictionary = {
	1: LevelData.new(1,2,2),
	2: LevelData.new(2,3,4),
	3: LevelData.new(3,4,5),
	4: LevelData.new(4,4,6),
	5: LevelData.new(5,6,6),
	6: LevelData.new(6,6,7)
}

func getLevel(level: int) -> LevelData:
	return _levels[level]


func getLevelCounts() -> int:
	return _levels.keys().size()
	
func getLevelSelection(levelNumber: int) -> SelectedLevelData:
	var levelData: LevelData = _levels[levelNumber]
	var selectedLevelImages: Array[ItemImage] = []
	
	ImageManager.shuffleImages()
	for i in range(levelData.getTargetPairs()):
		selectedLevelImages.append(ImageManager.getImage(i))
		selectedLevelImages.append(ImageManager.getImage(i))
	selectedLevelImages.shuffle()
	
	return SelectedLevelData.new(levelData.getTargetPairs(), levelData.getCols(), selectedLevelImages)
