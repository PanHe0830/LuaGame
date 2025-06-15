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
        来试试以下输入吧：

        字母、数字、小键盘、方向键、鼠标
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

local function SetupAxisBindings()
    -- ProjectSettings -> Engine - Input -> Axis Mappings
    local axis_names = {
        "MoveForward", "MoveRight", "Turn", "LookUp", "LookUpRate", "TurnRate"
    }
    for _, axis_name in ipairs(axis_names) do
        M[axis_name] = function(self, value)
            if value ~= 0 then
                Screen.Print(string.format("%s(%f)", axis_name, value))
            end
        end
    end
end

SetupKeyBindings()
SetupAxisBindings()

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

local BindKey = UnLua.Input.BindKey

BindKey(M, "C", "Pressed", 
function(self, Key)
    Screen.Print(string.format("%s)", Key))
end
)

BindKey(M, "C", "Pressed", function(self, Key)
    Screen.Print("复制")
end, { Ctrl = true })

BindKey(M, "V", "Pressed", function(self, Key)
    Screen.Print("按下了V")
end)

BindKey(M, "V", "Pressed", function(self, Key)
    Screen.Print("粘贴")
end, { Ctrl = true })

return M