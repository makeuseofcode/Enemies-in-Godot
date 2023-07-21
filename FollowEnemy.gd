extends KinematicBody2D

const SPEED = 100

func _physics_process(delta):
	var player = get_parent().get_node("Player")
	var player_position = player.global_position
	var enemy_position = global_position
	var direction = player_position - enemy_position
	direction = direction.normalized()

	var motion = direction * SPEED * delta
	move_and_collide(motion)
