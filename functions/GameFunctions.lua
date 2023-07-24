--!strict

-- // REMOTES \\ --

local InventoryRemote = events:WaitForChild("Inventory")
local PickupRemote = events:WaitForChild("Pickup")
local PlaceRemote = events:WaitForChild("PlaceItem")

local root = Char.HumanoidRootPart
local Ghost = WS:WaitForChild("Ghost").PrimaryPart

local ToolbarHotkeys = {
    [1] = Enum.KeyCode.One,
    [2] = Enum.KeyCode.Two,
    [3] = Enum.KeyCode.Three,
    [4] = Enum.KeyCode.Four,
}

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

function GetItem(Item : string)
    repeat task.wait(0.1) until not Hunting
    local foundItem = EquipmentPath:FindFirstChild(Item)
    if foundItem then
        PickupRemote:InvokeServer(foundItem)
        print("Picked up " .. Item)
    end
end

function Toggle()
    repeat task.wait(0.1) until not Hunting
    events:WaitForChild("ToggleEquipment"):InvokeServer()
    print("Toggled")
end

function PutEvidence(button : string)
    for _, evidence in ipairs(Evidence) do
        if evidence == button then
            print("   ---------   Failed to put in evidence   ---------")
            print("   [1]   EVIDENCE: " .. button)
            print("   [2]   REASON:   " .. "Evidence already entered")            
            return
        end
    end
    for i, v in ipairs(ImportantGUIS) do
        if v.Name == button then
            for _, signal in pairs(getconnections(v.Box.Activated)) do
                print("   ---------   Entered Evidence   ---------")
                print("   [1]   EVIDENCE: " .. button)

                table.insert(Evidence, button)
                signal:Fire()
            end
        end
    end
end

function PlaceItem(Item : string, PlaceAtCharacter : bool)
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
end