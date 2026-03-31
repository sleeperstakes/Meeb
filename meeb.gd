@tool
extends Node3D

var textureGribble = preload("res://Assets/Meebs/Gribble.png")
var textureSmooth = preload("res://Assets/Meebs/Smooth.png")
var textureFlame = preload("res://Assets/Meebs/Flame.png")
var textureBullet = preload("res://Assets/Meebs/Bullet.png")

enum MeebKind {
  Gribble,
  Smooth,
  Flame,
  Bullet
}

@export var texture : Texture2D: 
  set(t):
    texture = t
    if is_node_ready():
      %Sprite3D.texture = texture

@export var kind:MeebKind:
  set(k):
    kind = k
    if is_node_ready():
      match kind:
        MeebKind.Gribble: 
          texture = textureGribble
        MeebKind.Smooth: 
          texture = textureSmooth
        MeebKind.Flame: 
          texture = textureFlame
        MeebKind.Bullet: 
          texture = textureBullet
