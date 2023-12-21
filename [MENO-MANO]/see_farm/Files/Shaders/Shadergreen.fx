#include "mta-helper.fx"

sampler Sampler0 = sampler_state
{
    Texture = (gTexture0 );
};

float progress;
float rotten;

struct PSInput
{
    float4 Position : POSITION0;
    float4 Diffuse : COLOR0;
    float2 TexCoord : TEXCOORD0;
};

float4 PixelShaderFunction(PSInput PS) : COLOR0
{
    float4 texel = tex2D(Sampler0, PS.TexCoord);

    float4 finalColor = texel * PS.Diffuse;
   
    float4 newColor;

    newColor.r = finalColor.r * 0.00 * 0.3;
    newColor.g = finalColor.g * 1.00 * 0.3;
    newColor.b = finalColor.b * 0.00 * 0.3;
    newColor.a = finalColor.a;

    float4 newColor2;

    newColor2.r = finalColor.r * 1.00 * 0.3;
    newColor2.g = finalColor.g * 0.35 * 0.3;
    newColor2.b = finalColor.b * 0.10 * 0.3;
    newColor2.a = finalColor.a;


    return lerp(lerp(finalColor, newColor, progress), newColor2, rotten);
}

technique tec
{
    pass P0
    {
        PixelShader = compile ps_2_0 PixelShaderFunction();
    }
}
