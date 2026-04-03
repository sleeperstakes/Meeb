shader_type canvas_item;
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_nearest_mipmap_anisotropic;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
  COLOR = texture(SCREEN_TEXTURE,SCREEN_UV);
    if (COLOR.r+COLOR.g+COLOR.b > 0.5) {
    COLOR.rgb = vec3(1.);
  } else {
    COLOR.rgb = vec3(0.);
  }
}
