# class_name gives a name to this type of CharacterBody2D
# So in other scripts if I want to make a new "Player"
# I can use stuff like Player.new()
# And that would make a new McSpeeeeeeeed
class_name Player extends CharacterBody2D

# @export lets you modify it in the left "inspector" tab
# means you can change the speed without modifying the script
@export var max_speed: int = 300
# can use ": int" to type hint that it's an int
# also useful to catch errors
@export var acceleration: int = 20
@export var friction: int = 10

func _physics_process(_delta):
	look_at(get_global_mouse_position())
	var forward_or_backward = Input.get_axis("ui_down", "ui_up")
	
	# if we are not pressing anything, move our velocity towards (0,0) (x,y)
	if forward_or_backward == 0:
		velocity = velocity.move_toward(Vector2.ZERO, friction)
	else: # if we are pressing, accelerate towards our transform * input * max speed
		velocity = velocity.move_toward(transform.x * forward_or_backward * max_speed, acceleration)
	
	move_and_slide()

func boost() -> void:
	var _old_speed = max_speed
	var _old_acceleration = acceleration
	max_speed = max_speed * 2
	acceleration = acceleration * 2
