extends Node

export var current_level: int = 1
export var score: int = 0
export var hitpoints: int = 100
export var lives: int = 3

func _ready():
    _restore_hp()

func _restore_hp() -> void:
    hitpoints = 100

func is_alive() -> bool:
    return hitpoints > 0

func respawn() -> void:
    _restore_hp()

func cause_damage(points: int) -> void:
    hitpoints -= points
    if hitpoints <= 0 and lives > 0:
        lives -= 1
