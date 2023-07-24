    Char = plr.Character

    ImportantGUIS = {}

    for _, v in plr.PlayerGui.Gui.Journal.Content.Evidence.EvidenceCheckboxes:GetChildren() do
        if v:IsA("Frame") then
            table.insert(ImportantGUIS, v)
        end
    end

    load("https://raw.githubusercontent.com/dazscripts/specter/main/functions/GameFunctions.lua")
    load("https://raw.githubusercontent.com/dazscripts/specter/main/functions/InGame/Extra/GameBegin.lua")
    load("https://raw.githubusercontent.com/dazscripts/specter/main/functions/Misc/Evidence.lua")
