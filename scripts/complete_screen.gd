extends Control

@onready var connections = Connections.current_ordered_group

func _ready():
	var counter:int = 1
	for entry in $Margins/Holder/Entries.get_children():
		entry.get_node("VBoxContainer/GroupName").text = connections[int(counter * 4)][1]
		var entry_collection:String = ""
		for i in range(4):
			if i != 3:
				entry_collection += connections[int(counter*4 - i)][0] + ", "
			else:
				entry_collection += connections[int(counter*4 - i)][0]
		entry.get_node("VBoxContainer/Entries").text = entry_collection
		counter += 1

func _on_main_menu_btn_pressed():
	get_parent().get_parent()._change_scene(load("res://MainMenu.tscn"))
