#include "mta-helper.fx"

sampler Sampler0 = sampler_state
{
    Texture = (gTexture0 );
};

float progress;

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

    newColor.r = finalColor.r * 1.00 * 0.3;
    newColor.g = finalColor.g * 0.35 * 0.3;
    newColor.b = finalColor.b * 0.10 * 0.3;
    newColor.a = finalColor.a;

    return lerp(finalColor, newColor, progress);
}

technique tec
{
    pass P0
    {
        PixelShader = compile ps_2_0 PixelShaderFunction();
    }
}
