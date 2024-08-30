extends CharacterBody2D

# @export lets you modify it in the left "inspector" tab
# means you can change the speed without modifying the script
@export var max_speed: int = 300
# can use ": int" to type hint that it's an int
# also useful to catch errors
@export var acceleration: int = 5
@export var friction: int = 5

# can use "move_towards" instead: https://docs.godotengine.org/en/stable/classes/class_vector2.html#class-vector2-method-move-toward
# does incrementation by a fixed amount - aka acceleration
#func calculate_acceleration():
		#var speedRatio = currentSpeed / MAXSPEED #Gets a fraction signifying how close it is to top speed
		#var acceleration = sin(3.141 * (1 - speedRatio))
		#return acceleration

func _physics_process(_delta):
	look_at(get_global_mouse_position())
	var forward_or_backward = Input.get_axis("ui_down", "ui_up")
	
	# if we are not pressing anything, move our velocity towards (0,0) (x,y)
	if forward_or_backward == 0:
		velocity = velocity.move_toward(Vector2.ZERO, friction)
	else: # if we are pressing, accelerate towards our transform * input * max speed
		velocity = velocity.move_toward(transform.x * forward_or_backward * max_speed, acceleration)
	
	move_and_slide()
