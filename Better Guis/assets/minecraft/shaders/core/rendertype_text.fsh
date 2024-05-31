#version 150

#moj_import <fog.glsl>

uniform sampler2D Sampler0;

uniform vec4 ColorModulator;
uniform float FogStart;
uniform float FogEnd;
uniform vec4 FogColor;

in float vertexDistance;
in vec4 vertexColor;
in vec2 texCoord0;

out vec4 fragColor;

void main() {
    vec4 color = texture(Sampler0, texCoord0) * vertexColor * ColorModulator;
    if (color.a < 0.1) {
        discard;
    }

    if (vertexDistance > 800.0 && color.a > 0.99) {
	if (color.r > 0.2441 && color.r < 0.2442 && color.g > 0.2441 && color.g < 0.2442 && color.b > 0.2441 && color.b < 0.2442) color = vec4(0.1, 0.1, 0.1, 1.0);
	if (color.r > 0.2480 && color.r < 0.2481 && color.g > 0.2480 && color.g < 0.2481 && color.b > 0.2480 && color.b < 0.2481) color = vec4(1.0, 1.0, 1.0, 1.0);
	if (color.r > 0.3294 && color.r < 0.3295 && color.g > 0.3294 && color.g < 0.3295 && color.b > 0.3294 && color.b < 0.3295) color = vec4(0.65, 0.7, 0.7, 1.0);
	if (color.r > 0.6588 && color.r < 0.6589 && color.g > 0.6588 && color.g < 0.6589 && color.b > 0.6588 && color.b < 0.6589) color = vec4(0.93, 0.95, 0.93, 1.0);
	if (color.r > 0.403 && color.r < 0.4031 && color.g > 0.3642 && color.g < 0.3643 && color.b > 0.2867 && color.b < 0.2868) color = vec4(0.78, 1.0, 0.56, 1.0);
	if (color.r > 0.496 && color.r < 0.4961 && color.g > 0.496 && color.g < 0.4961 && color.b > 0.496 && color.b < 0.4961) color = vec4(0.95, 0.95, 0.93, 1.0);
    }

    fragColor = linear_fog(color, vertexDistance, FogStart, FogEnd, FogColor);
}
