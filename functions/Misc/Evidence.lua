Evidence = {}

local orbs = WS.Orbs
local fingerprint = WS.Fingerprints
local breath = WS.zed_XESGroupHolder.Head.BreathAttachment.Breath

local orbEvidence = orb.ChildAdded:Connect(function(child)
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
    if not table.find(Evidence, "Freezing") then
        table.insert(Evidence, "Freezing")
        PutEvidence("Freezing Temperature")
        freezingEvidence:Disconnect()
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
