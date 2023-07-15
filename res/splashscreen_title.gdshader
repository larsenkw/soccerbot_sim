/*
This shader is attempting to create a color gradient affect. However, this 
script is not completely effective. It needs to create a gradient multiplier 
that us based on the Label's origin and height rather than using the screen 
(x,y) and then applying a manual "multiplier" factor.

This is also unable to apply a solid color background and applies the gradient 
to the text as well as its outline. You will need to find a way to add the 
background as a solid color.
*/

shader_type canvas_item;
render_mode unshaded;

uniform vec4 color_start = vec4(0.0, 0.0, 0.0, 1.0);
uniform vec4 color_end = vec4(1.0, 1.0, 1.0, 1.0);
uniform float multiplier = 2.0;
uniform float offset = 0.0;

void fragment() {
	float red_gradient = color_start.r + multiplier * (SCREEN_UV.y - offset) * (color_end.r - color_start.r);
	float green_gradient = color_start.g + multiplier * (SCREEN_UV.y - offset) * (color_end.g - color_start.g);
	float blue_gradient = color_start.b + multiplier * (SCREEN_UV.y - offset) * (color_end.b - color_start.b);
	COLOR.r = clamp(red_gradient, min(color_start.r, color_end.r), max(color_start.r, color_end.r));
	COLOR.g = clamp(green_gradient, min(color_start.g, color_end.g), max(color_start.g, color_end.g));
	COLOR.b = clamp(blue_gradient, min(color_start.b, color_end.b), max(color_start.b, color_end.b));
}
