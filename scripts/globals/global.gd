extends Node

var game_controller: GameController
var player_stats: PlayerStats
var player: Player

enum BrokenParts {
	WHEEL,
	SPRING,
	GUN
}

var no_visit_timelines: Dictionary = {}

func kill_cat():
	player.player_gun.shoot()
	
func game_end():
	game_controller.change_gui_scene("res://gui/splash_screen_manager.tscn")
