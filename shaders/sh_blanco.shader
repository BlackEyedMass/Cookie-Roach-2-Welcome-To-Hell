shader_type canvas_item;

uniform vec3 color = vec3(1.0,1.0,1.0);

void fragment()
{
	COLOR = texture(TEXTURE,UV); //read from texture
	COLOR.r = color.r;
	COLOR.g = color.g;
	COLOR.b = color.b; //set blue channel to 1.0
}