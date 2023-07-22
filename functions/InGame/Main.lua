Char = plr.Character

loadstring(game:HttpGet("https://raw.githubusercontent.com/dazscripts/specter/main/functions/GameFunctions.lua"))()

EquipItem("Flashlight")
task.wait(0.2)
DropItem("Flashlight")

GetItem("EMF Reader")
GetItem("Spirit Box")
GetItem("Book")

local Camera = Workspace.CurrentCamera

local VAN_BUTTON = WS.Van.Misc.VanButtonBase
Char:SetPrimaryPartCFrame(VAN_BUTTON.CFrame * CFrame.new(-3,0,0))

task.wait(1)

Camera.CFrame = CFrame.new(Camera.CFrame.Position, VAN_BUTTON.Position)

task.wait(0.2)

fireproximityprompt(WS.Van.Close.VanPrompt)

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