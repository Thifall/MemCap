extends TextureButton

class_name MemoryTile

@onready var frame_image: TextureRect = $FrameImage
@onready var item_image: TextureRect = $ItemImage

var _itemName: String
var _canSelectMe: bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.onSelectionEnabled.connect(onSelectionEnabledHandler)
	SignalManager.onSelectionDisabled.connect(onSelectionDisabledHandler)
	
func reveal(r: bool) -> void:
	frame_image.visible = r
	item_image.visible = r
	
func setup(image: ItemImage, frame: Texture2D) -> void:
	frame_image.texture = frame
	item_image.texture = image.get_texture()
	_itemName = image.get_item_name() 

func _on_pressed() -> void:
	if _canSelectMe and !(frame_image.visible):
		SignalManager.onTileSelected.emit(self)
		
func onSelectionEnabledHandler() -> void:
	_canSelectMe = true

func onSelectionDisabledHandler() -> void:
	_canSelectMe = false

func getItemName() -> String:
	return _itemName

func matchesOtherTile(other: MemoryTile) -> bool:
	return other != self and other.getItemName() == _itemName
	
func killOnSuccess() -> void:
	z_index = 1
	#scale = Vector2.ZERO
	var tween: Tween = get_tree().create_tween()
	tween.set_parallel(true)
	tween.tween_property(self, "disabled", true, 0)
	tween.tween_property(self, "rotation_degrees", 360, 0.5)
	tween.tween_property(self, "scale", Vector2(1.5,1.5), 0.5)
	tween.set_parallel(false)
	tween.tween_interval(0.6)
	tween.tween_property(self, "scale", Vector2.ZERO, 0)	
