extends Node

const  FRAME_IMAGES: Array[Texture2D] = [
	preload("res://assets/frames/blue_frame.png"),
	preload("res://assets/frames/green_frame.png"),
	preload("res://assets/frames/hidden_frame_blank.png"),
	preload("res://assets/frames/red_frame.png"),
	preload("res://assets/frames/yellow_frame.png"),
]

var _item_images: Array[ItemImage] = []

func _ready() -> void:
	var imageRes: ImageFilesList = load("res://Resources/ImageFilesList.tres")
	for filePath in imageRes.get_file_names():
		add_file_to_list(filePath)

func add_file_to_list(filePath: String) -> void:
	var newItemImage: ItemImage = ItemImage.new(
		filePath.get_file(), 
		load(filePath)
	)
	_item_images.append(newItemImage)

func getRandomItemImage() -> ItemImage:
	return _item_images.pick_random()
	
func getRandomFrameImage() -> Texture2D:
	return FRAME_IMAGES.pick_random()
	
func getImage(index: int) -> ItemImage:
	return _item_images[index]
	
func shuffleImages() -> void:
	_item_images.shuffle()
