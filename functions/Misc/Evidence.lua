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
local SpiritBox = events:WaitForChild("SpiritBox")

orbs.ChildAdded:Connect(function(child)
    PutEvidence("Orbs")
end)

fingerprint.ChildAdded:Connect(function(child)
    PutEvidence("Fingerprints")
end)

EquipmentPath.ChildAdded:Connect(function(child)
    if child.Name == "Book" then
        local book = EquipmentPath.Book

        local writingEvidence = book:GetAttributeChangedSignal("Written"):Connect(function()
            PutEvidence("Writing")
        end)
    end
end)

WS.ChildAdded:Connect(function(child)
    if child.Name == "emfpart5" then
        PutEvidence("EMF 5")
        if not plr:GetAttribute("Tool") == "EMF Reader" then
            EquipItem("EMF Reader")
            task.wait(0.1)
            Toggle()
        end
        task.wait(0.3)
        local CurrentCFrame = Char.PrimaryPart.CFrame
        task.wait(0.1)
        Char:SetPrimaryPartCFrame(child.CFrame)
        task.wait(1)
        Char:SetPrimaryPartCFrame(CurrentCFrame)
    end
end)

breath:GetPropertyChangedSignal("Enabled"):Connect(function()
    PutEvidence("Freezing Temperature")
end)

local detected = false

local motion = WS.MotionGrids.ChildAdded:Connect(function(child)
    child.ChildAdded:Connect(function(GridBlock)
        GridBlock:GetPropertyChangedSignal("BrickColor"):Connect(function()
            local min = 0.01
            local max = 3
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
                Notification.new("error", "Paranormal Motion not found.", "", true, 1)
                task.wait(10)
                detected = false
            end
        end)
    end)
end)

SpiritBox.OnClientEvent:Connect(function()
    PutEvidence("Spirit Box")
end)

Notification.new("success", "Evidence Monitor", "Successfully loaded!", true, 3)