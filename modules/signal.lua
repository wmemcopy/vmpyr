local signal = {}
signal.__index = signal

function signal.new()
    local self = setmetatable({}, signal)
    self._connections = {}
    return self
end

function signal:connect(callback)
    local connection = { callback = callback; connected = true; }
    table.insert(self._connections, connection)
    return {
        disconnect = function()
            connection.connected = false
        end
    }
end

function signal:fire(...)
    for _, connection in ipairs(self._connections) do
        if connection.connected then
            connection.callback(...)
        end
    end
end

function signal:disconnectAll()
    for _, connection in ipairs(self._connections) do
        connection.connected = false
    end
    self._connections = {}
end

return signal
