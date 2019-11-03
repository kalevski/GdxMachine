#ifdef GL_ES
#define LOWP lowp
precision mediump float;
#else
#define LOWP
#endif

varying LOWP vec4 v_color;
varying vec2 v_texCoords;
varying vec2 v_texCoords_mask;

uniform sampler2D u_texture;
uniform sampler2D u_texture_mask;

void main() {
    vec4 texColor = texture2D(u_texture, v_texCoords) * v_color;
    texColor.a = texture2D(u_texture_mask, v_texCoords_mask).a;
    gl_FragColor = texColor;
}