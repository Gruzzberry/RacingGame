extends CharacterBody2D


const SPEED = 300.0


# Get the gravity from the project settings to be synced with RigidBody nodes.


func _physics_process(delta):
	look_at(get_global_mouse_position())
	var input = Input.get_axis("ui_down", "ui_up")
	self.velocity=self.transform.x * input * SPEED
	move_and_slide()
