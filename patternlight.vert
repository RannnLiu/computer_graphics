//vertex shader
//#version 330 compatibility
#version 120 

varying vec2 vST;   // texture coords
varying vec3 vN;    // normal vector
varying vec3 vL;    // vector from point to light
varying vec3 vE;    // vector from point to eye
/*
out  vec3  vN;        // normal vector
out  vec3  vL;        // vector from point to light
out  vec3  vE;        // vector from point to eye
out vec2      vST;        // texture coords
*/
uniform float uTime;

const float PI =     3.14159265;
const float AMP =     0.2;        // amplitude
const float W =     2.;        // frequency


uniform bool vertPattern;

vec3 LightPosition = vec3(  0., 5., 5. );

void main( )
{
    vec3 vert = gl_Vertex.xyz;
    if(vertPattern)
    {
        vert.x = vert.x * sin( uTime * 10);
        vert.y = vert.y * cos( uTime * 10);
        vert.z = vert.z * cos( uTime * 10);
    }
    
    vST = gl_MultiTexCoord0.st;
    vec4 ECposition = gl_ModelViewMatrix * vec4( vert, 1. );
    vN = normalize( gl_NormalMatrix * gl_Normal );  // normal vector
    vL = LightPosition - ECposition.xyz;            // vector from the point to the light position
    vE = vec3( 0., 0., 0. ) - ECposition.xyz;       // vector from the point to the eye position
    
    gl_Position = gl_ModelViewProjectionMatrix * vec4(vert, 1.);
}


