--[[
    888     888                  888                      
    888     888                  888                      
    888     888                  888                      
    Y88b   d88P  .d88b.  888d888 888888  .d88b.  888  888 
     Y88b d88P  d88""88b 888P"   888    d8P  Y8b `Y8bd8P' 
      Y88o88P   888  888 888     888    88888888   X88K   
       Y888P    Y88..88P 888     Y88b.  Y8b.     .d8""8b. 
        Y8P      "Y88P"  888      "Y888  "Y8888  888  888 

    Devforum Post:
	Github: https://github.com/monke-mob/vortex
]]

--[[
    @title vortex
    @author Lanred
    @version 1.0.0
]]

local ServerScriptService = game:GetService("ServerScriptService")

local server = script.server

local vortex = {}
vortex.version = "1.0.0"

function vortex:_load()
    server.Parent = ServerScriptService
    vortex:_loadExtensions()
end

function vortex:_loadExtensions(extensions)

end

return vortex