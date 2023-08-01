return {"EMF Reader", "Spirit Box", "Book", "Motion Sensor", "Thermometer", "Ghost Goggles", "Crucifix", "Camera"}

--[[
local door = game:GetService("Workspace").Map.Doors:GetChildren()[3]


if door:GetAttribute("Open") == true then
    args = {
        [1]
        [2]
    }

end
firesignal(game:GetService("ReplicatedStorage").Events.Door.OnClientEvent,unpack({door, CFrame.new(1130.64966, 4.85004902, -892.499512, 0, 0, 1, 0, 1, 0, -1, 0, 0)}))

local a = game:GetService("Workspace").Map.Lightswitches:GetChildren()

for _, v in pairs(a) do
    if v:GetAttribute("On") == true then
        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Lightswitch"):FireServer(v)
        task.wait()
    end
end
]]