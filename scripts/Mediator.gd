extends Node

var current_scene

func _ready():
    OS.set_window_size(Vector2(512, 480))
    var screen_size = OS.get_screen_size(0)
    var window_size = OS.get_window_size()
    OS.set_window_position(screen_size*0.5 - window_size*0.5)
    var root = get_tree().get_root()
    current_scene = root.get_child(root.get_child_count() - 1)

# warning-ignore: unused_argument
func _process(delta):
    if Input.is_action_just_pressed("toggle_fullscreen"):
        OS.window_fullscreen = !OS.window_fullscreen

func new_game():
    PlayerData.reset_all()
    var scene = _load_scene_node("res://scenes/LevelBeginScreen.tscn")
    scene.level_index = PlayerData.current_level
    call_deferred("_deferred_goto_scene", scene)

func level_start():
    var scene = _load_scene_node("res://scenes/Level.tscn")
    scene.level_index = PlayerData.current_level
    PlayerData.respawn()
    call_deferred("_deferred_goto_scene", scene)

func level_finish():
    if PlayerData.is_last_level():
        # TODO: game completed
        PlayerData.reset_current_level()
        title_screen()
    else:
        PlayerData.next_level()
        var scene = _load_scene_node("res://scenes/LevelBeginScreen.tscn")
        scene.level_index = PlayerData.current_level
        call_deferred("_deferred_goto_scene", scene)

func title_screen():
    var scene = _load_scene_node("res://scenes/TitleScreen.tscn")
    call_deferred("_deferred_goto_scene", scene)

func _deferred_goto_scene(scene: Node):
    current_scene.free()

    current_scene = scene
    get_tree().get_root().add_child(current_scene)
    get_tree().set_current_scene(current_scene)

func _load_scene_node(path):
    var scene = ResourceLoader.load(path)
    return scene.instance()

# EOF