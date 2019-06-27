extends Node

var current_scene

func _ready():
    var root = get_tree().get_root()
    current_scene = root.get_child(root.get_child_count() - 1)

func new_game():
    call_deferred("_deferred_goto_scene", "res://scenes/LevelBeginScreen.tscn")

func level_start():
    call_deferred("_deferred_goto_scene", "res://scenes/Level.tscn")

func title_screen():
    call_deferred("_deferred_goto_scene", "res://scenes/TitleScreen.tscn")

func _deferred_goto_scene(path):
    current_scene.free()

    var s = ResourceLoader.load(path)
    current_scene = s.instance()
    get_tree().get_root().add_child(current_scene)
    get_tree().set_current_scene(current_scene)

# EOF