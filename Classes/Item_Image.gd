class_name ItemImage

var _item_name: String
var _item_texture: Texture2D


func _init(itemName: String, itemTexture: Texture2D) -> void:
	_item_name = itemName
	_item_texture = itemTexture


func get_texture() -> Texture2D:
	return _item_texture
	
func get_item_name() -> String:
	return _item_name
