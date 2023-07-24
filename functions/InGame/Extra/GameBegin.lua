loadstring(game:HttpGet("https://raw.githubusercontent.com/dazscripts/specter/main/functions/GameFunctions.lua"))()

local function NewTween(part)
    local info = TweenInfo.new(0, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
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

task.wait(1)

coroutine.wrap(NewTween)(WS.Map.TouchParts.Inside.Inside)

task.wait(0.2)

NewTween(WS.emfpart2)

loadstring(game:HttpGet("https://raw.githubusercontent.com/dazscripts/specter/main/functions/Misc/Evidence.lua"))()

task.wait(5)

EquipItem("Flashlight")
task.wait(0.1)
DropItem("Flashlight")

GetItem("EMF Reader")
GetItem("Spirit Box")
GetItem("Book")

EquipItem("Spirit Box")
task.wait(0.2)
Toggle()
task.wait(0.2)
DropItem("Spirit Box")

EquipItem("Book")
task.wait(0.2)
DropItem("Book")

task.wait(0.2)
GetItem("Motion Sensor")
GetItem("Crucifix")

EquipItem("EMF Reader")
task.wait(0.2)
Toggle()

coroutine.wrap(NewTween)(WS.Map.TouchParts.Inside.Inside)

task.wait(1)

coroutine.wrap(NewTween)(WS.emfpart2)

while true do
    coroutine.wrap(SendChatMessage)()
    task.wait(5)
end