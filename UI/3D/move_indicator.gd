extends MeshInstance3D

var move_count = 2
var transcendent_time:= 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
  transcendent_time+=delta
  if visible:
    scale-=Vector3.ONE*0.5*delta
    if scale.length() <= 0.01:
      scale = Vector3.ONE*0.5
      move_count -= 1
      if move_count ==0 or transcendent_time >= 5.:
        queue_free()
