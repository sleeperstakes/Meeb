class_name Meeb extends Node



enum MeebKind {
  Melee,
  Ranged,
  Ammo
}

@export var kind:MeebKind = MeebKind.Melee
@export var walk_speed = 10.0
@export var attack_delay = 1.0
@export var recoil = 0.0
@export var pushback_on_hit = 1.0
@export var stun_power = 1.0


func with_kind(k:MeebKind):
  kind = k
  return self
func with_walk_speed(k:float):
  walk_speed = k
  return self
func with_attack_delay(k:float):
  attack_delay = k
  return self
func with_recoil(k:float):
  recoil = k
  return self
func with_pushback_on_hit(k:float):
  pushback_on_hit = k
  return self
func with_stun_power(k:float):
  stun_power = k
  return self
