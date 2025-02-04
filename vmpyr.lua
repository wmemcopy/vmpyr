--[[

        vmpyr.vip

        with 💖 by marshall

        sophia is cute asf
]]

-- dummy functions
local retself = function(...) return ... end
local retnil = function(...) return nil end

-- call protection
local x = {}

local clonef = clonefunction and clonefunction or retself
local cloner = cloneref and cloneref or retself
setmetatable(x, {
    __index = function(self, index)
        if typeof(index) == "function" then
            return clonef(index)
        end
    end
})

local vmpyr = {

    version = "1.00b";
    revision = "preview";
    executor = identifyexecutor and identifyexecutor() or "unknown";

    debug = true;

    url = "https://raw.githubusercontent.com/marshall-1337/vmpyr/refs/heads/main/modules/%s.lua";
}
