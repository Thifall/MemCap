extends Node2D

const PATH: String = "res://assets/glitch/"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var dir: DirAccess = DirAccess.open(PATH)
	
	var ifl: ImageFilesList = ImageFilesList.new()	
	
	if dir:
		var files: PackedStringArray = dir.get_files()
		
		for fn in files:
			ifl.add_file_name(PATH + fn)
		
	ResourceSaver.save(ifl, "res://Resources/ImageFilesList.tres")
