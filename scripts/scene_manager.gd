extends Node

@onready var anims = $AnimationPlayer
@onready var fader = $Fader
@onready var holder = $Holder

func _ready():
	anims.play("intro")

func _change_scene(scene):
	var tween := get_tree().create_tween()
	tween.tween_property(fader, "self_modulate", Color(1, 1, 1, 1), 1)
	await tween.finished
	await get_tree().create_timer(0.1).timeout
	holder.get_child(0).queue_free()
	await get_tree().create_timer(0.1).timeout
	var s = scene.instantiate()
	holder.add_child(s)
	await get_tree().create_timer(0.1).timeout
	tween = get_tree().create_tween()
	tween.tween_property(fader, "self_modulate", Color(1, 1, 1, 0), 1)
