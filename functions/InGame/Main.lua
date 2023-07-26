Char = plr.Character
Hunting = false

ImportantGUIS = {}

AI_EVIDENCE = {
    ['Freezing Temperature'] = {
        Found = false,
        Ghosts = {"Demon", "Mare", "Upyr", "Phantom", "Yurei", "Banshee", "Wendigo", "Thaye", "Afarit", "Yokai"}   
    },
    ['EMF 5'] = {
        Found = "Unknown",
        Ghosts = {"Banshee", "Phantom", "Jinn", "Revenant", "Upyr", "Shade", "Aswang", "O Tokata", "Myling", "Preta", "Wraith"}
    },
    ['Writing'] = {
        Found = "Unknown",
        Ghosts = {"Demon", "Spirit", "Revenant", "Yurei", "Oni", "Egui", "Shade", "Wisp", "Douen", "Wraith"}
    },
    ['Fingerprints'] = {
        Found = "Unknown",
        Ghosts = {"Banshee", "Spirit", "Poltergeist", "Revenant", "Wisp", "Aswang", "Thaye", "O Tokata", "Douen", "Preta", "Yokai"}
    },
    ['Spirit Box'] = {
        Found = true,
        Ghosts = {"Demon", "Mare", "Wendigo", "Spirit", "Poltergeist", "Oni", "Egui", "Aswang", "Myling"}
    },
    ['Orbs'] = {
        Found = true,
        Ghosts = {"Mare", "Poltergeist", "Phantom", "Jinn", "Shade", "Yurei", "Egui", "Wisp", "Thaye", "O Tokata", "Afarit"}
    },
    ['Motion'] = {
        Found = false,
        Ghosts = {"Myling", "Afarit", "Jinn", "Wendigo", "Oni", "Upyr", "Douen", "Preta", "Yokai", "Wraith"}
    }
}

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

local TSC = game:GetService("TextChatService")
local Channel = TSC.TextChannels.RBXGeneral

task.spawn(function()
    while true do
        repeat task.wait(0.1) until not Hunting
        Channel:SendAsync("Where are you? Are you here? How old are you? Can you write in the book? Can you leave a fingerprint? Are you there? Are you a boy? Are you a girl? Anyone here? Can you turn on the lights?")
        print("Send Chat Message")
        task.wait(5)
    end
end)

load("https://raw.githubusercontent.com/dazscripts/specter/main/functions/InGame/Extra/GameBegin.lua")


