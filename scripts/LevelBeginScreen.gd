extends Node

export var level_index: int = 0
const labels: Array = ['LEVEL 01', 'LEVEL 02']
onready var label_node = $CenterContainer/Label

func _ready():
    if level_index > 1:
        level_index = 0
    label_node.text = labels[level_index]

func _on_timeout():
    Mediator.level_start()

# EOF