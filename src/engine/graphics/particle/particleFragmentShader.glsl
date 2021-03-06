#version 400 core

#extension GL_EXT_gpu_shader4 : require
#extension GL_ARB_explicit_uniform_location : enable

in vec3 positionWorldPass;
in vec3 positionPass;
in vec3 cameraPass;
in float farPlanePass;
//in vec4 colour;
in vec3 surfaceNormal;
in vec3 toLightVector;
in vec3 toCameraVector;
in float vertexID;
in vec2 textureCoordsPass;
//in float visibility;

layout (location = 0) out vec4 out_Color;
layout (location = 1) out vec4 out_Normals;
layout (location = 2) out vec4 out_Position;
layout (location = 3) out vec4 out_Depth;
layout (location = 4) out vec4 out_toCamera;
layout (location = 5) out vec4 out_Specular;
layout (location = 7) out vec4 out_Settings;
//uniform vec3 lightColour;
//uniform float shineDamper;
//uniform float reflectivity;
//uniform vec3 skyColour;
layout(location = 0) uniform sampler2D particleTexture;
layout(location = 1) uniform sampler2D normalMap;
layout(location = 2) uniform sampler2D specular;
layout(location = 3) uniform sampler2D glow;

void main(void)
{
    out_Color = texture(particleTexture, textureCoordsPass);
    if(out_Color.w == 0)
    {
        discard;
    }
    out_Normals = vec4(0, 0, 0, 1);
    out_Position = vec4(1, 0, 0, 1);
    out_Depth = vec4(0, 0, 0, 1);
    out_toCamera = vec4(1, 0, 0, 1);
    out_Settings = vec4(1, 0, 0, 1);
    out_Specular = vec4(1, 0, 0, 1);
}