extends Area2D

export var velocity = Vector2()
var hitpoints = 2

func _process(delta):
    move_local_x(delta * velocity.x)
    move_local_y(delta * velocity.y)

func _on_screen_exited():
    queue_free()

func _on_bullet_hit(area: Area2D, damage: int):
    if area != self:
        return
    hitpoints -= damage
    if hitpoints <= 0:
        PlayerData.score += 3
        queue_free()
    else:
        PlayerData.score += 1

func _on_player_hit(area: Area2D, damage: int):
    if area != self:
        return
    hitpoints -= damage
    if hitpoints <= 0:
        queue_free()
    PlayerData.cause_damage(25)
    if not PlayerData.is_alive():
        print("Player killed")

# EOF
