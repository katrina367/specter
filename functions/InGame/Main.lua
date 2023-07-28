Char = plr.Character
Hunting = false

ImportantGUIS = {}

AI_EVIDENCE = {
    ['Freezing Temperature'] = false,
    ['EMF 5'] = "Unknown",
    ['Writing'] = "Unknown",
    ['Fingerprints'] = "Unknown",
    ['Spirit Box'] = false,
    ['Orbs'] = "Unknown",
    ['Motion'] = false,
}

for _, v in plr.PlayerGui.Gui.Journal.Content.Evidence.EvidenceCheckboxes:GetChildren() do
    if v:IsA("Frame") then
        table.insert(ImportantGUIS, v)
    end
end

local function Defense()
    GetItem("Crucifix")
    task.wait(0.1)
    EquipItem("Crucifix")
    task.wait(0.1)
    PlaceItem("Crucifix", true)
end

events.Hunt.OnClientEvent:Connect(function()
    Hunting = not Hunting

    if Hunting then
        repeat 
            task.wait() 
        until (Char.PrimaryPart.Position - WS.Ghost.PrimaryPart.Position).Magnitude < 10 or not Hunting
        
        if not Hunting then return end
        
        if EquipmentPath:FindFirstChild("Crucifix") then
            coroutine.wrap(Defense)()
        end
        
        repeat 
            Char:SetPrimaryPartCFrame(WS.Ghost.PrimaryPart.CFrame * CFrame.new(0,8,0)) 
            task.wait() 
        until not Hunting
    else
        task.wait(0.3)
        Char:SetPrimaryPartCFrame(WS.emfpart2.CFrame)
    end
end)

local TSC = game:GetService("TextChatService")
local Channel = TSC.TextChannels.RBXGeneral

task.spawn(function()
    while true do
        Channel:SendAsync("Where are you? Are you here? How old are you? Can you write in the book? Can you leave a fingerprint? Are you there? Are you a boy? Are you a girl? Anyone here? Can you turn on the lights?")
        task.wait(5)
    end
end)

loadstring(game:HttpGet("https://raw.githubusercontent.com/dazscripts/specter/main/functions/InGame/Extra/GameBegin.lua"))()


