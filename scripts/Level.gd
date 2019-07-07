extends Node2D

export (PackedScene) var EnemyScene
export var level_index: int = 0
export var scroll_speed: int = 40
onready var sprite = $Background/ParallaxLayer/Sprite
const level_files: Array = ['yf_level_001.png', 'yf_level_002.png']
onready var screen_size: Vector2 = get_viewport_rect().size
var is_running: bool = true

func _ready():
    randomize()
    if level_index > level_files.size():
        level_index = 0
    var level_texture = load('res://assets/levels/' + level_files[level_index])
    sprite.set_texture(level_texture)
    sprite.offset.y = -sprite.get_rect().size.y + screen_size.y
    _restart_enemy_timer(rand_range(4.0, 5.0))

func _process(delta):
    if is_running:
        sprite.move_local_y(delta * scroll_speed)
        if sprite.position.y >= sprite.get_rect().size.y - screen_size.y:
            level_finished()

func level_finished():
    is_running = false
    Mediator.level_finish()

func _on_EnemySpawnTimer_timeout():
    $EnemyPath/EnemySpawnLocation.set_offset(rand_range(0, 240))
    var enemy = EnemyScene.instance()
    add_child(enemy)
    enemy.position = $EnemyPath/EnemySpawnLocation.position
    enemy.velocity = Vector2(0, 50)
    var status = $Player.connect("bullet_hit", enemy, "_on_bullet_hit")
    if status != OK:
        print("Failed to connect player's `bullet_hit` to enemy's `_on_bullet_hit`")
    status = $Player.connect("player_hit", enemy, "_on_player_hit")
    if status != OK:
        print("Failed to connect player's `player_hit` to enemy's `_on_player_hit`")
    _restart_enemy_timer(rand_range(3, 8))

func _restart_enemy_timer(timeout: float):
    $EnemyTimer.wait_time = timeout
    $EnemyTimer.start()

# EOF
