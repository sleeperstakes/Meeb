@tool 
extends Control

@export var selected = 0:
  set(selected_):
    selected = posmod(selected_, 3)
    if is_node_ready() and get_parent().is_node_ready():
      var sel :CategoryButton =%MeebTypes.get_child(selected)
      sel.selected = true
      %CursorAmmo.hide()
      %CursorThrow.hide()
      if sel.name == "Ammo":
        %CursorAmmo.show()
      else:
        %CursorThrow.show()
        
@export var MEEB_TEXTURES = {
  "Ammo":{
    "cannon": AtlasTexture.new(),
    "bullet": AtlasTexture.new(),
    },
  "Melee":{
    "gribble": AtlasTexture.new(),
    "smooth": AtlasTexture.new(),
    },
  "Ranged":{
    "fire": AtlasTexture.new()
    }
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
  %AmmoSprite.play("default")
  %MeleeSprite.play("default")
  %RangedSprite.play("default")
  for radmenu:RadMenu in %Radials.get_children():
    radmenu.set_items([])
    radmenu.circle_coverage=0.6
    for atlasT: Texture2D in MEEB_TEXTURES[radmenu.name].values():
      radmenu.add_icon_item(atlasT, "Grid", 3)
    
  
func _input(event: InputEvent) -> void:
  if event.is_action_pressed("left_category"):
    print("a")
    selected-=1
  elif event.is_action_pressed("right_category"):
    print("b")
    selected+=1
    
