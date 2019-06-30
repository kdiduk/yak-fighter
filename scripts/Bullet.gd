extends Area2D

export var speed: int = 50

func _process(delta):
    move_local_y(-delta * speed)

func _on_screen_exited():
    queue_free()

# EOF
