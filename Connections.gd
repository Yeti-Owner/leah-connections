extends Node

var last_group
var current_game_group: Dictionary
var current_ordered_group: Dictionary

const levels: Dictionary = {
	"level1": {
		"game_group": {
			1 : ["Eating","I Annoy You About:"],
			2 : ["Cats :)","Your Favorites?"],
			3 : ["Gertrude Hawk Chocolate","I Recently Learned You Like"],
			4 : ["Doomscrolling","I Annoy You About:"],
			5 : ["Letterboxd","I Annoy You About:"],
			6 : ["Howls Moving Castle","Your Favorite Media"],
			7 : ["Telephone - Waterparks","Your Favorite Media"],
			8 : ["Supernatural","Your Favorite Media"],
			9 : ["Private Proposals","I Recently Learned You Like"],
			10 : ["Pink","Your Favorites?"],
			11 : ["Deadly Education","Your Favorite Media"],
			12 : ["Me (Callum)","Your Favorites?"],
			13 : ["Flower Knows Makeup","I Recently Learned You Like"],
			14 : ["Sushi","Your Favorites?"],
			15 : ["Bathbombs","I Recently Learned You Like"],
			16 : ["Sleeping","I Annoy You About:"]
		},
		"ordered_group": {
			1 : ["Flower Knows Makeup","I Recently Learned You Like"],
			2 : ["Gertrude Hawk Chocolate","I Recently Learned You Like"],
			3 : ["Bathbombs","I Recently Learned You Like"],
			4 : ["Private Proposals","I Recently Learned You Like"],
			5 : ["Supernatural","Your Favorite Media"],
			6 : ["Howls Moving Castle","Your Favorite Media"],
			7 : ["Deadly Education","Your Favorite Media"],
			8 : ["Telephone - Waterparks","Your Favorite Media"],
			9 : ["Eating","I Annoy You About:"],
			10 : ["Sleeping","I Annoy You About:"],
			11 : ["Letterboxd","I Annoy You About:"],
			12 : ["Doomscrolling","I Annoy You About:"],
			13 : ["Me (Callum)","Your Favorites?"],
			14 : ["Pink","Your Favorites?"],
			15 : ["Sushi","Your Favorites?"],
			16 : ["Cats :)","Your Favorites?"]
		}
	}
	# Add more levels here using the same structure:
	# "level2": { "game_group": {}, "ordered_group": {} }
}

func select_random_level() -> void:
	var level_keys: Array = levels.keys()
	if level_keys.size() == 0:
		push_error("No levels defined in Connections.gd")
		return
	var selected_level: String = level_keys[randi() % level_keys.size()]
	current_game_group = levels[selected_level]["game_group"]
	current_ordered_group = levels[selected_level]["ordered_group"]
	last_group = current_game_group
