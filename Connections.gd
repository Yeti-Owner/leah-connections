extends Node

var last_group
var current_game_group: Dictionary
var current_ordered_group: Dictionary
var played_levels := {}

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
	},
	"level2": {
		"game_group": {
			1 : ["Run a bookstore","Your 4 Big Dreams"],
			2 : ["Tesla's","Things You Hate"],
			3 : ["Howl's Moving Castle","Top 4 movies"],
			4 : ["Sleeping til 12","Your Perfect Day"],
			5 : ["Own bees","Your 4 Big Dreams"],
			6 : ["Slow Drivers","Things You Hate"],
			7 : ["Labyrinth","Top 4 movies"],
			8 : ["Reading to Me","Your Perfect Day"],
			9 : ["Get a cheese wheel","Your 4 Big Dreams"],
			10 : ["Late Customers","Things You Hate"],
			11 : ["About Time","Top 4 movies"],
			12 : ["Callum-Time","Your Perfect Day"],
			13 : ["Move to Vermont","Your 4 Big Dreams"],
			14 : ["Pick-Me's","Things You Hate"],
			15 : ["The Cat Returns","Top 4 movies"],
			16 : ["Sweet Treats","Your Perfect Day"]
		},
		"ordered_group": {
			1 : ["Run a bookstore","Your 4 Big Dreams"],
			2 : ["Own bees","Your 4 Big Dreams"],
			3 : ["Get a cheese wheel","Your 4 Big Dreams"],
			4 : ["Move to Vermont","Your 4 Big Dreams"],
			5 : ["Howl's Moving Castle","Top 4 movies"],
			6 : ["Labyrinth","Top 4 movies"],
			7 : ["About Time","Top 4 movies"],
			8 : ["The Cat Returns","Top 4 movies"],
			9 : ["Tesla's","Things You Hate"],
			10 : ["Slow Drivers","Things You Hate"],
			11 : ["Late Customers","Things You Hate"],
			12 : ["Pick-Me's","Things You Hate"],
			13 : ["Sleeping til 12","Your Perfect Day"],
			14 : ["Reading to Me","Your Perfect Day"],
			15 : ["Callum-Time","Your Perfect Day"],
			16 : ["Sweet Treats","Your Perfect Day"]
		}
	}
}

func select_random_level() -> void:
	var level_keys: Array = levels.keys()
	if level_keys.size() == 0:
		push_error("No levels defined in Connections.gd")
		return
	
	# Get only unplayed levels
	var unplayed = level_keys.filter(func(key): return not played_levels.has(key))
	
	# If all levels played, reset and allow repeats
	if unplayed.is_empty():
		played_levels.clear()
		unplayed = level_keys.duplicate()
	
	# Select random level from unplayed
	var selected_level: String = unplayed[randi() % unplayed.size()]
	
	# Mark as played
	played_levels[selected_level] = true
	
	# Set current groups
	current_game_group = levels[selected_level]["game_group"]
	current_ordered_group = levels[selected_level]["ordered_group"]
	last_group = current_game_group
