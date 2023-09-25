extends CharacterBody2D

const inputs = {
	"right": Vector2.RIGHT,
	"left": Vector2.LEFT,
	"down": Vector2.DOWN,
	"up": Vector2.UP
}

var grid_size = 24
var raycast

func _ready():
	raycast = get_node("RayCast2D")

func _unhandled_input(event):
	for action in inputs.keys():
		if event.is_action_pressed(action):
			move(action)


func move(action):
	var destination = inputs[action] * grid_size
	raycast.set_target_position(destination) # update position depending on destination
	raycast.force_raycast_update()
	if not raycast.is_colliding():
		position += destination
