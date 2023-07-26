Evidence = {}

local orbs = WS.Orbs
local fingerprint = WS.Fingerprints
local breath = Char.Head:WaitForChild("BreathAttachment").Breath

orbs.ChildAdded:Connect(function(child)
    PutEvidence("Orbs")
end)

print("INIT: ORBS")

fingerprint.ChildAdded:Connect(function(child)
    PutEvidence("Fingerprints")
end)

print("INIT: FINGERPRINTS")

EquipmentPath.ChildAdded:Connect(function(child)
    if child.Name == "Book" then
        local book = EquipmentPath.Book

        local writingEvidence = book:GetAttributeChangedSignal("Written"):Connect(function()
            PutEvidence("Writing")
        end)
    elseif child.Name == "Spirit Box" then
        task.wait(1)
        local box = EquipmentPath:FindFirstChild("Spirit Box")

        box.Main.ChildAdded:Connect(function(child2)
            if box.Main.Responses:FindFirstChild(child2.Name) or child2.Name == "Template" then
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


breath:GetPropertyChangedSignal("Enabled"):Connect(function()
    PutEvidence("Freezing Temperature")
end)

print("INIT: FREEZING")

local detected = false

local motion = WS.MotionGrids.ChildAdded:Connect(function(child)
    child.ChildAdded:Connect(function(GridBlock)
        GridBlock:GetPropertyChangedSignal("BrickColor"):Connect(function()
            local min = 1
            local max = 4
            local num = min + (max - min) * math.random(0, 100000) / 100000
            local str = string.format("%.5f", num)

            task.wait(tonumber(str))
            local color = GridBlock.BrickColor.Color

            if color.r > color.g and color.r > color.b then
                if not detected then detected = true else return end
                PutEvidence("Motion")
                task.wait(10)
                detected = false
            elseif color.b > color.g and color.b > color.r then
                if not detected then detected = true else return end
                print("   ---------   Paranormal Motion Not Found   ---------   ")
                task.wait(10)
                detected = false
            end
        end)
    end)
end)

print("INIT: MOTION")

-- // UNFINISHED \\ -- 

local function deepCompare(t1, t2)
    local lookup_table = {}
    for _, v in pairs(t1) do
        lookup_table[v] = true
    end
    for _, v in pairs(t2) do
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

local evidenceModule = require(game:GetService("ReplicatedStorage").Evidences)
local TotalEvidence = evidenceModule.Evidences
local Ghosts = evidenceModule.Ghosts

local collectedEvidence = {}
for evidence, found in pairs(AI_EVIDENCE) do
    if found == true then
        table.insert(collectedEvidence, evidence)
    end
end

local potentialGhosts = {}
for ghost, evidences in pairs(Ghosts) do
    local match = true
    for _, evidence in pairs(collectedEvidence) do
        if not table.find(evidences, evidence) then
            match = false
            break
        end
    end
    if match then
        for evidence, found in pairs(AI_EVIDENCE) do
            if found == false and table.find(evidences, evidence) then
                match = false
                break
            end
        end
    end
    if match then
        table.insert(potentialGhosts, ghost)
    end
end

print("Potential Ghosts: ")
for _, ghost in pairs(potentialGhosts) do
    print(ghost)
end

if #potentialGhosts == 1 then
    print("The ghost is: " .. potentialGhosts[1])
elseif #collectedEvidence == 3 then
    local foundGhost = findMatch(collectedEvidence, Ghosts)
    if foundGhost then
        print("The ghost is: " .. foundGhost)
    else
        print("No matching ghost found.")
    end
end