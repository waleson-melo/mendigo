extends Control
class_name DialogScreen

@export_category("Objects")
@export var _title: Label = null
@export var _dialog: RichTextLabel = null
@export var _faceset: TextureRect = null
var _step: float = 0.05
var _id: int = 0
var _data: Dictionary = {}


func _ready() -> void:
	_initialize_dialog()


func _process(_delta: float) -> void:
	if Input.is_action_pressed('ui_select') and _dialog.visible_ratio < 1:
		_step = 0.01
		return
	
	_step = 0.05
	
	if Input.is_action_just_pressed("ui_select"):
		_id += 1
		if _id == _data.size():
			queue_free()
			return
		
		_initialize_dialog()


func _initialize_dialog() -> void:
	_title.text = _data[_id]["Title"]
	_dialog.text = _data[_id]["Dialog"]
	_faceset.texture = load(_data[_id]["Faceset"])
	
	_dialog.visible_characters = 0
	while _dialog.visible_ratio < 1:
		await get_tree().create_timer(_step).timeout
		_dialog.visible_characters += 1
