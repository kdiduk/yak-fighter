extends Node2D

export var level_index: int = 0
export var scroll_speed: int = 40
onready var sprite = $Background/ParallaxLayer/Sprite
const level_files: Array = ['yf_level_001.png', 'yf_level_002.png']
onready var screen_size: Vector2 = get_viewport_rect().size
var is_running: bool = true

func _ready():
    if level_index > level_files.size():
        level_index = 0
    var level_texture = load('res://assets/levels/' + level_files[level_index])
    sprite.set_texture(level_texture)
    sprite.offset.y = -sprite.get_rect().size.y + screen_size.y

func _process(delta):
    if is_running:
        sprite.move_local_y(delta * scroll_speed)
        if sprite.position.y >= sprite.get_rect().size.y - screen_size.y:
            level_finished()

func level_finished():
    is_running = false
    Mediator.level_finish()

# EOF