extends Area2D

# in the left hand panel see that there is a little wifi symbol
# next to "BoostPad" that's a signal
# that signal is connected to this function
# the signal is emitted when any body (CharacterBody for instance)
# enters the area
func _when_body_entered(body: Node2D):
	# does the character have the method boost?
	if body.has_method("boost"):
		# if so, boost
		body.boost()
