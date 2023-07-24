Evidence = {}

local orbs = WS.Orbs
local fingerprint = WS.Fingerprints
local breath = Char.Head.BreathAttachment.Breath

local orbEvidence = orbs.ChildAdded:Connect(function(child)
    if not table.find(Evidence, "Orbs") then
        table.insert(Evidence, "Orbs")
        PutEvidence("Orbs")
        orbEvidence:Disconnect()
    end
end)

local fingerprintEvidence = fingerprint.ChildAdded:Connect(function(child)
    if not table.find(Evidence, "Fingerprints") then
        table.insert(Evidence, "Fingerprints")
        PutEvidence("Fingerprints")
        fingerprintEvidence:Disconnect()
    end
end)

local freezingEvidence = breath:GetPropertyChangedSignal("Enabled"):Connect(function()
    if not table.find(Evidence, "Freezing Temperature") then
        table.insert(Evidence, "Freezing Temperature")
        PutEvidence("Freezing Temperature")
        freezingEvidence:Disconnect()
    end
end)

EquipmentPath.ChildAdded:Connect(function(child)
    if child.Name == "Book" then
        local book = EquipmentPath.Book

        local writingEvidence = book:GetAttributeChangedSignal("Written"):Connect(function()
            if not table.find(Evidence, "Writing") then
                table.insert(Evidence, "Writing")
                PutEvidence("Writing")
                writingEvidence:Disconnect()
            end
        end)
    end
end)

local emfEvidence = WS.ChildAdded:Connect(function(child)
    if child.Name == "emfpart5" then
        if not table.find(Evidence, "EMF 5") then
            EquipItem("EMF Reader")
            local CurrentCFrame = Char.PrimaryPart.CFrame
            task.wait(0.1)
            Char:SetPrimaryPartCFrame(child.CFrame)
            task.wait(0.1)
            Char:SetPrimaryPartCFrame(CurrentCFrame)
            table.insert(Evidence, "EMF 5")
            PutEvidence("EMF 5")
            emfEvidence:Disconnect()
        end
    end
end)

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
