extends Control

func _on_new_game():
    Mediator.new_game()

func _on_exit_game():
    get_tree().quit()
