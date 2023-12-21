#include "mta-helper.fx"

float morph = 0.0;
float size = 1.0;
texture gTexture;

struct VSInput
{
	float3 Position : POSITION0;
	float3 Normal : NORMAL0;
	float4 Diffuse : COLOR0;
	float2 TexCoord : TEXCOORD0;
};

struct PSInput
{
	float4 Position : POSITION0;
	float4 Diffuse : COLOR0;
	float2 TexCoord : TEXCOORD0;
};

PSInput VertexShaderFunction(VSInput VS)
{
	PSInput PS = (PSInput)0;

	VS.Position += VS.Normal * morph;
	VS.Position = VS.Position * size;
	VS.Position.z += size - 1;

	PS.Position = MTACalcScreenPosition(VS.Position);
	PS.TexCoord = VS.TexCoord;
	PS.Diffuse = MTACalcGTABuildingDiffuse(VS.Diffuse);

	return PS;
}

technique Technique1
{
	pass Pass1
	{
		VertexShader = compile vs_2_0 VertexShaderFunction();
		Texture[0] = gTexture;
	}
}

technique Technique2
{
	pass Pass1 {
		// Fallback
	}
}
