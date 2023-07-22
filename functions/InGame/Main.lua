Char = plr.Character

loadstring(game:HttpGet("https://raw.githubusercontent.com/dazscripts/specter/main/functions/GameFunctions.lua"))()

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