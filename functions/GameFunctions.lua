--!strict

local Channel = TSC.TextChannels.RBXGeneral


function GetInventory()
    remote = events.Inventory
    return remote:InvokeServer()
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
    local remote = events:WaitForChild("Equip")
    local Toolbar = plr.PlayerGui.Gui.Toolbar
    local args = {[1] = FindItemInInventory(Item)}

    remote:InvokeServer(unpack(args))
    print("Equipped " .. Item)
end

function DropItem(Item : string)
    local DropItem = events:WaitForChild("Drop")
    task.wait(0.1)
    local args = {[1] = FindItemInInventory(Item)}
    DropItem:InvokeServer(unpack(args))
    print("Dropped " .. Item)
end

function GetItem(Item : string)
    foundItem = EquipmentPath:FindFirstChild(Item)
    if foundItem then
        foundItem.Main.Anchored = true
        foundItem:SetPrimaryPartCFrame(Char.PrimaryPart.CFrame * CFrame.new(0,0,-3))
        task.wait(0.2)
        fireproximityprompt(foundItem.Main.PickupPrompt)
        print("Picked up " .. Item)
    end
end

function Toggle()
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

local Ghost = WS:WaitForChild("Ghost").PrimaryPart
local root = Char.HumanoidRootPart

function PlaceItem(Item : string, PlaceAtCharacter : bool)
    local PlaceRemote = events:WaitForChild("PlaceItem")
    if not PlaceAtCharacter then
        PlacementArgs = {
            [1] = FindItemInInventory(Item),
            [2] = Ghost.CFrame * CFrame.new(0,-3,0),
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

function SendChatMessage()
    Channel:SendAsync("Where are you? Are you here? How old are you? Can you write in the book? Can you leave a fingerprint? Are you there? Are you a boy? Are you a girl? Anyone here? Can you turn on the lights?")
    print("Send Chat Message")
end

function TeleportToGhostRoom()
    Char:SetPrimaryPartCFrame(WS.emfpart2.CFrame)
    print("Teleported to room")
end