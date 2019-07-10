extends Node

export var level_index: int = 1
onready var label_node = $CenterContainer/Label

func _ready():
    label_node.text = "LEVEL %02d" % level_index

func _on_timeout():
    Mediator.level_start()

# EOF