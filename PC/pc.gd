extends Marker3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
  %CursorAmmo.play("new_animation")
  %CursorThrow.play("new_animation")
  pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
  $Cursors.position = get_viewport().get_mouse_position()
  pass
