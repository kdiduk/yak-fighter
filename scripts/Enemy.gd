extends Area2D

export var velocity = Vector2()
var lives = 2

func _process(delta):
    move_local_x(delta * velocity.x)
    move_local_y(delta * velocity.y)

func _on_screen_exited():
    queue_free()

func _on_bullet_hit(area: Area2D):
    if area != self:
        return
    lives -= 1
    if lives <= 0:
        queue_free()