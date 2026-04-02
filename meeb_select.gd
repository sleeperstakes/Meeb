@tool 
extends Control




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
    
  
