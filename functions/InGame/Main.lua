Char = plr.Character

ImportantGUIS = {}

for _, v in plr.PlayerGui.Gui.Journal.Content.Evidence.EvidenceCheckboxes:GetChildren() do
    if v:IsA("Frame") then
        table.insert(ImportantGUIS, v)
    end
end

function NewTween(part)
    local info = TweenInfo.new(0, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
    local tween = TweenService:Create(Char.PrimaryPart, info, {CFrame = part.CFrame})
    tween:Play()
end

load("https://raw.githubusercontent.com/dazscripts/specter/main/functions/InGame/Extra/GameBegin.lua")