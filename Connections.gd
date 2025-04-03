extends Node

var last_group

const debug_group:Dictionary = {
	1 : ["A", "group1"],
	2 : ["A", "group1"],
	3 : ["A", "group1"],
	4 : ["A", "group1"],
	5 : ["B", "group2"],
	6 : ["B", "group2"],
	7 : ["B", "group2"],
	8 : ["B", "group2"],
	9 : ["C", "group3"],
	10 : ["C", "group3"],
	11 : ["C", "group3"],
	12 : ["C", "group3"],
	13 : ["D", "group4"],
	14 : ["D", "group4"],
	15 : ["D", "group4"],
	16 : ["D", "group4"],
}

const group1:Dictionary = {
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
}

const ordered_group1:Dictionary = {
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
