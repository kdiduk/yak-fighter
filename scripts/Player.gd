extends Area2D

export var speed = 40
onready var screen_size = get_viewport_rect().size
onready var sprite_size = $Sprite.get_rect().size
onready var bullet_scene = preload("res://scenes/Bullet.tscn")
onready var reload_timeout = 0.0
onready var bullet_pos = sprite_size.x / 8

func _process(delta):
    var velocity = Vector2(0, 0)

    if Input.is_action_pressed("move_left"):
        velocity.x -= 1
    elif Input.is_action_pressed("move_right"):
        velocity.x += 1

    if Input.is_action_pressed("move_down"):
        velocity.y += 0.5
    elif Input.is_action_pressed("move_up"):
        velocity.y -= 0.75

    if velocity.length() > 1:
        velocity = velocity.normalized()
    velocity *= speed
    position += velocity * delta

    position.x = clamp(position.x,
                       sprite_size.x/2,
                       screen_size.x - sprite_size.x/2)
    position.y = clamp(position.y,
                       sprite_size.y/2,
                       screen_size.y - sprite_size.y/2)

    if reload_timeout > 0:
        reload_timeout = max(0, reload_timeout-delta)
    elif Input.is_action_pressed("fire"):
        var bullet = bullet_scene.instance()
        $BulletContainer.add_child(bullet)
        bullet.position = position
        bullet.position.y -= sprite_size.y/2
        bullet.position.x -= sprite_size.x/2
        bullet.position.x += bullet_pos
        bullet_pos = sprite_size.x - bullet_pos
        reload_timeout = 1.0

# EOF
