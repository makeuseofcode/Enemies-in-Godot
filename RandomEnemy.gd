extends KinematicBody2D

const MOVE_SPEED = 100
const MOVE_INTERVAL_MIN = 1.0
const MOVE_INTERVAL_MAX = 3.0

var move_timer = 0.0
var move_interval = 0.0
var move_direction = Vector2.ZERO

func _ready():
    choose_new_direction()

func choose_new_direction():
    move_interval = rand_range(MOVE_INTERVAL_MIN, MOVE_INTERVAL_MAX)
    move_timer = move_interval
    move_direction = Vector2(randf(), randf()).normalized()

func _physics_process(delta):
    move_timer -= delta

    if move_timer <= 0.0:
        choose_new_direction()

    var motion = move_direction * MOVE_SPEED * delta
    move_and_collide(motion)
