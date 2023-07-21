extends KinematicBody2D

const SPEED = 100
const SHOOT_DELAY = 1.5
var shoot_timer = SHOOT_DELAY

# Import the Bullet scene
const BulletScene = preload("res://Bullet.tscn")

func _physics_process(delta):
	var player = get_parent().get_node("Player")
	var player_position = player.global_position
	var enemy_position = global_position
	var direction = player_position - enemy_position
	direction = direction.normalized()

	var motion = direction * SPEED * delta
	move_and_collide(motion)
	# Shooting logic
	shoot_timer -= delta
	if shoot_timer <= 0:
		shoot_timer = SHOOT_DELAY
		var bullet_instance = BulletScene.instance() 
		bullet_instance.global_position = global_position
		bullet_instance.set_direction(direction) 
		get_parent().add_child(bullet_instance)
