CSD1   a58d03b94eedfb62763d2b6d922e1ac8         @      O  �   h  �  �  �  h  �  �  �  h  
  �  �  h  �    #version 130

uniform mat4 projection;
uniform mat4 modelview;
uniform vec2 screensize;

in vec4 in_position;
in vec2 in_texcoord;

out vec2 ps_texcoord;
out vec2 ps_rtexcoord;

void main()
{
	ps_texcoord = in_texcoord;
	ps_rtexcoord = in_texcoord*screensize;

	vec4 position = in_position*modelview;
	gl_Position = position*projection;	
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2DRect scrntexture;

uniform float size;

in vec2 ps_texcoord;
in vec2 ps_rtexcoord;

out vec4 oColor;

void main()
{
	float offset[5] = float[]( 0.0, 1.0, 2.0, 3.0, 4.0 );
		float weight[5] = float[]( 0.2270270270, 0.1945945946, 0.1216216216, 0.0540540541, 0.0162162162 );
	vec4 outcolor = texture(texture0, ps_texcoord)*weight[0];
		for(int i = 1; i < 5; i++)
		{
			outcolor += texture(texture0, ps_texcoord+vec2(offset[i]/size, 0))*weight[i];
			outcolor += texture(texture0, ps_texcoord-vec2(offset[i]/size, 0))*weight[i];
		}
		oColor = outcolor;
	}
#version 130

uniform mat4 projection;
uniform mat4 modelview;
uniform vec2 screensize;

in vec4 in_position;
in vec2 in_texcoord;

out vec2 ps_texcoord;
out vec2 ps_rtexcoord;

void main()
{
	ps_texcoord = in_texcoord;
	ps_rtexcoord = in_texcoord*screensize;

	vec4 position = in_position*modelview;
	gl_Position = position*projection;	
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2DRect scrntexture;

uniform float size;

in vec2 ps_texcoord;
in vec2 ps_rtexcoord;

out vec4 oColor;

void main()
{
	float offset[5] = float[]( 0.0, 1.0, 2.0, 3.0, 4.0 );
		float weight[5] = float[]( 0.2270270270, 0.1945945946, 0.1216216216, 0.0540540541, 0.0162162162 );
	vec4 outcolor = texture(texture0, ps_texcoord)*weight[0];
		for(int i = 1; i < 5; i++)
		{
			outcolor += texture(texture0, ps_texcoord+vec2(0, offset[i]/size))*weight[i];
			outcolor += texture(texture0, ps_texcoord-vec2(0, offset[i]/size))*weight[i];
		}
		oColor = outcolor;
	}
#version 130

uniform mat4 projection;
uniform mat4 modelview;
uniform vec2 screensize;

in vec4 in_position;
in vec2 in_texcoord;

out vec2 ps_texcoord;
out vec2 ps_rtexcoord;

void main()
{
	ps_texcoord = in_texcoord;
	ps_rtexcoord = in_texcoord*screensize;

	vec4 position = in_position*modelview;
	gl_Position = position*projection;	
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2DRect scrntexture;

uniform float size;

in vec2 ps_texcoord;
in vec2 ps_rtexcoord;

out vec4 oColor;

void main()
{
	vec4 auracolor = texture(texture0, ps_texcoord);
		vec4 shcolor = texture(scrntexture, ps_rtexcoord);
		oColor = auracolor*(1.0-shcolor.x);
		
	}
#version 130

uniform mat4 projection;
uniform mat4 modelview;
uniform vec2 screensize;

in vec4 in_position;
in vec2 in_texcoord;

out vec2 ps_texcoord;
out vec2 ps_rtexcoord;

void main()
{
	ps_texcoord = in_texcoord;
	ps_rtexcoord = in_texcoord*screensize;

	vec4 position = in_position*modelview;
	gl_Position = position*projection;	
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2DRect scrntexture;

uniform float size;

in vec2 ps_texcoord;
in vec2 ps_rtexcoord;

out vec4 oColor;

void main()
{
	oColor = texture(scrntexture, ps_rtexcoord);
	}
type                               G              