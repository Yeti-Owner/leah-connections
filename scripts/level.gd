extends Control

@export var test:String = ""

@onready var word_bank = Connections.group1

const SELECT_HOVER = preload("res://word_buttons/select_hover.png")
const SELECT_NORMAL = preload("res://word_buttons/select_normal.png")
const SELECT_PRESSED = preload("res://word_buttons/select_pressed.png")
const WORD_HOVER = preload("res://word_buttons/word_hover.png")
const WORD_NORMAL = preload("res://word_buttons/word_normal.png")
const WORD_PRESSED = preload("res://word_buttons/word_pressed.png")

var correct_groups:int = 0
var selected_word:int:set = _update_select
var selection:Array = []

var word_path:String = "Holder/Words/Word"

func _ready():
	Connections.last_group = word_bank
	
	# Set up word texts
	for entry in word_bank:
		var word:String = word_path + str(entry)
		var display:String = word_bank[int(entry)][0]
		get_node(word).get_child(0).text = display
	
	# Set up button signals
	for child in $Holder/Words.get_child_count():
		get_node(word_path + str(child + 1)).pressed.connect(_select_word.bind(int(child + 1)))

func _select_word(word:int):
	selected_word = word

func _update_select(new_select):
	if (selection.has(new_select)) or (new_select == selected_word):
		selection.erase(new_select)
		_color_word(new_select, false)
	elif (selection.size() == 4):
		return
	else:
		selection.append(new_select)
		_color_word(new_select, true)
	
	# Check if all in same group
	if (selection.size() == 4):
		var group:String = word_bank[selection[0]][1]
		var correct:bool = true
		for entry in selection:
			if group != word_bank[entry][1]:
				correct = false
		if correct == false: # If not all 4 in same group flash red on screen
			_flash_red()
		else: # If in same group disable buttons and remove selected
			_correct_group()

func _color_word(word:int, selected:bool):
	var edit_word := get_node(word_path + str(word))
	if selected == true:
		edit_word.texture_normal = SELECT_NORMAL
		edit_word.texture_pressed = SELECT_PRESSED
		edit_word.texture_hover = SELECT_HOVER
	else:
		edit_word.texture_normal = WORD_NORMAL
		edit_word.texture_pressed = WORD_PRESSED
		edit_word.texture_hover = WORD_HOVER

func _flash_red():
	var tween := get_tree().create_tween()
	tween.tween_property($Red, "self_modulate", Color(1, 1, 1, 1), 0.2)
	tween.tween_property($Red, "self_modulate", Color(1, 1, 1, 0), 0.2)

func _correct_group():
	correct_groups += 1
	for entry in selection:
		get_node(word_path + str(entry)).disabled = true
		selection = []
	
	if correct_groups == 4:
		_on_surrender_btn_pressed()

func _on_deselect_btn_pressed():
	while selection.size() != 0:
		for entry in selection:
			_color_word(entry, false)
			selection.erase(entry)

func _on_surrender_btn_pressed():
	get_parent().get_parent()._change_scene(load("res://complete.tscn"))
