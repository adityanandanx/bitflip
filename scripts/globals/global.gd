extends Node

var game_controller: GameController
var player_stats: PlayerStats
var player: Player
var cat: Cat
var last_checkpoint: Vector2

enum BrokenParts {
	WHEEL,
	SPRING,
	GUN
}

var no_visit_timelines: Dictionary = {}

func kill_cat():
	player.player_gun.shoot()
	cat.is_fleeing = true
	cat.is_at_last = false
	
func game_end():
	game_controller.change_gui_scene("res://gui/splash_screen_manager.tscn")

func set_last_checkpoint():
	last_checkpoint = player.global_position
	last_checkpoint.y -= 64
