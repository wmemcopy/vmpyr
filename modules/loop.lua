local loop = {}
loop.__index = loop

function loop.new(loopType, callback, interval)
    local self = setmetatable({}, loop)

    self.loopType = loopType
    self.callback = callback
    self.interval = interval or 1 -- Default interval for "wait" loop
    self.running = false
    self.connection = nil

    return self
end

function loop:stop() if self.running then self.running = false self.connection:Disconnect() end end
function loop:start()
    if self.running then return end
    self.running = true
    if self.loopType == "renderstepped" then
        self.connection = game:GetService("RunService").RenderStepped:Connect(function(...)
            if self.running then
                self.callback(...)
            end
        end)
    elseif self.loopType == "heartbeat" then
        self.connection = game:GetService("RunService").Heartbeat:Connect(function(...)
            if self.running then
                self.callback(...)
            end
        end)
    elseif self.loopType == "stepped" then
        self.connection = rbx:get("RunService").Stepped:Connect(function(...)
            if self.running then
                self.callback(...)
            end
        end)
    elseif self.loopType == "wait" then
        task.spawn(function()
            while true do
                if self.running then
                    self.callback()
                    wait(self.interval)
                end
            end
        end)
    end
end

return loop