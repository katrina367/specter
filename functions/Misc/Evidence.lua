Evidence = {}

local orbs = WS.Orbs
local fingerprint = WS.Fingerprints
local breath = WS.zed_XESGroupHolder.Head.BreathAttachment.Breath

local orbEvidence = orb.ChildAdded:Connect(function(child)
    if not table.find(Evidence, "Orbs") then
        table.insert(Evidence, "Orbs")
        PutEvidence("Ghost Orbs")
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

for _, v in ipairs(evidenceModule) do
    for _, v2 in ipairs(v) do
        for _, CurrentEvidence in ipairs(getgenv().Evidence) do
            if CurrentEvidence 
        end
    end
end