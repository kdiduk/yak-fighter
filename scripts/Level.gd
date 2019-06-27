extends Node2D

export var level_index = 0
export var scroll_speed = 40
onready var sprite = $Background/ParallaxLayer/Sprite
const level_files = ["yf_level_001.png", "yf_level_002.png"]
var screen_size
var is_running = true

func _ready():
    if level_index > level_files.size():
        level_index = 0
    screen_size = get_viewport_rect().size
    var level_texture = load("res://assets/levels/" + level_files[level_index])
    sprite.set_texture(level_texture)
    sprite.offset.y = -sprite.get_rect().size.y + screen_size.y

func _process(delta):
    if is_running:
        sprite.move_local_y(delta * scroll_speed)
        if sprite.position.y >= sprite.get_rect().size.y - screen_size.y:
            is_running = false
            Mediator.title_screen()


# EOF