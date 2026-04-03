class_name MouseIndic extends Node3D

@onready var arrow := %Arrow
@onready var circle := %SelectIndicator
@onready var move_circle := %MoveIndicator
@export var arrow_material := StandardMaterial3D.new()

func _input(event):
    if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_MIDDLE:
        if event.pressed:
            %Arrow.set_visible(false)
            %SelectIndicator.set_visible(false)
        else:
            %Arrow.set_visible(true)
            %SelectIndicator.set_visible(true)
                
func click_indic(target) :
  var new_circle = move_circle.duplicate()
  new_circle.position = target
  new_circle.scale = Vector3.ONE*0.5
  new_circle.show()
  add_child(new_circle)
  
var speed = 2.5
  
func special_select(flag) :   
  if flag:
    speed = 4.5
    arrow_material.albedo_color = Color(0.2,0.2,1.)
  else:
    speed = 2.5
    arrow_material.albedo_color = Color.WHITE
  
func _process(delta):
    arrow.look_at(PC.MainCam.global_position)
    #rotate(TopCam.tpcam.basis.y,PI/2)
    circle.scale+=Vector3.ONE*0.0002*cos(speed*float(Time.get_ticks_msec ( ))/1000.)
    arrow.position.y+=0.001*cos(speed*float(Time.get_ticks_msec ( ))/1000.*2)
    var pos = U3D.get_mouse_in3d(self)
    if pos :
      position = pos
