class_name LevelData

var _levelNumber: int
var _rows: int
var _cols: int

func _init(levelNumber: int, rows: int, cols: int) -> void:
	_levelNumber = levelNumber
	_rows = rows
	_cols = cols

func getRows() -> int:
	return _rows	

func getCols() -> int:
	return _cols
	
func getLevelNumber() -> int:
	return _levelNumber
	
func getTargetPairs() -> int:
	return int((_rows * _cols) / 2)
	
func getTilesQuantity() -> int:
	return _rows * _cols
	
