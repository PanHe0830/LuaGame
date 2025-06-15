--
-- DESCRIPTION
--
-- @COMPANY **
-- @AUTHOR **
-- @DATE ${date} ${time}
--

---@type BP_ThirdPersonCharacter_C
local M = UnLua.Class()
local Screen = require "Screen"
-- function M:Initialize(Initializer)
-- end

-- function M:UserConstructionScript()
-- end

-- function M:ReceiveBeginPlay()
-- end

function M:ReceiveBeginPlay()
    local msg = [[
        C++ 调用 Lua 实例
    ]]
    Screen.Print(msg)
    UE.UScriptBlueprintFunctionLibrary.CallLuaByGlobalTable()
    Screen.Print("=================")
    UE.UScriptBlueprintFunctionLibrary.CallLuaByFLuaTable()

end

function M.CallMe(a, b)
    local ret = a + b
    local msg = string.format("[Lua]收到来自C++的调用,a=%f b=%f,返回%f", a, b, ret)
    Screen.Print(msg)
    return ret
end

-- function M:ReceiveEndPlay()
-- end

-- function M:ReceiveTick(DeltaSeconds)
-- end

-- function M:ReceiveAnyDamage(Damage, DamageType, InstigatedBy, DamageCauser)
-- end

-- function M:ReceiveActorBeginOverlap(OtherActor)
-- end

-- function M:ReceiveActorEndOverlap(OtherActor)
-- end

return M