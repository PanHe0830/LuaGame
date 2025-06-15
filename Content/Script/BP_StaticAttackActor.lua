--
-- DESCRIPTION
--
-- @COMPANY **
-- @AUTHOR **
-- @DATE ${date} ${time}
--

---@type BP_StaticAttackActor_C
local M = UnLua.Class()

local LocalPrint = {}
local PrintString = UE.UKismetSystemLibrary.PrintString

function LocalPrint.Print(text, color, duration)
    color = color or UE.FLinearColor(1, 1, 1, 1)
    duration = duration or 100
    PrintString(nil, text, true, false, color, duration)
end

-- function M:Initialize(Initializer)
-- end
function M:Initialize(Initializer)
    local msg = [[
        Hello World!
    ]]
    LocalPrint.Print(msg)
end

-- function M:UserConstructionScript()
-- end

-- function M:ReceiveBeginPlay()
-- end

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
