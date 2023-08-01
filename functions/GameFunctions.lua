--!strict

-- // REMOTES \\ --

print("loading remotes")
local ClientMain = getsenv(game.Players.LocalPlayer.PlayerScripts.ClientMain)

local InventoryRemote = events:WaitForChild("Inventory")
local PickupRemote = events:WaitForChild("Pickup")
local PlaceRemote = events:WaitForChild("PlaceItem")

local root = Char.HumanoidRootPart
local Ghost = WS:WaitForChild("Ghost").PrimaryPart
local Camera = WS.CurrentCamera

local ToolbarHotkeys = {
    [1] = Enum.KeyCode.One,
    [2] = Enum.KeyCode.Two,
    [3] = Enum.KeyCode.Three,
    [4] = Enum.KeyCode.Four,
}

-- // AI \\ -- 

print("loading ai")

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

local function findMatch(evidence, v2)
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

function MakeGuess()
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
        return potentialGhosts[1]
    elseif #collectedEvidence == 3 then
        local foundGhost = findMatch(collectedEvidence, Ghosts)
        if foundGhost then
            return foundGhost
        else
            return nil
        end
    end
end

print("init functions")

local function GetInventory()
    return InventoryRemote:InvokeServer()
end

local function FindItemInInventory(Item : string)
    local inv = GetInventory()
    for i, v in ipairs(inv) do
        if v == Item then
            return i
        end
    end
end

function GetItem(Item : string)
    repeat task.wait(0.1) until not Hunting
    local foundItem = EquipmentPath:FindFirstChild(Item)
    if foundItem then
        PickupRemote:InvokeServer(foundItem)
        print("Picked up " .. Item)
    end
end

function EquipItem(Item : string)
    repeat task.wait(0.1) until not Hunting

    ClientMain.equipTool("", Enum.UserInputState.Begin, {KeyCode = ToolbarHotkeys[FindItemInInventory(Item)]})
    print("Equipped " .. Item)
end

function DropItem(Item : string)
    repeat task.wait(0.1) until not Hunting
    
    ClientMain.dropTool("", Enum.UserInputState.Begin, {KeyCode = ToolbarHotkeys[FindItemInInventory(Item)]})
    print("Dropped " .. Item)
end

function Toggle()
    repeat task.wait(0.1) until not Hunting
    events:WaitForChild("ToggleEquipment"):InvokeServer()
    print("Toggled")
end

function PutEvidence(button : string)
    
    if AI_EVIDENCE[tostring(button)] == true then 
        print("   ---------   Failed to put in evidence   ---------")
        print("   [1]   EVIDENCE: " .. button)
        print("   [2]   REASON:   " .. "Evidence already entered")            
        return
    end

    for i, v in ipairs(ImportantGUIS) do
        if v.Name == button then
            for _, signal in pairs(getconnections(v.Box.Activated)) do
                print("   ---------   Entered Evidence   ---------")
                print("   [1]   EVIDENCE: " .. button)
                AI_EVIDENCE[button] = true
                signal:Fire()
            end
            
            task.wait(1)

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
        end
    end
end

function PlaceItem(Item : string, PlaceAtCharacter : bool)
    task.spawn(function()
        repeat task.wait(0.1) until not Hunting
        if not PlaceAtCharacter then
            PlacementArgs = {
                [1] = FindItemInInventory(Item),
                [2] = Ghost.CFrame * CFrame.new(0,-3,-4),
                [3] = workspace:WaitForChild("Terrain"),
                [4] = Ghost.Position
            }
        else
            PlacementArgs = {
                [1] = FindItemInInventory(Item),
                [2] = root.CFrame * CFrame.new(0,-3,0),
                [3] = workspace:WaitForChild("Terrain"),
                [4] = root.Position
            }
        end
    
        PlaceRemote:InvokeServer(unpack(PlacementArgs))  
    end)
  
end

