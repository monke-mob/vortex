--[[
	@title parser/parameters
	@author Lanred
	@version 1.0.0
]]

type parameterValue = "string" | "number" | "boolean"

-- Turns a string into a boolean.
-- @param {string} word [The word to parse.]
-- @returns boolean?
local function parseBoolean(word: string): boolean?
    if word == "true" then
        return true
    elseif word == "false" then
        return false
    end

    return nil
end

-- @param {string} message [The message containing the parameters.]
-- @returns any
return function(message: string, parameters)
    local messageSplit: { string } = message:split(" ")
    local parsedParameters = {}

    -- TODO: Give the value a type.
    for index: string, value: parameterValue in pairs(parameters) do
        if value == "string" then
            
        elseif value == "number" then
            local number: number? = tonumber(messageSplit[1])

            if number ~= nil then
                parsedParameters[index] = number
            end
        elseif value == "boolean" then
            parsedParameters[index] = parseBoolean(messageSplit[1])
        end
    end

    return parsedParameters
end

-- GN