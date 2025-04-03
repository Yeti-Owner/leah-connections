extends Control

func _on_play_btn_pressed():
	get_parent().get_parent()._change_scene(load("res://Level.tscn"))
