--!strict

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
end

function DropItem(Item : string)
    local DropItem = events:WaitForChild("Drop")
    EquipItem(Item)
    task.wait(0.1)
    local args = {[1] = FindItemInInventory(Item)}
    DropItem:InvokeServer(unpack(args))
end

function GetItem(item : string)
    foundItem = EquipmentPath:FindFirstChild(item)
    if foundItem then
        foundItem.Main.Anchored = true
        foundItem:SetPrimaryPartCFrame(Char.PrimaryPart.CFrame * CFrame.new(0,0,-3))
        task.wait(0.2)
        fireproximityprompt(foundItem.Main.PickupPrompt)
    end
end

function Toggle()
    events:WaitForChild("ToggleEquipment"):InvokeServer()
end

function PutEvidence(button : string)
    for _, evidence in ipairs(CurrentEvidence) do
        if evidence == button then
            return
        end
    end
    for i, v in ipairs(ImportantGUIS) do
        if v.Name == button then
            for _, signal in pairs(getconnections(v.Activated)) do
                signal:Fire()
            end
        end
    end
end

function SendChatMessage()
    local TSC = game:GetService("TextChatService")
    local Channel = TSC.TextChannels.RBXGeneral
    Channel:SendAsync("Where are you? Are you here? How old are you? Can you write in the book? Can you leave a fingerprint? Are you there? Are you a boy? Are you a girl? Anyone here? Can you turn on the lights?")
end

function TeleportToGhostRoom()
    Char:SetPrimaryPartCFrame(game.Workspace.emfpart2.CFrame)
end