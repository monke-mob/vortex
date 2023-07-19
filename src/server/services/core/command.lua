--[[
    @title services/command
    @author Lanred
    @version 1.0.0
]]

local parser = require(script.Parent.Parent.Parent.modules.parser)

--[[
    Handles executing commands.

    @service
]]

local service = {}
service._commands = {}

-- The `_commandPointers` variable helps to reduce
-- memory cost by having the name and aliases point
-- to a index in the `_commands` variable.
service._commandPointers = {}

-- Registers a command.
-- @private
-- @returns never
function service._register(module)
	local command = require(module)
	table.insert(service._commands, command)

	local commandPointer = table.find(service._commands, command)
	service._commandPointers[command.name] = commandPointer

	for _index: number, alias: string in pairs(command.aliases) do
		service._commandPointers[alias] = commandPointer
	end
end

-- Processes a player message to execute a command.
-- @private
-- @param {Player} player [The player who executed the command.]
-- @param {string} message [The message to process.]
-- @returns never
function service._process(player: Player, message: string)
	local split: { string } = message:split(" ")
	local commandWithPrefix: string = split[1]
	local commandName: string = commandWithPrefix:split("")[2]
	local commandPointer: number = service._commandPointers[commandName]
	-- TODO: Create a command type.
	local command = service._commands[commandPointer]

	if command ~= nil then
		-- TODO: Create a parameters type.
		local parameters: { any } = parser.parameters(message:split(commandWithPrefix)[2])
	end
end

return service
