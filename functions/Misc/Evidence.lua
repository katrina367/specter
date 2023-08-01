Char.ChildAdded:Connect(function(child)
    if child.Name == "Tool" then
        if plr:GetAttribute("Tool") == "EMF Reader" then
            child.Main:FindFirstChild("EMF 5").GetPropertyChangedSignal:Connect(function()
                PutEvidence("EMF 5")
            end)
        end
    end
end)


Evidence = {}

local orbs = WS.Orbs
local fingerprint = WS.Fingerprints
local breath = Char.Head:WaitForChild("BreathAttachment").Breath
local SpiritBox = events.SpiritBox

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
    end
end)
print("INIT: BOOK")

SpiritBox.OnClientEvent:Connect(function(...)
    PutEvidence("Spirit Box")
end)

print("INIT: SPIRIT BOX")

WS.ChildAdded:Connect(function(child)
    if child.Name == "emfpart5" then
        if not plr:GetAttribute("Tool") == "EMF Reader" then
            EquipItem("EMF Reader")
            task.wait(0.1)
            Toggle()
        else
            EquipItem("EMF Reader")
            task.wait(0.1)
            EquipItem("EMF Reader")
            task.wait(0.1)
            Toggle()
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
                AI_EVIDENCE.Motion = true
                task.wait(10)
                detected = false
            elseif color.b > color.g and color.b > color.r then
                if not detected then detected = true else return end
                print("   ---------   Paranormal Motion Not Found   ---------   ")
                AI_EVIDENCE.Motion = false
                task.wait(10)
                detected = false
            end
        end)
    end)
end)

print("INIT: MOTION")

-- // UNFINISHED \\ -- 

