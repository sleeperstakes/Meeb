extends CharacterBody3D

const CAM_SPEED = .005
const WALK_SPEED = 5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
  %CursorAmmo.play("new_animation")
  %CursorThrow.play("new_animation")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
  $Cursors.position = get_viewport().get_mouse_position()
  
  var dir = Input.get_vector("ui_left","ui_right","ui_down","ui_up")
  velocity.x = dir.x*WALK_SPEED
  velocity.z = -dir.y*WALK_SPEED
  
  var old_vel = velocity 
  
  #the velocity is computed from the modules, next two lines basically say yeah ok now let's translate it to the real world
  var  global_velocity = basis*velocity
  velocity = global_velocity
  move_and_slide()
  velocity = old_vel

func _input(event: InputEvent) -> void:
  if event is InputEventMouseMotion:
    basis = basis.rotated(Vector3.UP,-event.relative.x*CAM_SPEED)
    %CamHandler.rotation_degrees.x = clampf(%CamHandler.rotation_degrees.x-event.relative.y,-90,90)
