extends Control

const MEMORY_TILE = preload("res://Scenes/memory_tile/memory_tile.tscn")
@onready var grid_container: GridContainer = $HB/MCLeft/GridContainer
@onready var scorer: Scorer = $Scorer
@onready var lb_moves_score: Label = $HB/MCRight/VB/HBMoves/LbMovesScore
@onready var lb_scores_pairs: Label = $HB/MCRight/VB/HMPairs/LbScoresPairs
@onready var sounds: AudioStreamPlayer = $Sounds

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.OnLevelSelected.connect(onLevelSelectedHandler)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	lb_moves_score.text = scorer.getMovesMadeStr()
	lb_scores_pairs.text = scorer.getPairsMadeStr()
	
func onLevelSelectedHandler(levelNumber: int) -> void:
	var levelData: SelectedLevelData = GameManager.getLevelSelection(levelNumber)
	var frame: Texture2D = ImageManager.getRandomFrameImage()
	
	grid_container.columns = levelData.getNumberOfColumns()
	
	for image in levelData.getLevelImages():
		addMemoryTile(image, frame)
		
	scorer.clearNewGame(levelData.getTargetPairs())

func addMemoryTile(image: ItemImage, frame: Texture2D) -> void:
	var newTile: MemoryTile = MEMORY_TILE.instantiate()
	grid_container.add_child(newTile)
	newTile.setup(image, frame)

func _on_exit_button_pressed() -> void:
	for child in grid_container.get_children():
		child.queue_free()
	SoundManager.play_button_click(sounds)
	SignalManager.OnGameExitPressed.emit()
