extends CanvasLayer

@onready var main: Control = $Main
@onready var game_scene: Control = $GameScene
@onready var sounds: AudioStreamPlayer = $Sounds


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	onGameExitPressedHandler()
	SignalManager.OnGameExitPressed.connect(onGameExitPressedHandler)
	SignalManager.OnLevelSelected.connect(onLevelSelectedHandler)

func showGame(show: bool) -> void:
	game_scene.visible = show
	main.visible = !show

func onGameExitPressedHandler() -> void:
	showGame(false)
	SoundManager.play_sound(sounds, SoundManager.SOUND_MAIN_MENU)
	
func onLevelSelectedHandler(levelNumber: int) -> void:
	showGame(true)
	SoundManager.play_sound(sounds, SoundManager.SOUND_IN_GAME)
