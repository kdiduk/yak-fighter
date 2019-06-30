extends Area2D

export var velocity = Vector2()

func _process(delta):
    move_local_x(delta * velocity.x)
    move_local_y(delta * velocity.y)

func _on_screen_exited():
    queue_free()
