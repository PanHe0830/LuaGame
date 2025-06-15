--
-- DESCRIPTION
--
-- @COMPANY **
-- @AUTHOR **
-- @DATE ${date} ${time}
--

local Screen = require "Screen"

---@type BP_DynamicBindActor_C
local M = UnLua.Class()

-- function M:Initialize(Initializer)
-- end

-- function M:UserConstructionScript()
-- end

-- function M:ReceiveBeginPlay()
-- end

function M:ReceiveBeginPlay()
    local msg = [[
        鼠标左键：创建动态绑定的 Actor

        鼠标右键：创建动态绑定的 Object
    ]]

    Screen.Print(msg);
end

local function SetupKeyBindings()
    local key_names = {
        -- 字母
        "A", "B", --[["C",]] "D", "E","F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", --[["V", ]] "W", "X", "Y", "Z",
        -- 数字
        "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine",
        -- 小键盘
        "NumPadOne", "NumPadTwo", "NumPadThree", "NumPadFour", "NumPadFive", "NumPadSix", "NumPadSeven", "NumPadEight", "NumPadNine",
        -- 方向键
        "Up", "Down", "Left", "Right",
        -- ProjectSettings -> Engine - Input -> Action Mappings
        "Fire", "Aim",
    }
    
    for _, key_name in ipairs(key_names) do
        M[key_name .. "_Pressed"] = function(self, key)
            Screen.Print(string.format("按下了%s", key.KeyName))
        end
    end
end

SetupKeyBindings()


function M:LeftMouseButton_Pressed()
    local World = self:GetWorld()
    local SpawnClass = self.SpawnClass
    local Transform = self.SpawnPointActor
    local AlwaysSpawn = UE.ESpawnActorCollisionHandlingMethod.AlwaysSpawn
    local Actor = World:SpawnActor(SpawnClass, Transform, AlwaysSpawn, self, self, "GravitySphereActor")

    Screen.Print(Actor.X);
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
