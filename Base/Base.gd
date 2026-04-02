@tool
class_name Base extends Node

static var meebs = []


func _ready() -> void:
  meebs = $Meebs.get_children()
  
  
