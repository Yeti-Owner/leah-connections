extends Control

@export var test:String = ""

@onready var word_bank = Connections.current_game_group

const SELECT_HOVER = preload("res://word_buttons/select_hover.png")
const SELECT_NORMAL = preload("res://word_buttons/select_normal.png")
const SELECT_PRESSED = preload("res://word_buttons/select_pressed.png")
const WORD_HOVER = preload("res://word_buttons/word_hover.png")
const WORD_NORMAL = preload("res://word_buttons/word_normal.png")
const WORD_PRESSED = preload("res://word_buttons/word_pressed.png")

var correct_groups:int = 0
var selected_word:int:set = _update_select
var selection:Array = []
var key_to_button: Dictionary = {}

func _ready():
	Connections.last_group = word_bank
	
	# Convert dictionary to array and shuffle
	var entries = []
	for key in word_bank:
		entries.append({"key": key, "value": word_bank[key]})
	entries.shuffle()
	
	var buttons = $Holder/Words.get_children()
	
	# Set up word texts and button mapping
	for i in range(buttons.size()):
		var button = buttons[i]
		var entry = entries[i]
		# Store mapping between original key and button
		key_to_button[entry.key] = button
		
		button.get_child(0).text = entry.value[0]
		
		button.pressed.connect(_select_word.bind(entry.key))

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
		if correct == false:
			_flash_red()
		else:
			_correct_group()

func _color_word(word_key:int, selected:bool):
	var button = key_to_button.get(word_key)
	if !button:
		return
	
	if selected:
		button.texture_normal = SELECT_NORMAL
		button.texture_pressed = SELECT_PRESSED
		button.texture_hover = SELECT_HOVER
	else:
		button.texture_normal = WORD_NORMAL
		button.texture_pressed = WORD_PRESSED
		button.texture_hover = WORD_HOVER

func _flash_red():
	var tween := get_tree().create_tween()
	tween.tween_property($Red, "self_modulate", Color(1, 1, 1, 1), 0.2)
	tween.tween_property($Red, "self_modulate", Color(1, 1, 1, 0), 0.2)

func _correct_group():
	correct_groups += 1
	for entry in selection:
		key_to_button[entry].disabled = true
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
