class_name SelectedLevelData

var _selectedLevelImages: Array[ItemImage]
var _targetPairs: int
var _numberOfColumns: int

func _init(targetPairs: int, numberOfColumns: int, selectedLevelImages: Array[ItemImage]) -> void:
	_targetPairs = targetPairs
	_numberOfColumns = numberOfColumns
	_selectedLevelImages = selectedLevelImages
	
func getLevelImages() -> Array[ItemImage]:
	return _selectedLevelImages
	
func getTargetPairs() -> int:
	return _targetPairs
		
func getNumberOfColumns() -> int:
	return _numberOfColumns
