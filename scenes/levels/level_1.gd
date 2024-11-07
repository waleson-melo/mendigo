extends Node2D

const _DIALOG_SCREEN: PackedScene = preload('res://scenes/dialog_screen.tscn')
@export_category("Objects")
@export var _hud: CanvasLayer = null

var _dialog_data: Dictionary = {
	0: {
		"Title": "Mendigo",
		"Dialog": "Tem um pão aí?",
		"Faceset": "res://assets/textures/facesets/15.png"
	},
	1: {
		"Title": "Burgues Safado",
		"Dialog": "Tenho não seu POHA! Sai daqui!",
		"Faceset": "res://assets/textures/facesets/24.png"
	},
	2: {
		"Title": "Mendigo",
		"Dialog": "Uénn",
		"Faceset": "res://assets/textures/facesets/15.png"
	}
}


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		var _new_dialog: DialogScreen = _DIALOG_SCREEN.instantiate()
		_new_dialog._data = _dialog_data
		_hud.add_child(_new_dialog)
