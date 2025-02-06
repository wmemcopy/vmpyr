local clonef = clonefunction and clonefunction or function(...) return ... end
local cloner = cloneref and cloneref or function(...) return ... end
local unpack = clonef(table.unpack)

local tween_service = cloner(game:GetService("TweenService"))

local instance = {}
instance.__index = instance

function instance.new(className, properties, parent)
    local self = setmetatable({}, instance)
    self.instance = cloner(Instance.new(className))
    if properties then
        instance.set(self, properties)
    end
    if parent then
        self.instance.Parent = parent
    end
    return self
end

function instance:child(className, properties)
    return instance.new(className, properties, self.instance)
end

function instance:set(properties)
    if self.instance and type(properties) == "table" then
        for k, v in pairs(properties) do
            self.instance[k] = v
        end
    end
end

function instance:tween(properties, info, play)
    if self.instance and typeof(info) == "TweenInfo" and type(properties) == "table" then
        local tween = tween_service:Create(self.instance, info, properties)
        if play then
            tween:Play()
        end
        return tween
    end
end

function instance:get(property)
    return self.instance and self.instance[property]
end

function instance:destroy()
    if self.instance then
        self.instance:Destroy()
        self.instance = nil
    end
end

function instance:raw()
    return self.instance
end

return instance