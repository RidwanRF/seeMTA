local ShaderTable = {}
local Direction = false

function dxDrawRoundedCircle(PosX, PosY, SizeX, SizeY, OutsideRadius, InsideRadius, Angle, Color, Texture, Name)
	if not ShaderTable[Name] then
		ShaderTable[Name] = dxCreateShader("Files/Shaders/Circle.fx")

		dxSetShaderValue(ShaderTable[Name], "colorOverwritten", true)

		if isElement(Texture) then
			dxSetShaderValue(ShaderTable[Name], "textureLoad", true)
			dxSetShaderValue(ShaderTable[Name], "sourceTexture", Texture)
			dgsSetData(ShaderTable[Name], "sourceTexture", Texture)
		else
			dxSetShaderValue(ShaderTable[Name], "textureLoad", false)
			dxSetShaderValue(ShaderTable[Name], "sourceTexture", 0)
			dgsSetData(ShaderTable[Name], "sourceTexture", nil)
		end
	end

	dxSetShaderValue(ShaderTable[Name], "outsideRadius", OutsideRadius or 0.3)
	dxSetShaderValue(ShaderTable[Name], "insideRadius", InsideRadius or 0)

	dxSetShaderValue(ShaderTable[Name], "angle", (Angle or 360) / 180 * math.pi)
	dxSetShaderValue(ShaderTable[Name], "color", fromcolor(Color or tocolor(255, 255, 255, 255), true))

	dxSetShaderValue(ShaderTable[Name], "direction", Direction and 1 or 0)

	dxDrawImage(PosX, PosY, SizeX, SizeY, ShaderTable[Name])
end
