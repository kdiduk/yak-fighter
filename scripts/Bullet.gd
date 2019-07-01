extends Area2D

export var speed: int = 50
signal hit

func _process(delta):
    move_local_y(-delta * speed)

func _on_screen_exited():
    queue_free()

func _on_area_entered(area):
    emit_signal("hit", area)
    queue_free()

# EOF
