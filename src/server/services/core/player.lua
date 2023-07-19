--[[
    @title services/player
    @author Lanred
    @version 1.0.0
]]

local Players = game:GetService("Players")

local commandService = require(script.Parent.command)

--[[
    Handles the players.

    @service
]]

local service = {}

-- Starts the event listeners.
-- @private
-- @returns never
function service._start()
	Players.PlayerAdded:Connect(service._playerAdded)
end

-- Handles a player.
-- @private
-- @param {Player} player [The player.]
-- @returns never
function service._playerAdded(player: Player)
	player.Chatted:Connect(function(message: string, recipient: Player?)
		if recipient ~= nil then
			return
		end

		commandService._process(player, message)
	end)
end

return service
