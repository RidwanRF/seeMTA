CMasker = { }; 
CMasker.__index = CMasker; 
  
function CMasker: create( texture, mask ) 
    local cShader = {  
        shader = dxCreateShader( "Files/Shaders/Mask.fx" ), 
        texture = dxCreateTexture( texture, "argb", true, "clamp"), 
        maskTexture = dxCreateTexture( mask, "argb", true, "clamp"), 
    };

    dxSetShaderValue( cShader.shader, "ScreenTexture", cShader.texture ); 
    dxSetShaderValue( cShader.shader, "MaskTexture", cShader.maskTexture ); 
    self.__index = self; 
    setmetatable( cShader, self ); 
    return cShader; 
end 
  
  
function CMasker: draw( x, y, width, height ) 
    if self.shader then 
        dxDrawImage( x, y, width, height,  self.shader ); 
    end 
end 
  
  
function CMasker: destroy( ) 
    if self.shader then 
        destroyElement( self.shader ); 
    end 
    if self.texture then 
        destroyElement( self.texture ); 
    end 
    if self.maskTexture then 
        destroyElement( self.maskTexture ); 
    end 
end 