class_name U3D extends Node

static func  align_up(node_basis: Basis, normal: Vector3) -> Basis:
      var result = Basis()
      var scale = node_basis.get_scale() # Only if your node might have a scale other than (1,1,1)

      result.y = normal
      result.x = normal.cross(node_basis.z)
      result.z = node_basis.x.cross(normal)
    
      result=result.orthonormalized()

      result.x *= scale.x #
      result.y *= scale.y #
      result.z *= scale.z #
      return result.orthonormalized()

static func get_mouse_in3d(context: Node3D):
    var world3d : World3D = context.get_world_3d()
    var spaceState : PhysicsDirectSpaceState3D =  world3d.direct_space_state
    var mouse_pos = context.get_viewport().get_mouse_position()
    var camera : Camera3D= PC.MainCam
    var distance = 2000
    var rayOrigin = camera.project_ray_origin(mouse_pos)
    var rayEnd = rayOrigin + camera.project_ray_normal(mouse_pos) * distance
    var rayDict : Dictionary= spaceState.intersect_ray(PhysicsRayQueryParameters3D.create(rayOrigin,rayEnd,1))
    if rayDict.has("position"):
      return rayDict["position"]
