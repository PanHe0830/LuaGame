local M = {}
M.__index = M

function M:new(name)
    local self = setmetatable({},M)
    self.name = name
    self.aaa = 10
    return self
end

function M:Break()
    print(self.name .. "says: Woof!" .. self.aaa)
end

Local myDog = M.new("Buddy")
myDog:Break()