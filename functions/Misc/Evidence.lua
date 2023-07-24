Evidence = {}

local orbs = WS.Orbs
local fingerprint = WS.Fingerprints

orbs.ChildAdded:Connect(function(child)
    PutEvidence("Orbs")
end)

print("INIT: ORBS")

fingerprint.ChildAdded:Connect(function(child)
    PutEvidence("Fingerprints")
end)

print("INIT: FINGERPRINTS")

EquipmentPath.ChildAdded:Connect(function(new)
    if new.Name == "Book" then
        local book = EquipmentPath.Book

        local writingEvidence = book:GetAttributeChangedSignal("Written"):Connect(function()
            PutEvidence("Writing")
        end)
    elseif new.Name == "Spirit Box" then
        task.wait(1)
        local box = EquipmentPath['Spirit Box']

        box.Main.ChildAdded:Connect(function(i)
            if i:FindFirstChild(child.Name) then
                PutEvidence("Spirit Box")
            end
        end)
    end
end)

print("INIT: BOOK, SPIRIT BOX")

WS.ChildAdded:Connect(function(child)
    if child.Name == "emfpart5" then
        if not Char:FindFirstChild("Tool") then
            EquipItem("EMF Reader")
        else
            EquipItem("EMF Reader")
            task.wait(0.1)
            EquipItem("EMF Reader")
        end
        task.wait(1)
        local CurrentCFrame = Char.PrimaryPart.CFrame
        task.wait(0.1)
        Char:SetPrimaryPartCFrame(child.CFrame)
        task.wait(1)
        Char:SetPrimaryPartCFrame(CurrentCFrame)
        PutEvidence("EMF 5")
    end
end)

print("INIT: EMF")

local breath = Char.Head:WaitForChild("BreathAttachment").Breath

breath:GetPropertyChangedSignal("Enabled"):Connect(function()
    PutEvidence("Freezing Temperature")
end)

print("INIT: FREEZING")

local motion = WS.MotionGrids.ChildAdded:Connect(function(child)
    task.wait(0.1)
    for _, v in pairs(child:GetChildren()) do
        v:GetPropertyChangedSignal("BrickColor"):Connect(function()
            local min = 1
            local max = 4
            local num = min + (max - min) * math.random(0, 100000) / 100000
            local str = string.format("%.5f", num)

            task.wait(tonumber(str))
            local color = v.BrickColor.Color

            if color.r > color.g and color.r > color.b then
                PutEvidence("Motion")
            elseif color.b > color.g and color.b > color.r then
                print("   ---------   Paranormal Motion Not Found   ---------   ")
                motion:Disconnect()
            end
        end)
    end
end)

print("INIT: MOTION")

local evidenceModule = require(game:GetService("ReplicatedStorage").Evidences).Ghosts

local function deepCompare(t1, t2)
    local lookup_table = {}
    for i, v in ipairs(t1) do
        lookup_table[v] = true
    end
    for i, v in ipairs(t2) do
        if not lookup_table[v] then return false end
    end
    return true
end

function findMatch(evidence, v2)
    for ghost, evidences in pairs(v2) do
        if deepCompare(evidence, evidences) then
            return ghost
        end
    end
    return nil
end

