extends Area2D

export var speed = 50
var screen_size
var sprite_size

func _ready():
    screen_size = get_viewport_rect().size
    sprite_size = $Sprite.get_rect().size

func _process(delta):
    move_local_y(-delta * speed)
    if get_global_transform_with_canvas().origin.y < -sprite_size.y:
        queue_free()

# EOF
