local ShaderTable = {}
local colorOverwritten = false

function dxDrawRoundedRectangle(PosX, PosY, SizeX, SizeY, Radius, Color, Name, Texture)
	if not ShaderTable[Name] then
		ShaderTable[Name] = dxCreateShader("Files/Shaders/RoundedRectangle.fx")
	end

	SetRadius(ShaderTable[Name], Radius, false)
	SetBorderThickness(ShaderTable[Name], 0, 0)
	SetColor(ShaderTable[Name], Color, Color)

	SetColorOverwritten(ShaderTable[Name], colorOverwritten ~= false)
	SetTexture(ShaderTable[Name], false)

	dxDrawImage(PosX, PosY, SizeX, SizeY, ShaderTable[Name], 0, 0, 0, Color)
end

function SetRadius(Shader, Radius, Relative)
	local Relative = Relative ~= false

	dxSetShaderValue(Shader, "radius", {Radius, Radius, Radius, Radius})
	dxSetShaderValue(Shader, "isRelative", {Relative and 1 or 0, Relative and 1 or 0, Relative and 1 or 0, Relative and 1 or 0})
end

function SetColorOverwritten(Shader, Color)
	dxSetShaderValue(Shader, "colorOverwritten", Color)
end

function SetBorderThickness(Shader, Horizontal, Vertical)
	dxSetShaderValue(Shader, "borderThickness", {Horizontal, Vertical})
end

function SetColor(Shader, Color, SecondColor)
	dxSetShaderValue(Shader, "borderColor", fromcolor(SecondColor,true))
	dxSetShaderValue(Shader, "color", fromcolor(Color,true))
end

function SetTexture(Shader, Radius, Relative)
	dxSetShaderValue(Shader, "textureLoad", false)
	dxSetShaderValue(Shader, "sourceTexture", 0)
end

function fromcolor(color,relative)
	local b = color%256
	color = (color-b)/256
	local g = color%256
	color = (color-g)/256
	local r = color%256
	color = (color-r)/256
	local a = color%256
	if relative then
		return r/255,g/255,b/255,a/255
	end
	return r,g,b,a
end