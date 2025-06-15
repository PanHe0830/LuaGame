--
-- DESCRIPTION
--
-- @COMPANY **
-- @AUTHOR **
-- @DATE ${date} ${time}
--

---@type BP_BluePrintEventActor_C
local M = UnLua.Class()
--local Screen = require "Screen"

local LocalPrint = {}
local PrintString = UE.UKismetSystemLibrary.PrintString

function LocalPrint.Print(text, color, duration)
    if not text then
        text = "<nil>" -- 避免传nil报错
    end

    color = color or UE.FLinearColor(1, 1, 1, 1)
    duration = duration or 3.0

    PrintString(self, text, true, false, color, duration)
end

-- function M:Initialize(Initializer)
-- end

-- function M:UserConstructionScript()
-- end

-- function M:ReceiveBeginPlay()
-- end
function M:ReceiveBeginPlay()
    local msg = self:SayHi("陌生人")
    LocalPrint.Print(msg);
end

function M:SayHi(name)
    local origin = self.Overridden.SayHi(self,name);
    if not origin then
       origin = "Origin is not value" 
    end

    return origin ..[[
        这是 ReceiveBeginPlay 函数的蓝图时间覆盖
    ]]
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
