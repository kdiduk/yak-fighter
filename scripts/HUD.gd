extends Node

onready var level_label = $VBoxContainer/HBoxContainer/LevelLabel
onready var score_label = $VBoxContainer/HBoxContainer/ScoreLabel
onready var hitpoints_label = $VBoxContainer/HBoxContainer2/HitpointsLabel
onready var lives_label = $VBoxContainer/HBoxContainer2/LivesLabel

var level: int
var score: int
var hitpoints: int
var lives: int

func _ready():
    level = PlayerData.current_level
    score = PlayerData.score
    hitpoints = PlayerData.hitpoints
    lives = PlayerData.lives
    _update_level_label()
    _update_score_label()
    _update_hitpoints_label()
    _update_lives_label()

# warning-ignore: unused_argument
func _process(delta) -> void:
    if PlayerData.current_level != level:
        level = PlayerData.current_level
        _update_level_label()
    if PlayerData.score != score:
        score = PlayerData.score
        _update_score_label()
    if PlayerData.hitpoints != hitpoints:
        hitpoints = PlayerData.hitpoints
        _update_hitpoints_label()
    if PlayerData.lives != lives:
        lives = PlayerData.lives
        _update_lives_label()

func _update_level_label() -> void:
    level_label.set_text("LEVEL: %02d" % level)

func _update_score_label() -> void:
    score_label.set_text("SCORE: %05d" % score)

func _update_hitpoints_label() -> void:
    hitpoints_label.set_text("HP: %d%%" %  hitpoints)

func _update_lives_label() -> void:
    lives_label.set_text("LIVES: %02d" % lives)