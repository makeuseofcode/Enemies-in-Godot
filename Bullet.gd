extends KinematicBody2D

const BULLET_SPEED = 300
var bullet_direction = Vector2.ZERO

func _physics_process(delta):
    var motion = bullet_direction * BULLET_SPEED * delta
    move_and_collide(motion)

func set_direction(direction):
    bullet_direction = direction.normalized()
