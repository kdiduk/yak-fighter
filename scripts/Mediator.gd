extends Node

var current_scene
var current_level: int = 0

func _ready():
    var root = get_tree().get_root()
    current_scene = root.get_child(root.get_child_count() - 1)

# warning-ignore: unused_argument
func _process(delta):
    if Input.is_action_just_pressed("toggle_fullscreen"):
        OS.window_fullscreen = !OS.window_fullscreen

func new_game():
    current_level = 0
    var scene = _load_scene_node("res://scenes/LevelBeginScreen.tscn")
    scene.level_index = current_level
    call_deferred("_deferred_goto_scene", scene)

func level_start():
    var scene = _load_scene_node("res://scenes/Level.tscn")
    scene.level_index = current_level
    call_deferred("_deferred_goto_scene", scene)

func level_finish():
    current_level += 1
    if current_level > 1:
        current_level = 0
        title_screen()
    else:
        var scene = _load_scene_node("res://scenes/LevelBeginScreen.tscn")
        scene.level_index = current_level
        call_deferred("_deferred_goto_scene", scene)

func title_screen():
    call_deferred("_deferred_goto_scene",
        _load_scene_node("res://scenes/TitleScreen.tscn"))

func _deferred_goto_scene(scene):
    current_scene.free()

    current_scene = scene
    get_tree().get_root().add_child(current_scene)
    get_tree().set_current_scene(current_scene)

func _load_scene_node(path):
    var scene = ResourceLoader.load(path)
    return scene.instance()

# EOF