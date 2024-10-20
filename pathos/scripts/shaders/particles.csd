CSD1   5fc30ad95b7eb8036a7b18c559e11bed    �j
    @   �   �q
 �	  �  �  $  �  �  �  J  &  �  )  u  y4  �  k7  5  �B  M  �E  �  �Q  M  �T  �  �`  M  3d    Gp  �  �s  b  1�  �  ��  �  A�  �  ɓ  �  |�  �  ?�    @�  �  �  '  *�  �  ��  R  ?�  �  =�  �  ��  �  ��  �  ��  �  ��  �  �   � �  :   K �  
&   ) �  5 l  q8 8  �D l  H ^  sT l  �W �  hd �  h �  �t �  �x �  �� �  1� (  Y� �  ;� v  �� �  �� �  /� �  � �  ��   ��   
�   '� ;  b�   � f  �   �       4  I    Z# _  �/ l  %3 �  �? l  >C �  P l  }S �  {` �  "d L  nq �  u r  �� �  .� �  ˓ �  �� �  �� �  z�   �� �  m� <  ��   �� �  P�   m� �  �   :� �     & �  �   � �  c!   t$ �  H1 l  �4 "  �A l  BE H  �R l  �U s  ic �  g �  �t �  xx �  _� �  �   � �  �� `  Z� �  <� �  ¼ �  �� �  U�   r� �  q�   �� %  ��   �� P   	   1 �  )   :   X)   i, I  �9 l  = �  �J l  !N �  �[ l  J_ �  2m �  �p 6   �  �� \  � �  �� �  @� �  "� �  �� �  ٹ �  �� �  �� &  ��   �� t  m�   �� �  $   A �   �  �   
& �  �( 8  45 �  &8 c  �D �  {G #  �S M  �V �  �c M  �f �  �s M  w   � �  �� P  � �  o� v  � �  m� �  � �  Ѻ �  �� �  ��   �� �  [� @  �� �  �� �  '� �  % �  � �  � �  �$   �' �  N4   _7 �  D   G �  �S l  aW &  �d l  �g L  ?u l  �x w  "� �  ɉ �  �� �  5� �   � �  Ǭ   ݺ �  �� d  #� �  � �  �� �  q� �  &�   C�   F   c	 )  �   � T  �+   / �  
<   ? "  =L   NO M  �\ l  ` �  �m l  q �  �~ l  ;� �  '� �  Γ :  � �  �� `  � �  �� �  A� �  #� �  �� �  �� �  �� �  �� *  ��    x  ~   � �  9&   V* �  :   0= q  �J   �M �  I[   Z^ �  l l  �o   �} l  � 6  :� l  �� a  � �  �� �  ]� �  � �  �� �  ��    �� �  b� N  �� �  �� t  � �  �	 �  �	   �	 �  �&	   �*	   �:	   �>	 >  O	   -R	 �  `	   $c	   0q	   At	 7  x�	 l  �	 �  i�	 l  ՗	 �  ��	 l  �	 �  ¸	 �  i�	 $  ��	 �  4�	 J  ~�	 �  %�	 u  ��	 �  |�	 �  ?
 �  !	
 �  

 �  �
    -
   1
 b  A
   �E
 �  $V
   AZ
 �  #version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	if(finalColor.a < 0.5)
			discard;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	finalColor.a = (finalColor.a - 0.5) / max(fwidth(finalColor.a), 0.0001) + 0.5;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	float DIST_POWER = -0.02;
		vec3 dudvcolor = (2.0 * texture (rtexture0, ps_texcoord).xyz) - 1.0;
		vec2 fetch_tc = vec2(ps_texcoord.x + dudvcolor.x*DIST_POWER*scrsize.x, ps_texcoord.y + dudvcolor.y*DIST_POWER*scrsize.y);
		vec4 finalColor = texture(rtexture1, fetch_tc);
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	if(finalColor.a < 0.5)
			discard;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	finalColor.a = (finalColor.a - 0.5) / max(fwidth(finalColor.a), 0.0001) + 0.5;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	if(finalColor.a < 0.5)
			discard;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	finalColor.a = (finalColor.a - 0.5) / max(fwidth(finalColor.a), 0.0001) + 0.5;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	if(finalColor.a < 0.5)
			discard;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	finalColor.a = (finalColor.a - 0.5) / max(fwidth(finalColor.a), 0.0001) + 0.5;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	ps_proj_l3vertexcoord = proj_lights_3_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz += AddProjLight(proj_lights_3_origin, proj_lights_3_color, proj_lights_3_radius, ps_vertexpos, ps_proj_l3vertexcoord, proj_lights_3_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	ps_proj_l3vertexcoord = proj_lights_3_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz += AddProjLight(proj_lights_3_origin, proj_lights_3_color, proj_lights_3_radius, ps_vertexpos, ps_proj_l3vertexcoord, proj_lights_3_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	if(finalColor.a < 0.5)
			discard;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	ps_proj_l3vertexcoord = proj_lights_3_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz += AddProjLight(proj_lights_3_origin, proj_lights_3_color, proj_lights_3_radius, ps_vertexpos, ps_proj_l3vertexcoord, proj_lights_3_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	finalColor.a = (finalColor.a - 0.5) / max(fwidth(finalColor.a), 0.0001) + 0.5;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	if(finalColor.a < 0.5)
			discard;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	finalColor.a = (finalColor.a - 0.5) / max(fwidth(finalColor.a), 0.0001) + 0.5;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	if(finalColor.a < 0.5)
			discard;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	finalColor.a = (finalColor.a - 0.5) / max(fwidth(finalColor.a), 0.0001) + 0.5;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	if(finalColor.a < 0.5)
			discard;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	finalColor.a = (finalColor.a - 0.5) / max(fwidth(finalColor.a), 0.0001) + 0.5;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	if(finalColor.a < 0.5)
			discard;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	finalColor.a = (finalColor.a - 0.5) / max(fwidth(finalColor.a), 0.0001) + 0.5;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	ps_proj_l3vertexcoord = proj_lights_3_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz += AddProjLight(proj_lights_3_origin, proj_lights_3_color, proj_lights_3_radius, ps_vertexpos, ps_proj_l3vertexcoord, proj_lights_3_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	ps_proj_l3vertexcoord = proj_lights_3_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz += AddProjLight(proj_lights_3_origin, proj_lights_3_color, proj_lights_3_radius, ps_vertexpos, ps_proj_l3vertexcoord, proj_lights_3_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	if(finalColor.a < 0.5)
			discard;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	ps_proj_l3vertexcoord = proj_lights_3_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz += AddProjLight(proj_lights_3_origin, proj_lights_3_color, proj_lights_3_radius, ps_vertexpos, ps_proj_l3vertexcoord, proj_lights_3_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	finalColor.a = (finalColor.a - 0.5) / max(fwidth(finalColor.a), 0.0001) + 0.5;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	if(finalColor.a < 0.5)
			discard;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	finalColor.a = (finalColor.a - 0.5) / max(fwidth(finalColor.a), 0.0001) + 0.5;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	if(finalColor.a < 0.5)
			discard;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	finalColor.a = (finalColor.a - 0.5) / max(fwidth(finalColor.a), 0.0001) + 0.5;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	if(finalColor.a < 0.5)
			discard;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	finalColor.a = (finalColor.a - 0.5) / max(fwidth(finalColor.a), 0.0001) + 0.5;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	if(finalColor.a < 0.5)
			discard;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	finalColor.a = (finalColor.a - 0.5) / max(fwidth(finalColor.a), 0.0001) + 0.5;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	ps_proj_l3vertexcoord = proj_lights_3_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz += AddProjLight(proj_lights_3_origin, proj_lights_3_color, proj_lights_3_radius, ps_vertexpos, ps_proj_l3vertexcoord, proj_lights_3_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	ps_proj_l3vertexcoord = proj_lights_3_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz += AddProjLight(proj_lights_3_origin, proj_lights_3_color, proj_lights_3_radius, ps_vertexpos, ps_proj_l3vertexcoord, proj_lights_3_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	if(finalColor.a < 0.5)
			discard;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	ps_proj_l3vertexcoord = proj_lights_3_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz += AddProjLight(proj_lights_3_origin, proj_lights_3_color, proj_lights_3_radius, ps_vertexpos, ps_proj_l3vertexcoord, proj_lights_3_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	finalColor.a = (finalColor.a - 0.5) / max(fwidth(finalColor.a), 0.0001) + 0.5;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	if(finalColor.a < 0.5)
			discard;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	finalColor.a = (finalColor.a - 0.5) / max(fwidth(finalColor.a), 0.0001) + 0.5;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	if(finalColor.a < 0.5)
			discard;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	finalColor.a = (finalColor.a - 0.5) / max(fwidth(finalColor.a), 0.0001) + 0.5;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	if(finalColor.a < 0.5)
			discard;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	finalColor.a = (finalColor.a - 0.5) / max(fwidth(finalColor.a), 0.0001) + 0.5;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	if(finalColor.a < 0.5)
			discard;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	finalColor.a = (finalColor.a - 0.5) / max(fwidth(finalColor.a), 0.0001) + 0.5;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	ps_proj_l3vertexcoord = proj_lights_3_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz += AddProjLight(proj_lights_3_origin, proj_lights_3_color, proj_lights_3_radius, ps_vertexpos, ps_proj_l3vertexcoord, proj_lights_3_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	ps_proj_l3vertexcoord = proj_lights_3_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz += AddProjLight(proj_lights_3_origin, proj_lights_3_color, proj_lights_3_radius, ps_vertexpos, ps_proj_l3vertexcoord, proj_lights_3_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	if(finalColor.a < 0.5)
			discard;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	ps_proj_l3vertexcoord = proj_lights_3_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz += AddProjLight(proj_lights_3_origin, proj_lights_3_color, proj_lights_3_radius, ps_vertexpos, ps_proj_l3vertexcoord, proj_lights_3_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	finalColor.a = (finalColor.a - 0.5) / max(fwidth(finalColor.a), 0.0001) + 0.5;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_3_origin, point_lights_3_color, point_lights_3_radius, ps_vertexpos);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_3_origin, point_lights_3_color, point_lights_3_radius, ps_vertexpos);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	if(finalColor.a < 0.5)
			discard;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_3_origin, point_lights_3_color, point_lights_3_radius, ps_vertexpos);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	finalColor.a = (finalColor.a - 0.5) / max(fwidth(finalColor.a), 0.0001) + 0.5;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_3_origin, point_lights_3_color, point_lights_3_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_3_origin, point_lights_3_color, point_lights_3_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	if(finalColor.a < 0.5)
			discard;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_3_origin, point_lights_3_color, point_lights_3_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	finalColor.a = (finalColor.a - 0.5) / max(fwidth(finalColor.a), 0.0001) + 0.5;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_3_origin, point_lights_3_color, point_lights_3_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_3_origin, point_lights_3_color, point_lights_3_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	if(finalColor.a < 0.5)
			discard;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_3_origin, point_lights_3_color, point_lights_3_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	finalColor.a = (finalColor.a - 0.5) / max(fwidth(finalColor.a), 0.0001) + 0.5;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_3_origin, point_lights_3_color, point_lights_3_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_3_origin, point_lights_3_color, point_lights_3_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	if(finalColor.a < 0.5)
			discard;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_3_origin, point_lights_3_color, point_lights_3_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	finalColor.a = (finalColor.a - 0.5) / max(fwidth(finalColor.a), 0.0001) + 0.5;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	ps_proj_l3vertexcoord = proj_lights_3_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_3_origin, point_lights_3_color, point_lights_3_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz += AddProjLight(proj_lights_3_origin, proj_lights_3_color, proj_lights_3_radius, ps_vertexpos, ps_proj_l3vertexcoord, proj_lights_3_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	ps_proj_l3vertexcoord = proj_lights_3_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_3_origin, point_lights_3_color, point_lights_3_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz += AddProjLight(proj_lights_3_origin, proj_lights_3_color, proj_lights_3_radius, ps_vertexpos, ps_proj_l3vertexcoord, proj_lights_3_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	if(finalColor.a < 0.5)
			discard;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	ps_proj_l3vertexcoord = proj_lights_3_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_3_origin, point_lights_3_color, point_lights_3_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz += AddProjLight(proj_lights_3_origin, proj_lights_3_color, proj_lights_3_radius, ps_vertexpos, ps_proj_l3vertexcoord, proj_lights_3_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	finalColor.a = (finalColor.a - 0.5) / max(fwidth(finalColor.a), 0.0001) + 0.5;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	if(finalColor.a < 0.5)
			discard;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	finalColor.a = (finalColor.a - 0.5) / max(fwidth(finalColor.a), 0.0001) + 0.5;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	float DIST_POWER = -0.02;
		vec3 dudvcolor = (2.0 * texture (rtexture0, ps_texcoord).xyz) - 1.0;
		vec2 fetch_tc = vec2(ps_texcoord.x + dudvcolor.x*DIST_POWER*scrsize.x, ps_texcoord.y + dudvcolor.y*DIST_POWER*scrsize.y);
		vec4 finalColor = texture(rtexture1, fetch_tc);
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	if(finalColor.a < 0.5)
			discard;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	finalColor.a = (finalColor.a - 0.5) / max(fwidth(finalColor.a), 0.0001) + 0.5;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	if(finalColor.a < 0.5)
			discard;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	finalColor.a = (finalColor.a - 0.5) / max(fwidth(finalColor.a), 0.0001) + 0.5;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	if(finalColor.a < 0.5)
			discard;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	finalColor.a = (finalColor.a - 0.5) / max(fwidth(finalColor.a), 0.0001) + 0.5;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	ps_proj_l3vertexcoord = proj_lights_3_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz += AddProjLight(proj_lights_3_origin, proj_lights_3_color, proj_lights_3_radius, ps_vertexpos, ps_proj_l3vertexcoord, proj_lights_3_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	ps_proj_l3vertexcoord = proj_lights_3_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz += AddProjLight(proj_lights_3_origin, proj_lights_3_color, proj_lights_3_radius, ps_vertexpos, ps_proj_l3vertexcoord, proj_lights_3_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	if(finalColor.a < 0.5)
			discard;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	ps_proj_l3vertexcoord = proj_lights_3_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz += AddProjLight(proj_lights_3_origin, proj_lights_3_color, proj_lights_3_radius, ps_vertexpos, ps_proj_l3vertexcoord, proj_lights_3_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	finalColor.a = (finalColor.a - 0.5) / max(fwidth(finalColor.a), 0.0001) + 0.5;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	if(finalColor.a < 0.5)
			discard;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	finalColor.a = (finalColor.a - 0.5) / max(fwidth(finalColor.a), 0.0001) + 0.5;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	if(finalColor.a < 0.5)
			discard;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	finalColor.a = (finalColor.a - 0.5) / max(fwidth(finalColor.a), 0.0001) + 0.5;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	if(finalColor.a < 0.5)
			discard;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	finalColor.a = (finalColor.a - 0.5) / max(fwidth(finalColor.a), 0.0001) + 0.5;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	if(finalColor.a < 0.5)
			discard;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	finalColor.a = (finalColor.a - 0.5) / max(fwidth(finalColor.a), 0.0001) + 0.5;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	ps_proj_l3vertexcoord = proj_lights_3_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz += AddProjLight(proj_lights_3_origin, proj_lights_3_color, proj_lights_3_radius, ps_vertexpos, ps_proj_l3vertexcoord, proj_lights_3_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	ps_proj_l3vertexcoord = proj_lights_3_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz += AddProjLight(proj_lights_3_origin, proj_lights_3_color, proj_lights_3_radius, ps_vertexpos, ps_proj_l3vertexcoord, proj_lights_3_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	if(finalColor.a < 0.5)
			discard;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	ps_proj_l3vertexcoord = proj_lights_3_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz += AddProjLight(proj_lights_3_origin, proj_lights_3_color, proj_lights_3_radius, ps_vertexpos, ps_proj_l3vertexcoord, proj_lights_3_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	finalColor.a = (finalColor.a - 0.5) / max(fwidth(finalColor.a), 0.0001) + 0.5;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	if(finalColor.a < 0.5)
			discard;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	finalColor.a = (finalColor.a - 0.5) / max(fwidth(finalColor.a), 0.0001) + 0.5;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	if(finalColor.a < 0.5)
			discard;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	finalColor.a = (finalColor.a - 0.5) / max(fwidth(finalColor.a), 0.0001) + 0.5;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	if(finalColor.a < 0.5)
			discard;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	finalColor.a = (finalColor.a - 0.5) / max(fwidth(finalColor.a), 0.0001) + 0.5;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	if(finalColor.a < 0.5)
			discard;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	finalColor.a = (finalColor.a - 0.5) / max(fwidth(finalColor.a), 0.0001) + 0.5;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	ps_proj_l3vertexcoord = proj_lights_3_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz += AddProjLight(proj_lights_3_origin, proj_lights_3_color, proj_lights_3_radius, ps_vertexpos, ps_proj_l3vertexcoord, proj_lights_3_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	ps_proj_l3vertexcoord = proj_lights_3_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz += AddProjLight(proj_lights_3_origin, proj_lights_3_color, proj_lights_3_radius, ps_vertexpos, ps_proj_l3vertexcoord, proj_lights_3_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	if(finalColor.a < 0.5)
			discard;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	ps_proj_l3vertexcoord = proj_lights_3_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz += AddProjLight(proj_lights_3_origin, proj_lights_3_color, proj_lights_3_radius, ps_vertexpos, ps_proj_l3vertexcoord, proj_lights_3_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	finalColor.a = (finalColor.a - 0.5) / max(fwidth(finalColor.a), 0.0001) + 0.5;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	if(finalColor.a < 0.5)
			discard;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	finalColor.a = (finalColor.a - 0.5) / max(fwidth(finalColor.a), 0.0001) + 0.5;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	if(finalColor.a < 0.5)
			discard;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	finalColor.a = (finalColor.a - 0.5) / max(fwidth(finalColor.a), 0.0001) + 0.5;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	if(finalColor.a < 0.5)
			discard;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	finalColor.a = (finalColor.a - 0.5) / max(fwidth(finalColor.a), 0.0001) + 0.5;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	if(finalColor.a < 0.5)
			discard;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	finalColor.a = (finalColor.a - 0.5) / max(fwidth(finalColor.a), 0.0001) + 0.5;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	ps_proj_l3vertexcoord = proj_lights_3_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz += AddProjLight(proj_lights_3_origin, proj_lights_3_color, proj_lights_3_radius, ps_vertexpos, ps_proj_l3vertexcoord, proj_lights_3_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	ps_proj_l3vertexcoord = proj_lights_3_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz += AddProjLight(proj_lights_3_origin, proj_lights_3_color, proj_lights_3_radius, ps_vertexpos, ps_proj_l3vertexcoord, proj_lights_3_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	if(finalColor.a < 0.5)
			discard;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	ps_proj_l3vertexcoord = proj_lights_3_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz += AddProjLight(proj_lights_3_origin, proj_lights_3_color, proj_lights_3_radius, ps_vertexpos, ps_proj_l3vertexcoord, proj_lights_3_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	finalColor.a = (finalColor.a - 0.5) / max(fwidth(finalColor.a), 0.0001) + 0.5;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_3_origin, point_lights_3_color, point_lights_3_radius, ps_vertexpos);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_3_origin, point_lights_3_color, point_lights_3_radius, ps_vertexpos);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	if(finalColor.a < 0.5)
			discard;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_3_origin, point_lights_3_color, point_lights_3_radius, ps_vertexpos);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	finalColor.a = (finalColor.a - 0.5) / max(fwidth(finalColor.a), 0.0001) + 0.5;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_3_origin, point_lights_3_color, point_lights_3_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_3_origin, point_lights_3_color, point_lights_3_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	if(finalColor.a < 0.5)
			discard;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_3_origin, point_lights_3_color, point_lights_3_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	finalColor.a = (finalColor.a - 0.5) / max(fwidth(finalColor.a), 0.0001) + 0.5;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_3_origin, point_lights_3_color, point_lights_3_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_3_origin, point_lights_3_color, point_lights_3_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	if(finalColor.a < 0.5)
			discard;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_3_origin, point_lights_3_color, point_lights_3_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	finalColor.a = (finalColor.a - 0.5) / max(fwidth(finalColor.a), 0.0001) + 0.5;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_3_origin, point_lights_3_color, point_lights_3_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_3_origin, point_lights_3_color, point_lights_3_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	if(finalColor.a < 0.5)
			discard;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_3_origin, point_lights_3_color, point_lights_3_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	finalColor.a = (finalColor.a - 0.5) / max(fwidth(finalColor.a), 0.0001) + 0.5;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	ps_proj_l3vertexcoord = proj_lights_3_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_3_origin, point_lights_3_color, point_lights_3_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz += AddProjLight(proj_lights_3_origin, proj_lights_3_color, proj_lights_3_radius, ps_vertexpos, ps_proj_l3vertexcoord, proj_lights_3_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	ps_proj_l3vertexcoord = proj_lights_3_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_3_origin, point_lights_3_color, point_lights_3_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz += AddProjLight(proj_lights_3_origin, proj_lights_3_color, proj_lights_3_radius, ps_vertexpos, ps_proj_l3vertexcoord, proj_lights_3_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	if(finalColor.a < 0.5)
			discard;
	oColor = finalColor;

}
#version 130

uniform mat4 projection;
uniform mat4 modelview;

uniform mat4 proj_lights_0_matrix;
uniform mat4 proj_lights_1_matrix;
uniform mat4 proj_lights_2_matrix;
uniform mat4 proj_lights_3_matrix;

in vec4 in_position;
in vec2 in_texcoord;
in vec4 in_color;

out vec4 ps_color;
out vec2 ps_texcoord;
out vec3 ps_vertexpos;
out vec4 ps_fragcoord;

out vec4 ps_proj_l0vertexcoord;
out vec4 ps_proj_l1vertexcoord;
out vec4 ps_proj_l2vertexcoord;
out vec4 ps_proj_l3vertexcoord;

void main()
{
	vec4 position = in_position*modelview;

	ps_vertexpos = position.xyz;
	ps_proj_l0vertexcoord = proj_lights_0_matrix * position;
		ps_vertexpos = position.xyz;
	ps_proj_l1vertexcoord = proj_lights_1_matrix * position;
	ps_proj_l2vertexcoord = proj_lights_2_matrix * position;
	ps_proj_l3vertexcoord = proj_lights_3_matrix * position;
	vec4 fragcoord = position*projection;
	ps_fragcoord = fragcoord;
	gl_Position = fragcoord;	
	
	ps_texcoord = in_texcoord;
	ps_vertexpos = position.xyz;
	
	ps_color = in_color;
}
#version 130
#extension GL_ARB_texture_rectangle : enable

uniform sampler2D texture0;
uniform sampler2D proj_lights_0_texture;
uniform sampler2D proj_lights_1_texture;
uniform sampler2D proj_lights_2_texture;
uniform sampler2D proj_lights_3_texture;

uniform sampler2DRect rtexture0;
uniform sampler2DRect rtexture1;

uniform vec3 point_lights_0_origin;
uniform vec3 point_lights_0_color;
uniform float point_lights_0_radius;

uniform vec3 point_lights_1_origin;
uniform vec3 point_lights_1_color;
uniform float point_lights_1_radius;

uniform vec3 point_lights_2_origin;
uniform vec3 point_lights_2_color;
uniform float point_lights_2_radius;

uniform vec3 point_lights_3_origin;
uniform vec3 point_lights_3_color;
uniform float point_lights_3_radius;

uniform vec3 proj_lights_0_origin;
uniform vec3 proj_lights_0_color;
uniform float proj_lights_0_radius;

uniform vec3 proj_lights_1_origin;
uniform vec3 proj_lights_1_color;
uniform float proj_lights_1_radius;

uniform vec3 proj_lights_2_origin;
uniform vec3 proj_lights_2_color;
uniform float proj_lights_2_radius;

uniform vec3 proj_lights_3_origin;
uniform vec3 proj_lights_3_color;
uniform float proj_lights_3_radius;

uniform vec2 fogparams;
uniform vec3 fogcolor;
uniform float overbright;
uniform vec2 scrsize;

in vec4 ps_color;
in vec2 ps_texcoord;
in vec3 ps_vertexpos;
in vec4 ps_fragcoord;

in vec4 ps_proj_l0vertexcoord;
in vec4 ps_proj_l1vertexcoord;
in vec4 ps_proj_l2vertexcoord;
in vec4 ps_proj_l3vertexcoord;

out vec4 oColor;

vec3 AddPointLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);
	return light_color*attn;
}

vec3 AddProjLight( vec3 light_origin, vec3 light_color, float light_radius, vec3 v_origin, vec4 vertexCoord, sampler2D texture )
{
	float rad = light_radius*light_radius;
	vec3 dir = light_origin-v_origin;
	float dist = dot(dir, dir);
	float attn = (dist/rad-1)*-1;
	attn = clamp(attn, 0.0, 1.0);

	vec4 texclamp = max(vertexCoord, 0);
	vec4 sample = textureProj(texture, texclamp);

	return light_color*attn*sample.xyz;
}

float SplineFraction( float value, float scale )
{
	float valueSquared;

	value = scale * value;
	valueSquared = value * value;

	// Nice little ease-in, ease-out spline-like curve
	return 3 * valueSquared - 2 * valueSquared * value;
}

void main()
{
	vec4 finalColor = ps_color;
	finalColor.xyz += AddPointLight(point_lights_0_origin, point_lights_0_color, point_lights_0_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_1_origin, point_lights_1_color, point_lights_1_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_2_origin, point_lights_2_color, point_lights_2_radius, ps_vertexpos);
	finalColor.xyz += AddPointLight(point_lights_3_origin, point_lights_3_color, point_lights_3_radius, ps_vertexpos);
	finalColor.xyz += AddProjLight(proj_lights_0_origin, proj_lights_0_color, proj_lights_0_radius, ps_vertexpos, ps_proj_l0vertexcoord, proj_lights_0_texture);
	finalColor.xyz += AddProjLight(proj_lights_1_origin, proj_lights_1_color, proj_lights_1_radius, ps_vertexpos, ps_proj_l1vertexcoord, proj_lights_1_texture);
	finalColor.xyz += AddProjLight(proj_lights_2_origin, proj_lights_2_color, proj_lights_2_radius, ps_vertexpos, ps_proj_l2vertexcoord, proj_lights_2_texture);
	finalColor.xyz += AddProjLight(proj_lights_3_origin, proj_lights_3_color, proj_lights_3_radius, ps_vertexpos, ps_proj_l3vertexcoord, proj_lights_3_texture);
	finalColor.xyz = clamp(finalColor.xyz, 0.0, 1.0);
		vec4 texturecolor = texture(texture0, ps_texcoord.xy);
		
		finalColor.xyz = finalColor.xyz*texturecolor.xyz*(1.0+overbright);
		finalColor.w = ps_color.w*texturecolor.w;
	float fogcoord = length(ps_vertexpos);
		
		float fogfactor = (fogparams.x - fogcoord)*fogparams.y;
		fogfactor = 1.0-SplineFraction(clamp(fogfactor, 0.0, 1.0), 1.0);
		
		finalColor.xyz = mix(finalColor.xyz, fogcolor, fogfactor);
	finalColor.a = (finalColor.a - 0.5) / max(fwidth(finalColor.a), 0.0001) + 0.5;
	oColor = finalColor;

}
fog                                �k
        num_point_lights                   m
        num_proj_lights                    Dn
        type                               to
        alphatest                          �p
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      