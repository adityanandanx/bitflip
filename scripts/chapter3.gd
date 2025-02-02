extends Node2D

func _ready() -> void:
	if not Global.player_stats: return
	Global.player_stats.add_part(0, false) # speed
	Global.player_stats.add_part(1, false) # jump
	Global.player.apply_abilities()
	Dialogic.start("Chapter3Init")
