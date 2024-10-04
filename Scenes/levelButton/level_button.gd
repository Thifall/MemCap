extends TextureButton

@export var _levelNumber: int = 1

@onready var label: Label = $Label
@onready var sounds: AudioStreamPlayer = $Sounds


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var levelData: LevelData = GameManager.getLevel(_levelNumber)
	label.text = "%dx%d" % [levelData.getCols(), levelData.getRows()]



func _on_pressed() -> void:
	SoundManager.play_button_click(sounds)
	SignalManager.OnLevelSelected.emit(_levelNumber)
