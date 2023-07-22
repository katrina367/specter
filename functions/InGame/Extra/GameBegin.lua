EquipItem("Flashlight")
task.wait(0.1)
DropItem("Flashlight")

GetItem("EMF Reader")
GetItem("Spirit Box")
GetItem("Book")

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
EquipItem("EMF Reader")
task.wait(0.2)
Toggle()

TeleportToGhostRoom()

EquipItem("Spirit Box")
task.wait(0.2)
Toggle()
task.wait(0.2)
DropItem("Spirit Box")

EquipItem("Book")
task.wait(0.2)
DropItem("Book")

for i = 1,3 do
    SendChatMessage()
    task.wait(1)
end