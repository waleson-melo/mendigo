extends Area2D

@export var _sprite: Sprite2D = null
@export var _animation: AnimationPlayer = null

func _on_body_entered(_body: CharacterBody2D) -> void:
	_sprite.visible = false
	_animation.play("coleted")


func _on_animation_finished(anim_name: StringName) -> void:
	if anim_name == "coleted":
		queue_free()
