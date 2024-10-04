extends Control

@onready var lb_moves: Label = $NinePatchRect/MC/VB/LbMoves

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.onGameOver.connect(onGameOverHandler)
	SignalManager.OnGameExitPressed.connect(onGameExitPressedHandler)
	
func onGameOverHandler(moves: int) -> void:
	lb_moves.text = "You made %d moves" % moves
	show()

func onGameExitPressedHandler() -> void:
	hide()
