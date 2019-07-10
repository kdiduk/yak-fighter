extends Node

export var current_level: int = 1
export var score: int = 0
export var hitpoints: int = 100
export var lives: int = 3

func _ready():
    _restore_hp()

func _restore_hp() -> void:
    hitpoints = 100

func reset_all():
    reset_current_level()
    score = 0
    hitpoints = 100
    lives = 3

func reset_current_level() -> void:
    current_level = 1

func next_level() -> void:
    _restore_hp()
    if is_last_level():
        return
    current_level += 1

func is_last_level() -> bool:
    return (current_level == 2)

func is_alive() -> bool:
    return hitpoints > 0

func respawn() -> void:
    _restore_hp()

func cause_damage(points: int) -> void:
    hitpoints -= points
    if hitpoints > 0:
        return
    if lives > 0:
        # TODO: restart level
        lives -= 1
        Mediator.level_restart()
    else:
        # TODO: game over
        Mediator.title_screen()
