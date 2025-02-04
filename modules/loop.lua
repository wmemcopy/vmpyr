local cloner = cloneref and cloneref or function(...) return ... end
local run_service = cloner(game:GetService("RunService"))

local loop = {}
loop.__index = loop

loop.new = function(loopType, callback, interval)
    local self = setmetatable({}, loop)

    self.loopType = loopType
    self.callback = callback
    self.interval = interval

    self.running = false
    self.connection = nil

    return self
end

function loop:stop()
    if self.running then
        self.running = false
        self.connection:Disconnect()
    end
end

function loop:start()
    if self.running then return end
    self.running = true
    if self.loopType == "renderstepped" then
        self.connection = run_service.RenderStepped:Connect(function(...)
            if self.running then
                self.callback(...)
            end
        end)
    elseif self.loopType == "heartbeat" then
        self.connection = run_service.Heartbeat:Connect(function(...)
            if self.running then
                self.callback(...)
            end
        end)
    elseif self.loopType == "stepped" then
        self.connection = run_service.Stepped:Connect(function(...)
            if self.running then
                self.callback(...)
            end
        end)
    elseif self.loopType == "wait" then
        task.spawn(function()
            while true do
                if self.running then
                    self.callback()
                    task.wait(self.interval)
                end
            end
        end)
    end
end

return loop