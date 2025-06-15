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
        玩家移动
    ]]
    --local PlayerController = UE.UGameplayStatics.GetPlayerController(self, 0)
    --self:EnableInput(PlayerController);
    Screen.Print(msg);

    if self.SetupPlayerInputComponent then
        self:SetupPlayerInputComponent(self.InputComponent)
    end
end

function M:ReceivePossessed(NewController)
    Screen.Print("✅ 被 Possess 了，输入系统会自动启动")
end

function M:SetupPlayerInputComponent(InputComponent)
    Screen.Print("SetupPlayerInputComponent")

    print("SetupPlayerInputComponent called, InputComponent =", InputComponent)
    local EInputEvent = UE.EInputEvent
    print("EInputEvent =", EInputEvent)

    if not InputComponent then
        print("Error: InputComponent is nil!")
        --return
    end

    if not InputComponent.BindAction then
        print("Error: InputComponent.BindAction is nil!")
        --return
    end
    
    --local EInputEvent = UE.EInputEvent
    --InputComponent:BindAction("Jump", EInputEvent.IE_Pressed, self, self.Jump)

    print("SetupPlayerInputComponent called")
    

    --local ETriggerEvent = UE.ETriggerEvent

    --InputComponent:BindAction(Jump, ETriggerEvent.Triggered, self, self.Jump)

     -- 强制转换为 UEnhancedInputComponent
    local EnhancedInputComponent = InputComponent:Cast(UE.UEnhancedInputComponent.StaticClass())

    if not EnhancedInputComponent then
        print("EnhancedInputComponent 转换失败！")
        return
    end

    local ETriggerEvent = UE.ETriggerEvent
    
    local Jump = self.JumpAction
    if Jump == nil then
        print("Error: JumpAction not found!")
        --return
    end
    -- 使用增强输入方式绑定
    --EnhancedInputComponent:BindAction(Jump, ETriggerEvent.Triggered, self, self.Jump)

    InputComponent:BindAxis("MoveForward", self, self.MoveForward)
    InputComponent:BindAxis("MoveRight", self, self.MoveRight)
    InputComponent:BindAxis("LookUp", self, self.LookUp)
    InputComponent:BindAxis("Turn", self, self.Turn)
end

function M:MoveForward(value)
    if value == 0 
        then 
            return 
    end

    local Controller = self:GetController()
    if Controller then
        local Rotation = Controller:GetControlRotation()
        local YawRotation = UE.FRotator(0, Rotation.Yaw, 0)

        local Forward = YawRotation:ToQuat():GetForwardVector()
        self:AddMovementInput(Forward, value)
        --Screen.Print("MoveForward")
    end
end

function M:MoveRight(value)
    if value == 0 
        then 
            return 
    end

    local Controller = self:GetController()
    if Controller then
        local Rotation = Controller:GetControlRotation()
        local YawRotation = UE.FRotator(0, Rotation.Yaw, 0)

        local Right = YawRotation:ToQuat():GetRightVector()
        self:AddMovementInput(Right, value)
        --Screen.Print("MoveRight")
    end
end

function M:LookUp(Value)
    if Value == 0 then
        return
    end
    
    self:AddControllerPitchInput(-Value)
end

function M:Turn(Value)
    if Value == 0 then
        return
    end
    
    self:AddControllerYawInput(Value)
end

function M:Jump()
    print("Jump pressed")
    self:Jump()
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