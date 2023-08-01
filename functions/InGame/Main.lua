Char = plr.Character
Hunting = false

ImportantGUIS = {}

AI_EVIDENCE = {
    ['Freezing Temperature'] = false,
    ['EMF 5'] = "Unknown",
    ['Writing'] = "Unknown",
    ['Fingerprints'] = "Unknown",
    ['Spirit Box'] = false,
    ['Orbs'] = "Unknown",
    ['Motion'] = false,
}

for _, v in plr.PlayerGui.Gui.Journal.Content.Evidence.EvidenceCheckboxes:GetChildren() do
    if v:IsA("Frame") then
        table.insert(ImportantGUIS, v)
    end
end

for _, v in plr.PlayerGui.Gui.Journal.Content.Evidence.GhostCheckboxes:GetChildren() do
    if v:IsA("Frame") then
        table.insert(ImportantGUIS, v)
    end
end

loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/dazscripts/specter/main/functions/GameFunctions.lua"))()

function Defense()
    EquipItem("Crucifix")
    task.wait(0.1)
    PlaceItem("Crucifix", true)
    task.wait(0.1)
    EquipItem("EMF Reader")
    task.wait(0.1)
    Toggle()
end
local WaypointRemote = game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Waypoint")
local rs = game:GetService("RunService")
local function waypoint()
    local args = {
        [1] = WS.Ghost.HumanoidRootPart.Position
    }

    WaypointRemote:FireServer(unpack(args))
end
events.Hunt.OnClientEvent:Connect(function()
    Hunting = not Hunting
    
    if Hunting then
        
        repeat 
            rs.RenderStepped:Wait()
            
            coroutine.wrap(waypoint)()
        until (Char.PrimaryPart.Position - WS.Ghost.PrimaryPart.Position).Magnitude < 10 or not Hunting
        
        if not Hunting then return end
        
        if EquipmentPath:FindFirstChild("Crucifix") then
            coroutine.wrap(Defense)()
        end
        
        repeat 
            Char:SetPrimaryPartCFrame(WS.Ghost.PrimaryPart.CFrame * CFrame.new(0,8,-6)) 
            task.wait() 
        until not Hunting
    else
        task.wait(0.3)
        Char:SetPrimaryPartCFrame(WS.emfpart2.CFrame)
    end
end)

local TSC = game:GetService("TextChatService")
local Channel = TSC.TextChannels.RBXGeneral



task.spawn(function()

    while true do
        Channel:SendAsync("Where are you? Are you here? How old are you? Can you write in the book? Can you leave a fingerprint? Are you there? Are you a boy? Are you a girl? Show us a sign. Can you turn on the lights?")
        task.wait(5)
    end
end)

local waterP = WS.Map.EventObjects.Sinks
local Camera = WS.CurrentCamera

for _, v in pairs(waterP:GetChildren()) do
    v.Running:GetPropertyChangedSignal("Playing"):Connect(function()
        task.wait(20)
        
        repeat task.wait()
        until Hunting == false
        

        Char:SetPrimaryPartCFrame(v.CFrame * CFrame.new(0,5,0))

        for i = 1,4 do
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, v.Position)
            task.wait(0.1)
        end

        fireproximityprompt(v.ProximityPrompt)

        task.wait(0.3)

        Char:SetPrimaryPartCFrame(WS.emfpart2.CFrame)

    end)
end

loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/dazscripts/specter/main/functions/InGame/Extra/GameBegin.lua"))()

task.wait(60 * 3)

if AI_EVIDENCE.Orbs == "Unknown" then AI_EVIDENCE.Orbs = false end

task.wait(60 * 3)

if AI_EVIDENCE.Fingerprints == "Unknown" then AI_EVIDENCE.Fingerprints = false end

task.wait(60 * 3)

if AI_EVIDENCE.Writing == "Unknown" then AI_EVIDENCE.Writing = false end

task.wait(60 * 3)

local ghost = MakeGuess()

if ghost == nil then 
    return 
end

for _, v2 in ipairs(ImportantGUIS) do
    if v2.Name == ghost then
        for _, signal in pairs(getconnections(v2.Box.Activated)) do
            signal:Fire()
        end
        local VAN_BUTTON = WS.Van.Close
        Char:SetPrimaryPartCFrame(VAN_BUTTON.CFrame * CFrame.new(0,0,3))
        
        task.wait(0.3)

        Camera.CFrame = CFrame.new(Camera.CFrame.Position, VAN_BUTTON.Position)
        
        task.wait(0.2)
        
        fireproximityprompt(VAN_BUTTON.VanPrompt)
    end
end