extends Node

class_name Scorer

@onready var reveal_timer: Timer = $RevealTimer
@onready var sound: AudioStreamPlayer = $Sound

var _selectedTiles: Array[MemoryTile] = []
var _targetPairs: int = 0
var _movesMade: int = 0
var _pairsMade: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.onTileSelected.connect(onTileSelectedHandler)
	SignalManager.OnGameExitPressed.connect(onGameExitPressedHandler)

func getMovesMadeStr() -> String:
	return str(_movesMade)

func getPairsMadeStr() -> String:
	return "%d/%d" % [_pairsMade, _targetPairs]

func clearNewGame(targetPairs: int) -> void:
	_selectedTiles.clear()
	_targetPairs = targetPairs
	_movesMade = 0
	_pairsMade = 0

func _on_reveal_timer_timeout() -> void:
	if !selectionsArePair():
		for s in _selectedTiles:
			s.reveal(false)
	_selectedTiles.clear()
	checkGameOver()
	SignalManager.onSelectionEnabled.emit()
			

func checkGameOver() -> void:
	if _targetPairs == _pairsMade:
		SignalManager.onGameOver.emit(_movesMade)

func onTileSelectedHandler(tile: MemoryTile) -> void:
	tile.reveal(true)
	SoundManager.play_button_click(sound)
	_selectedTiles.append(tile)
	checkPairMade()
	
func killTiles() -> void:
	for tile in _selectedTiles:
		tile.killOnSuccess()
	
	_pairsMade += 1
	SoundManager.play_sound(sound, SoundManager.SOUND_SUCCESS)

func selectionsArePair() -> bool:
	return _selectedTiles[0].matchesOtherTile(_selectedTiles[1])
	
func checkPairMade() -> void:
	if _selectedTiles.size() != 2:
		return
	
	reveal_timer.start()
	SignalManager.onSelectionDisabled.emit()
	_movesMade += 1
	
	if selectionsArePair():
		killTiles()

func onGameExitPressedHandler() -> void:
	reveal_timer.stop()
