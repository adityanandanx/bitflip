class_name PlayerStats
extends Resource

signal damaged(amt: float)
signal healed(amt: float)
signal dead

@export var health : float = 100:
	set(new):
		if new > health:
			healed.emit(new - health)
		elif new < health:
			damaged.emit(health - new)
		health = clamp(new, 0, 100)
		if health == 0:
			dead.emit()
			Global.game_controller.change_gui_scene("res://gui/game_over.tscn")

@export var parts_obtained: Array[Global.BrokenParts] = []

@export var abilities: Abilities = preload("res://resources/default_player_abilities.tres")

func add_part(part: Global.BrokenParts, run_timeline: bool = true):
	if part in parts_obtained:
		return 
	else:
		parts_obtained.push_back(part)
		match part:
			Global.BrokenParts.WHEEL:
				if run_timeline: Dialogic.start("SpeedFound")
				abilities.speed = true
			Global.BrokenParts.SPRING:
				if run_timeline: Dialogic.start("JumpFound")
				abilities.jump = true
			Global.BrokenParts.GUN:
				abilities.gun = true
