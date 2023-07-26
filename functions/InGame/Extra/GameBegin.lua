loadstring(game:HttpGet("https://raw.githubusercontent.com/dazscripts/specter/main/functions/GameFunctions.lua"))()
local info = TweenInfo.new(0, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)

local function NewTween(part)
    if Hunting then
        local tween = TweenService:Create(Char.PrimaryPart, info, {CFrame = part.CFrame})
        tween:Play()
        repeat task.wait() until not Hunting
    end
    local tween = TweenService:Create(Char.PrimaryPart, info, {CFrame = part.CFrame})
    tween:Play()
end

task.wait(1)

local Camera = Workspace.CurrentCamera

local VAN_BUTTON = WS.Van.Misc.VanButtonBase
local VAN_KEY = WS.Van.Key

Char:SetPrimaryPartCFrame(VAN_BUTTON.CFrame * CFrame.new(-3,0,0))

task.wait(0.1)

Camera.CFrame = CFrame.new(Camera.CFrame.Position, VAN_BUTTON.Position)

task.wait(0.2)

fireproximityprompt(WS.Van.Close.VanPrompt)

task.wait(1)

Char:SetPrimaryPartCFrame(VAN_KEY.CFrame * CFrame.new(0,0,3))

task.wait(1)

Camera.CFrame = CFrame.new(Camera.CFrame.Position, VAN_KEY.Position)

task.wait(1)

fireproximityprompt(VAN_KEY.KeyPrompt)

task.wait(0.1)

local Camera = Workspace.CurrentCamera

repeat
    coroutine.wrap(NewTween)(WS.Map.Bone)
    
    task.wait(0.2)
    
    for i = 1,5 do
        Camera.CFrame = CFrame.new(Camera.CFrame.Position, game:GetService("Workspace").Map.Bone.CFrame.Position)
        task.wait(0.2)
    end
    
    fireproximityprompt(game:GetService("Workspace").Map.Bone.BonePrompt)
until not WS.Map:FindFirstChild("Bone")

GetItem("Motion Sensor")
task.wait(0.1)
EquipItem("Motion Sensor")

loadstring(game:HttpGet("https://raw.githubusercontent.com/dazscripts/specter/main/functions/Misc/Evidence.lua"))()

task.wait(5)

Char:SetPrimaryPartCFrame(WS.Ghost.PrimaryPart.CFrame * CFrame.new(0,0,-3))

task.wait(0.05)

PlaceItem("Motion Sensor", false)

task.wait(1)

coroutine.wrap(NewTween)(WS.Map.TouchParts.Inside.Inside)

task.wait(0.5)

NewTween(WS.emfpart2)

EquipItem("Flashlight")
task.wait(0.1)
DropItem("Flashlight")

GetItem("EMF Reader")
GetItem("Spirit Box")
GetItem("Book")

EquipItem("Spirit Box")
task.wait(0.1)
Toggle()
task.wait(0.1)
DropItem("Spirit Box")

EquipItem("Book")
task.wait(0.1)
PlaceItem("Book",true)

task.wait(0.1)
--GetItem("Motion Sensor")
--GetItem("Crucifix")

coroutine.wrap(NewTween)(WS.Map.TouchParts.Inside.Inside)

task.wait(1)

coroutine.wrap(NewTween)(WS.emfpart2)

EquipItem("EMF Reader")
task.wait(0.2)
Toggle()

