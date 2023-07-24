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
        
    if Hunting then
        Char:SetPrimaryPartCFrame(WS.Van.Spawn.CFrame)
    else
        Char:SetPrimaryPartCFrame(WS.emfpart2.CFrame)
    end
end)

load("https://raw.githubusercontent.com/dazscripts/specter/main/functions/InGame/Extra/GameBegin.lua")


