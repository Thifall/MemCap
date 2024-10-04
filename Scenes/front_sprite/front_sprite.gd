extends TextureRect

const SCALE_SMALL: Vector2 = Vector2(0.1, 0.1)
const SCALE_NORMAL: Vector2 = Vector2(1.0, 1.0)
const SPIN_TIME_RANGE: Vector2 = Vector2(1.0, 2.0)
const SCALE_TIME: float = 1

func _ready() -> void:
	setRandomImage()
	runMe()

func setRandomImage() -> void:
	texture = ImageManager.getRandomItemImage().get_texture()
	
func getRandomSpinTime() -> float:
	return randf_range(SPIN_TIME_RANGE.x, SPIN_TIME_RANGE.y)
	
func getRandomRotation() -> float:
	return deg_to_rad(randf_range(-360, 360))
	
func runMe() -> void:
	#make tween
	var tween = get_tree().create_tween()
	#scale down
	tween.tween_property(self, "scale", SCALE_SMALL, SCALE_TIME)
	#set random image
	tween.tween_callback(setRandomImage)
	#scale to normal
	tween.tween_property(self, "scale", SCALE_NORMAL, SCALE_TIME)
	#rotate
	tween.tween_property(self, "rotation", getRandomRotation(), getRandomSpinTime())
	#rerun
	tween.tween_callback(runMe)
