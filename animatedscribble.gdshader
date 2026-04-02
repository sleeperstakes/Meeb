shader_type spatial;

uniform float size = 0.4;
uniform float intensity = 0.4;
uniform float frame_time = 0.17;
void vertex() {
  float rounded_time = round(TIME / frame_time) * frame_time;
	
	float heightX = pow(abs(cos(VERTEX.y * size + rounded_time * 10.0)), 0.5) * intensity 
	 - pow(abs(cos(VERTEX.z * size * 0.7 + rounded_time * 5.0)), 0.5) * intensity * 1.3;          
	float heightY = pow(abs(cos(VERTEX.x * size + rounded_time * 15.0)), 0.5) * intensity 
	 - pow(abs(cos(VERTEX.z * size * 0.7 + rounded_time * 10.0)), 0.5) * intensity * 1.3;
	float heightZ = pow(abs(cos(VERTEX.y * size + rounded_time * 20.0)), 0.5) * intensity 
	 - pow(abs(cos(VERTEX.x * size * 0.7 + rounded_time * 15.0)), 0.5) * intensity * 1.3;
	VERTEX += vec3(heightX, heightY, heightZ);
}