Char = plr.Character
Hunting = false
ImportantGUIS = {}

for _, v in plr.PlayerGui.Gui.Journal.Content.Evidence.EvidenceCheckboxes:GetChildren() do
    if v:IsA("Frame") then
        table.insert(ImportantGUIS, v)
    end
end

events.Hunt.OnClientEvent:Connect(function()
    Hunting = not Hunting
    task.wait(0.3)
    
    Char:SetPrimaryPartCFrame(game:GetService("Workspace").Van.Spawn.CFrame)
end)

load("https://raw.githubusercontent.com/dazscripts/specter/main/functions/InGame/Extra/GameBegin.lua")


