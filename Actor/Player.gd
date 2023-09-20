extends KinematicBody2D

onready var sprite = $Sprite

export var run_speed = 350
export var jump_speed = -1000
export var gravity = 2500

var velocity = Vector2()

func get_input():
	velocity.x = 0
	var right = Input.is_action_pressed('ui_right')
	var left = Input.is_action_pressed('ui_left')
	var jump = Input.is_action_just_pressed('ui_up')

	if is_on_floor() and jump:
		velocity.y = jump_speed
	if right:
		velocity.x += run_speed
		sprite.scale.x = 1
	if left:
		velocity.x -= run_speed
		sprite.scale.x = -1

func _physics_process(delta):
	velocity.y += gravity * delta
	get_input()
	velocity = move_and_slide(velocity, Vector2(0, -1))


func _on_HurtArea_area_entered(area):
	PlayerDie()

func PlayerDie():
	print("die")
	get_tree().reload_current_scene()
