extends CharacterBody2D


const SPEED = 300.0 #Uneeded I think now
const MAXSPEED = 300 #The Max Speed of the Vehicle
const ACCELERATIONTIME = 3 #How long it takes to get to full speed
const ACCELERATIONRATE = 500

# Get the gravity from the project settings to be synced with RigidBody nodes.
var currentSpeed = 0

func calculate_acceleration():
		var speedRatio = currentSpeed / MAXSPEED #Gets a fraction signifying how close it is to top speed
		var acceleration = sin(3.141 * (1 - speedRatio))
		return acceleration


func _physics_process(delta):
	
	
	
	#look_at(get_global_mouse_position())
	var input = Input.get_axis("ui_down", "ui_up")
	#Check the Current Velocity
	#Check if it is up or down
	#If it's up calculate incrase of velocity
		#Take current velocity
		#When Speed = 0 Sin(x)=10
		#When Speed = 300 Sin(x)=0
	var acceleration = calculate_acceleration()
	
	
	#If it's down calculate decrease of velocity
	
	self.velocity=self.transform.x * acceleration * input
	print("Acceleration: ", acceleration)
	print("Input: ", input)
	print("Transform: ", self.transform.x)
	print("Velocity: ", self.velocity)
	move_and_slide()
