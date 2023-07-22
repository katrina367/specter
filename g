-- Decompiled by Electron BETA [ Made By (Co) ]
-- Path: Players.zed_XESGroupHolder.PlayerScripts.ClientMain
local u1 = {}
local v2, v3, v4 = pairs(script.Modules:GetChildren())
for v5,v6 in v2 do
local v7, v8 = pcall((function()
u1[v6.Name] = require(v6)
end))
if not v7 then
warn("CRITICAL ERROR: " .. v8)
end
end
v2()
local u9 = u1.Services
local u10 = v3(v4)
else if not v8 then
if v8 then
end
end
if v8 then
local u11 = u9.UserInputService.KeyboardEnabled
if not u11 then
end
end
v5(v6, v7)
v5.OnClientInvoke = v4
local u12 = {}
local u13 = {}
local u14 = {}
local u15 = false
local u16 = game.Players.LocalPlayer
local u17 = workspace.CurrentCamera
local L_Gui_1 = u16:WaitForChild("PlayerGui"):WaitForChild("Gui")
local L_PlayerName_2 = u16.PlayerGui:WaitForChild("PlayerName")
local L_Journal_3 = L_Gui_1:WaitForChild("Journal")
workspace:WaitForChild("Map")
local u18 = UDim2.new(1, -80, 1, -205)
L_Journal_3.Content.Overview.Overview.Text1.Text = string.format("Your goal is to identify the type of ghost haunting <font color=\"#d0b05e\">%s</font> using the tools in your van. <font color=\"#d0b05e\">%s</font>", game.ReplicatedStorage:GetAttribute("Map"), "Learn more about each equipment with the buttons below.")
game.ReplicatedStorage.AttributeChanged:Connect((function(a1)
if a1 == "Map" then
local v1 = game.ReplicatedStorage:GetAttribute(a1)
L_Journal_3.Content.Overview.Overview.Text1.Text = string.format("Your goal is to identify the type of ghost haunting <font color=\"#d0b05e\">%s</font> using the tools in your van. <font color=\"#d0b05e\">%s</font>", v1, "Learn more about each equipment with the buttons below.")
end
end))
game.Script Context.Error:Connect((function(a1, a2, a3)
local v1 = ""
local v2, v3 = pcall((function()
return a3:GetFullName()
end))
if not v2 then
v1 = "Protected Script"
end
game.ReplicatedStorage.Events.Error:FireServer(a1, a2, v1)
end))
game.ReplicatedStorage.Events.Notification.OnClientEvent:Connect((function(a1, a2, a3)
if not a3 then
end
u1.NotificationManager:Create(a1, a2, a3)
end))
local u19 = (function(a1, ...) -- CoreCall
for v1 = 1, 100 do
local v2 = {pcall(game.StarterGui[a1], game.StarterGui, ...)}
if not v2 then
v2(1)
end
end
return unpack(1)
end)
task.spawn((function()
(u19("SetCore", "ResetButtonCallback", false))
end))
else if workspace.Map:FindFirstChild("Blockers") then
u16:GetMouse().TargetFilter = workspace.Map.Blockers
end
local u20 = nil
local L_Animations_4 = u9.ReplicatedStorage:FindFirstChild("Animations")
updateAnim = (function() -- updateAnim
if u20 then
u20:Stop()
u20 = nil
end
if u12[u11] then
if u12[u11] ~= "" thenand u12[u11] ~= nil 
if u12[u11] == "Flashlight" then
u20 = workspace:FindFirstChild(u16.Name):WaitForChild("Humanoid"):FindFirstChildOfClass("Animator"):LoadAnimation(L_Animations_4:WaitForChild("Hold_Flashlight"))
end
else if u12[u11] ~= "Ghost Goggles" then
u20 = workspace:FindFirstChild(u16.Name):WaitForChild("Humanoid"):FindFirstChildOfClass("Animator"):LoadAnimation(L_Animations_4:WaitForChild("Hold_Generic"))
if u20 then
u20:Play()
end
end
end)
updateProximityPrompt = (function(a1) -- updateProximityPrompt
local v1 = u1.Keybinds.Binds[a1.ActionText]
if v1 then
if v1.Type == "KeyCode" then
a1.KeyboardKeyCode = Enum[v1.Type][v1.Code]
end
end
else if u16:GetAttribute("Dead") then
a1:SetAttribute("Distance", a1.MaxActivationDistance)
a1.MaxActivationDistance = 0
end
end)
game.ReplicatedStorage.Events.Message.OnClientEvent:Connect((function(a1)
game.StarterGui:SetCore("ChatMakeSystemMessage", {Text = "[SYSTEM] " .. a1, Color = Color3.fromRGB(255, 255, 255), Font = Enum.Font.SourceSansBold, TextSize = 18})
end))
workspace.DescendantAdded:Connect((function(a1)
else if a1:IsA("ProximityPrompt") then
updateProximityPrompt(a1)
end
end))
u16:WaitForChild("Data"):WaitForChild("Room").Changed:Connect((function(a1)
if a1 then
L_Gui_1.RoomName.Text = string.upper(a1.Name)
return
end
L_Gui_1.RoomName.Text = ""
end))
workspace.Orbs.ChildAdded:Connect((function(a1)
else if u12[u11] then
if u12[u11] == "Ghost Goggles" then
else if workspace:FindFirstChild(u16.Name):FindFirstChild("Tool"):GetAttribute("On") then
a1.Transparency = 0
end
end
end
end))
workspace.Fingerprints.ChildAdded:Connect((function(a1)
else if u12[u11] then
if u12[u11] == "Ghost Goggles" then
else if workspace:FindFirstChild(u16.Name):FindFirstChild("Tool"):GetAttribute("On") then
else if u16:GetAttribute("FP") then
a1:WaitForChild("SurfaceGui").Brightness = 10
end
end
end
end
end))
disableEquipment = (function() -- disableEquipment
else if workspace:FindFirstChild(u16.Name) then
else if workspace:FindFirstChild(u16.Name):FindFirstChild("Head") then
workspace:FindFirstChild(u16.Name).Head.LocalTransparencyModifier = 1
end
end
u9.Lighting.GogglesTint.Enabled = false
local v1, v2, v3 = pairs(workspace.Orbs:GetChildren())
for v4,v5 in v1 do
v5.Transparency = 1
end
local v6, v7, v8 = v1()
for v9,v10 in v6 do
v10.SurfaceGui.Brightness = 0.5
end
v6(v7)
end)
toggleDeadVisible = (function(a1) -- toggleDeadVisible
local v1, v2, v3 = game.Players:GetPlayers()
for v4,v5 in v1 do
if v5 ~= u16 then
else if v5:GetAttribute("Dead") then
else if workspace:FindFirstChild(v5.Name) then
local v6, v7, v8 = workspace:FindFirstChild(v5.Name):GetDescendants()
for v9,v10 in v6 do
else if v10:IsA("BasePart") then
else if a1 thenand v10.Name ~= "HumanoidRootPart" 
v10.Material = Enum.Material.ForceField
v10.Color = u9.Lighting.GogglesTint.TintColor
if v10.Name == "Head" then
v10.Transparency = 0.9
continue
end
v10.Transparency = 0.7
continue
end
v10.Transparency = 1
end
end
end
end
end
end)
updateEquipmentStuff = (function() -- updateEquipmentStuff
else if u12[u11] then
if u12[u11] == "Ghost Goggles" then
else if not workspace:FindFirstChild(u16.Name):FindFirstChild("Tool"):GetAttribute("Color") then
end
game.Lighting.GogglesTint.TintColor = u9.ReplicatedStorage.Equipment:FindFirstChild("Ghost Goggles"):GetAttribute("Color")
local v1 = "On"
game.Lighting.GogglesTint.Enabled = workspace:FindFirstChild(u16.Name):FindFirstChild("Tool"):GetAttribute(v1) or false
else if workspace:FindFirstChild(u16.Name):FindFirstChild("Tool"):GetAttribute("On") then
local v2, v3, v4 = pairs(workspace.Orbs:GetChildren())
for v5,v6 in v2 do
v6.Transparency = 0
end
local v7, v8, v9 = v2()
for v10,v11 in v7 do
else if u16:GetAttribute("FP") then
v11.SurfaceGui.Brightness = 5
end
end
v7(v8)
end
v7()
local v12, v13, v14 = v7()
for v15,v16 in v12 do
if v16.Name == "Candle" then
else if not v16:GetAttribute("Lit") then
v16.PrimaryPart.LightPrompt.Enabled = false
end
end
end
return
end
else if u12[u11] == "Lighter" then
else if workspace:FindFirstChild(u16.Name):FindFirstChild("Tool"):GetAttribute(v13) then
local v17, v18, v19 = v12.Equipment:GetChildren()
for v20,v21 in v17 do
if v16 == "Candle" then
else if not v16 then
v16.Enabled = true
v16.Enabled = false
end
end
end
break
end
local v22, v23, v24 = v17()
for v25,v26 in v22 do
if v16 == "Candle" then
else if not v16 then
v16.Enabled = false
v16.Enabled = true
end
end
end
end
v22()
return
end
local v27, v28, v29 = v22.Equipment:GetChildren()
for v30,v31 in v27 do
if v26 == "Candle" then
else if not v26 then
if v26 then
v26.Enabled = v16
v26.Enabled = v16
end
end
end
end
v27()
end)
u9.ReplicatedStorage:WaitForChild("Events"):WaitForChild("DataLoaded").OnClientEvent:Connect((function(a1, a2, a3)
local v1 = u16:GetAttributes()
if v1.LowQuality then
local v2, v3, v4 = pairs(workspace:WaitForChild("Map"):GetDescendants())
for v5,v6 in v2 do
local L_BasePart_1 = v6:IsA("BasePart")
else if L_BasePart_1 then
L_BasePart_1 = v6.Material
if L_BasePart_1 == Enum.Material.Glass then
L_BasePart_1 = Enum.Material.Plastic
v6.Material = L_BasePart_1
end
end
end
end
u13 = a3
local v7 = v4.SoundService
v7 = v7(v5)
v2.SoundId = v7
v7 = v4.SoundService
v7 = v7(v5)
v2.SoundId = v7
v7 = v4.Keybinds
local v8 = v7.Images
if a1 then
v7 = v4.Keybinds
v7.Binds = a1
v7 = pairs
local v9, v10, v11 = v7(v4)
for v12,v13 in v9 do
local v14 = "ProximityPrompt"
else if v13:IsA(v14) then
updateProximityPrompt(v13)
end
end
v9 = v1.KeybindHUD
if v9 then
v9 = u16
v9 = v9(v11)
if v9 == "Desktop" then
v9 = v10.Keybinds
v9.Visible = v10
v9 = print
v9(v10)
v9 = pairs
local v15, v16, v17 = v9(v10)
for v18,v19 in v15 do
else if L_Gui_1.Keybinds:FindFirstChild(v14) then
v14 = v19.Type
print(v19.Code, v14, v18)
v14 = L_Gui_1
v14 = v8[v19.Type][v19.Code]
v14.Keybinds:FindFirstChild(v18).ImageLabel.ImageRectOffset = v14[1]
if v19.Type == "KeyCode" then
v14 = L_Gui_1
v14.Keybinds:FindFirstChild(v18).ImageLabel.Image = "rbxassetid://9995273305"
continue
end
v14 = L_Gui_1
v14.Keybinds:FindFirstChild(v18).ImageLabel.Image = "rbxassetid://9995272657"
end
end
v15.Visible = v16
end
local v20, v21, v22 = v15(v16)
for v23,v24 in v20 do
else if L_Gui_1.Keybinds:FindFirstChild(v14) then
v14 = L_Gui_1
v14 = v8.KeyCode[L_Gui_1.Keybinds:FindFirstChild(v23):GetAttribute("KeyCode")]
v14.Keybinds:FindFirstChild(v23).ImageLabel.ImageRectOffset = v14[1]
end
end
end
v20.Visible = v21
v20.Image = v21
v20.ImageRectSize = v21
v20.ImageRectOffset = v21
v20.Image = v21
v20.ImageRectSize = v21
v20.ImageRectOffset = v21
local v25, v26, v27 = v20(v21)
for v28,v29 in v25 do
local L_v28_2 = L_Gui_1.Keybinds:FindFirstChild(v14)
v14 = v14("Device")
if v14 == "Desktop" 
v14 = v29.Typeand v14 == "KeyCode" 
v14 = Vector2.new
local L_Device_3 = v14("Device")
if L_Device_3 == "Desktop" then
L_Device_3 = v29.Typeand L_Device_3 == "UserInputType" 
L_Device_3 = Vector2.new
end
local L_Device_4 = L_Device_3("Device")
if L_Device_4 == "Console" then
L_Device_4 = Vector2.new
end
if L_v28_2 then
L_Device_4.ImageRectSize = L_Device_4
if L_Device_4 == "Console" then
L_Device_4.Image = "rbxassetid://9995275815"
end
end
end
v25 = v25(v27)
if v25 == "Mobile" then
v25 = v26.Keybinds
v25.Visible = v26
v25 = v1.InventoryHUD
if v25 then
v25 = v26.Toolbar
v25.Visible = v26
end
v25.Visible = v26
v25 = v25(v27)
if v25 == "Desktop" then
v25 = L_Gui_1
v25.Text = v26
end
v25.Text = v26
end
if v26 then
end
v28.ExposureCompensation = v27
u14 = a2
if v28 thenor v28 == 1 
v28.Brightness = v29
if v28 == 2 then
v28.Brightness = v29
end
if v28 == 3 then
v28.Brightness = v29
v28(L_v28_2, true)
end
end
else if v28 then
v28.Visible = v29
end
if v28 == "Mobile" then
v28.Size = v29
v28.Position = v29
v28.Size = v29
v28.Position = v29
v28.Size = v29
v28.Position = v29
v28.Size = v29
v28.Position = v29
v28.Size = v29
v28.Position = v29
else if v28 then
v28()
end
end
end))
updateInventory = (function(a1) -- updateInventory
u12 = a1
u11 = u16:GetAttribute("Index")
local v1, v2, v3 = pairs(a1)
for v4,v5 in v1 do
local v6 = tostring(v4)
local v7 = L_Gui_1:FindFirstChild("Toolbar"):FindFirstChild(v6)
if v5 ~= "" then
v6 = u13
local v8 = u14
local v9 = v8[v5]
v6 = v9 or 0
v9 = nil
if v6[v5] then
v8 = nil
local v10 = v6[v5]
local L_v10_1 = game.ReplicatedStorage.Equipment:FindFirstChild(v5):FindFirstChild(v10)
else if L_v10_1 then
L_v10_1 = game.ReplicatedStorage.Equipment
local L_v10_2 = L_v10_1(v10)
if not v8 then
L_v10_2 = game.ReplicatedStorage.Equipment
if v8 then
end
L_v10_2("Failed to find", v5, v10 .. "_" .. v6)
end
if v9 then
else if v8 then
v7.Image = v8
end
L_v10_2(v9, "does not have image")
v7.Image = L_v10_2
end
v7.Image = v8
end
v7.Image = v10
if v4 == v10 then
v10.Enabled = v6
continue
end
v10.Enabled = v6
end
else if v1 then
v1.Visible = v2
end
v1.Visible = v2
v1()
v1()
end)
castRay = (function(a1) -- castRay
local v1 = workspace.Map.Nodes
local v2 = workspace.Map.PossessionSpawns
if u16.Character then
v1 = u16.Character
local v3 = {workspace.Equipment, workspace.Map.Blockers, v1, workspace.Map.TouchParts, v2, workspace.Map.BoneSpawns, u17, workspace.Ghost}
table.insert(v3, v1)
end
local v4, v5, v6 = pairs(v1.Players:GetPlayers())
for v7,v8 in v4 do
else if workspace:FindFirstChild(v8.Name) then
local v9 = workspace:FindFirstChild(v8.Name)
table.insert(v3, v9)
end
end
local v10, v11, v12 = v4()
for v13,v14 in v10 do
else if v9 then
v9(v3, v14.Hitbox)
end
end
local v15, v16, v17 = v10()
for v18,v19 in v15 do
else if v9 then
v9(v3, v19)
end
end
local v20 = v15()
local v21 = nil
if a1 then
v17 = u17
end
local v22 = v17()
v22.FilterType = v18
v22.FilterDescendantsInstances = v3
local v23 = v18(v9, v21.Direction * 5000, v22)
if v23 == nil then
return v19, v9
end
return v19, v9, v23.Normal
end)
pairs = (function() -- attemptPlace
local v1 = u11
if u12[v1] then
if u12[v1] ~= "" then
v1 = game.ReplicatedStorage
local v2 = u12[v1]
else if v1.Equipment:FindFirstChild(v2) then
v1 = v1("Placed")
else if v1 then
v1 = u17
v1 = v1("ViewModel")
else if v1 then
v1 = castRay
local v3, v4 = v1()
else if game.ReplicatedStorage.Events.PlaceItem:InvokeServer(u11, u17.ViewModel.PrimaryPart.CFrame, v3, v4) then
u9.ContextActionService:UnbindAction("ToggleTool")
updateInventory(game.ReplicatedStorage.Events.PlaceItem:InvokeServer(u11, u17.ViewModel.PrimaryPart.CFrame, v3, v4).NewInventory)
u11 = 0
else if u17:FindFirstChild("ViewModel") then
u17:FindFirstChild("ViewModel"):Destroy()
end
end
end
end
end
end
end
end)
toggleTool = (function(a1, a2, a3) -- toggleTool
if a2 == Enum.UserInputState.Begin then
if u12 then
if u12[u11] then
else if u9.ReplicatedStorage.Equipment:FindFirstChild(u12[u11]) then
else if u9.ReplicatedStorage.Equipment:FindFirstChild(u12[u11]):GetAttribute("Placed") then
attemptPlace()
end
end
u9.ReplicatedStorage:WaitForChild("Events"):WaitForChild("ToggleEquipment"):InvokeServer()
updateInventory(u12)
end
end
end
end)
equipTool = (function(a1, a2, a3) -- equipTool
local v1 = Enum.UserInputState.Begin
if a2 == v1 then
v1 = a3.KeyCode
if v1 == Enum.KeyCode.One then
end
if v1 == Enum.KeyCode.Two then
end
if v1 == Enum.KeyCode.Three then
end
if v1 == Enum.KeyCode.Four then
end
else if not u16:GetAttribute("Drinking") then
if 0 < 4 then
local v2 = 4
local L_v2_1 = u9.ReplicatedStorage:WaitForChild("Events"):WaitForChild("Equip"):InvokeServer(v2)
if L_v2_1.Success then
updateInventory(L_v2_1.NewInventory)
if v1 ~= u12[u11] then
u1.EzFX:PlaySound("Ruffle" .. Random.new():NextInteger(1, 3))
end
local v3 = u1.Keybinds.Binds.Toggle
if v1 then
u9.ContextActionService:BindAction("ToggleTool", toggleTool, true, Enum[v3.Type][v3.Code], Enum.KeyCode.ButtonR2)
u9.ContextActionService:SetPosition("ToggleTool", u18)
else if u9.ReplicatedStorage.Equipment:FindFirstChild(v1) then
else if u9.ReplicatedStorage.Equipment:FindFirstChild(v1):GetAttribute("Placed") then
u9.ContextActionService:SetImage("ToggleTool", "rbxassetid://14055956137")
return
end
end
u9.ContextActionService:SetImage("ToggleTool", "rbxassetid://14055955684")
return
end
u9.ContextActionService:UnbindAction("ToggleTool")
return
end
L_v2_1("ToggleTool")
end
end
end
end)
local u21 = {}
u21[1] = "One"
u21[2] = "Two"
u21[3] = "Three"
u21[4] = "Four"
local v22, v23, v24 = L_Gui_1.Toolbar:GetChildren()
for v25,v26 in v22 do
else if v26:IsA("ImageButton") then
v26.Activated:Connect((function()
equipTool("", Enum.UserInputState.Begin, {KeyCode = Enum.KeyCode[u21[tonumber(v26.Name)]]})
end))
end
end
local u27 = (function(a1, a2) -- dPad
if a1 == Enum.UserInputState.Begin then
else if u16:GetAttribute("Fourth") then
if a2 then
local v1 = 4
for v2 = 1, v1 do
if u12[u11 + v2] then
if u11 + v2 <= v1 then
if u12[u11 + v2] ~= "" then
break
continue
end
end
if u12[v2 - v1 + u11 + v2] ~= "" then
break
end
end
end
break
end
for v3 = v2, v1 do
if u12[v2 - v1 + u11 + v2 - v3] then
if 0 < v2 - v1 + u11 + v2 - v3 then
if u12[v2 - v1 + u11 + v2 - v3] ~= "" then
break
continue
end
end
local v4 = u12
if v4[v3 + v1 - v2 - v1 + u11 + v2 - v3] ~= "" then
break
end
end
end
local v5 = {}
v5[1] = Enum.KeyCode.One
v5[2] = Enum.KeyCode.Two
v5[3] = Enum.KeyCode.Three
v5[4] = Enum.KeyCode.Four
v4.KeyCode = v5[v3 + v1 - v2 - v1 + u11 + v2 - v3]
equipTool(v3, Enum.UserInputState.Begin, v4)
end
end)
dpad = v23
dropTool = v23
handleSprint = v23
v23(v25)
v23(v25)
v23(v25)
GetPosition = v23
local u28 = (function() -- OpenVanDoor
local L_Van_1 = workspace:FindFirstChild("Van")
else if L_Van_1 then
if u9.ReplicatedStorage:GetAttribute("VanType") ~= "Van" thenor u9.ReplicatedStorage:GetAttribute("VanType") ~= "Box Van" 
if u9.ReplicatedStorage:GetAttribute("VanType") == "Compact Van" then
end
for v1 = 0, -97, -1 do
local v2 = L_Van_1.VanDoor
local v3 = L_Van_1:FindFirstChild("VanDoor"):FindFirstChild("Rotate")
v2(GetPosition(v3, L_Van_1.VanDoor.PrimaryPart.Position, L_Van_1.VanDoor.PrimaryPart(0, 90, v1)))
v2 = task.wait
v2()
end
return
end
else if u9.ReplicatedStorage:GetAttribute("VanType") == "RV" then
for v4 = v1, -97, -1 do
v2 = L_Van_1.VanDoor
v2(GetPosition(v3, L_Van_1.VanDoor.PrimaryPart.Position, L_Van_1.VanDoor.PrimaryPart(0, v4, 0)))
v2 = task.wait
v2()
end
return
end
else if u9.ReplicatedStorage:GetAttribute("VanType") == "Armored Van" then
for v5 = v2, -97, v4 do
L_Van_1.VanDoor1:SetPrimaryPartCFrame(GetPosition(v3, L_Van_1.VanDoor1.PrimaryPart.Position, L_Van_1.VanDoor1.PrimaryPart(0, v5, 0)))
local v6 = L_Van_1:FindFirstChild(v4):FindFirstChild(v4)
L_Van_1.VanDoor2:SetPrimaryPartCFrame(GetPosition(v6, L_Van_1.VanDoor2.PrimaryPart.Position, L_Van_1.VanDoor2.PrimaryPart(0, -v5, 0)))
task.wait()
end
end
end)
local u29 = (function() -- CloseVanDoor
local L_Van_1 = workspace:FindFirstChild("Van")
else if L_Van_1 then
if u9.ReplicatedStorage:GetAttribute("VanType") ~= "Van" thenor u9.ReplicatedStorage:GetAttribute("VanType") ~= "Box Van" 
if u9.ReplicatedStorage:GetAttribute("VanType") == "Compact Van" then
end
for v1 = -97, 0 do
local v2 = L_Van_1.VanDoor
local v3 = L_Van_1:FindFirstChild("VanDoor"):FindFirstChild("Rotate")
v2(GetPosition(v3, L_Van_1.VanDoor.PrimaryPart.Position, L_Van_1.VanDoor.PrimaryPart(0, 90, v1)))
v2 = task.wait
v2()
end
return
end
else if u9.ReplicatedStorage:GetAttribute("VanType") == "RV" then
for v4 = v1, 0 do
v2 = L_Van_1.VanDoor
v2(GetPosition(v3, L_Van_1.VanDoor.PrimaryPart.Position, L_Van_1.VanDoor.PrimaryPart(0, v4, 0)))
v2 = task.wait
v2()
end
return
end
else if u9.ReplicatedStorage:GetAttribute("VanType") == "Armored Van" then
for v5 = v2, 0, v4 do
L_Van_1.VanDoor1:SetPrimaryPartCFrame(GetPosition(v3, L_Van_1.VanDoor1.PrimaryPart.Position, L_Van_1.VanDoor1.PrimaryPart(0, v5, 0)))
local v6 = L_Van_1:FindFirstChild(v4):FindFirstChild(v4)
L_Van_1.VanDoor2:SetPrimaryPartCFrame(GetPosition(v6, L_Van_1.VanDoor2.PrimaryPart.Position, L_Van_1.VanDoor2.PrimaryPart(0, -v5, 0)))
task.wait()
end
end
end)
local u30 = nil
local u31 = nil
local u32 = false
local u33 = nil
local u34 = u16:GetMouse()
u34.Move:Connect((function()
if not u32 then
if u30 then
if u31 thenand u12[u11] ~= "" 
if u12[u11] == nil then
end
u9.ReplicatedStorage.Events:WaitForChild("ArmRot"):FireServer(u33, u31)
end
u9.ReplicatedStorage.Events:WaitForChild("ArmRot"):FireServer(u30, u31)
task.wait()
u32 = false
end
end))
cleanupPlacing = (function() -- cleanupPlacing
else if u17:FindFirstChild("ViewModel") then
u17:FindFirstChild("ViewModel"):Destroy()
end
end)
local L_LuckyEye_5 = game.ReplicatedStorage.Events:WaitForChild("LuckyEye")
L_LuckyEye_5.OnClientEvent:Connect((function()
local v1, v2, v3 = workspace.Map:GetChildren()
for v4,v5 in v1 do
else if v5.Name ~= "Bone" or v5.Name == "cursed_object" 
local u6 = Instance.new("Highlight", v5)
u6.FillTransparency = 1
u6.OutlineTransparency = 0
task.delay(60, (function()
u6:Destroy()
end))
end
end))
local u35 = game.ReplicatedStorage.Assets:WaitForChild("WhisperPart"):Clone()
u35.Parent = workspace
local u36 = (function(a1) -- renderSteppedUpdate
u34.Icon = "rbxassetid://6110948325"
L_PlayerName_2.Adornee = nil
L_PlayerName_2.User.Text = ""
local v1 = u34
local v2 = v1.Target
if v2 then
v1 = u9
v2 = v1.Players
else if v2 then
v1 = v1("Dead")
else if not v1 then
v1 = u34.Target.Parent
else if v1 then
L_PlayerName_2.Adornee = v1
L_PlayerName_2.User.Text = v2.Name
end
end
end
end
local v3 = workspaceor v3 
if not u33 then
local v4 = "RightUpperArm"
v4 = "RightShoulder"
u33 = v3:WaitForChild(v4):WaitForChild(v4).C0
end
local v5 = tick() * 1
v4 = v4(v5)
if v1 then
v4 = u16
v4 = v4("Sprinting")
else if v4 then
v5 = game
v4 = v5.TweenService
v4()
end
local v6 = (0, 0.25, -1)(0, -0.25, -1)
v4()
end
local v7, v8, v9 = v5(v3:GetChildren())
for v10,v11 in v7 do
local L_Model_1 = v11:IsA("Model")
else if L_Model_1 then
if v4 ~= "Ghost Goggles" then
L_Model_1 = pairs
local v12, v13, v14 = L_Model_1(v11:GetChildren())
for v15,v16 in v12 do
local v17 = "BasePart"
else if v16:IsA(v17) then
if v16.Transparency ~= 1 then
v16.Transparency = 0
v16.LocalTransparencyModifier = 0
end
end
end
continue
end
v12 = v12(v14)
else if v12 then
v12 = v11.Name
if v12 ~= "Head" then
v11.LocalTransparencyModifier = v12
end
end
end
end
L_LuckyEye_5 = v7
v12 = L_LuckyEye_5
local v18 = v11(v12)
local v19 = v10(v18)
if v3 then
if v9 then
v18 = "Head"
else if v9 then
v12 = v3.Head
v18 = v12.CFrame
v12 = v12(v13, v14, v15)
v19 = v18 + v12
v9.CFrame = v19
end
end
end
v18 = "Sanity"
if v9 <= v19 then
v19 = u35
v12 = 0.025
local v20 = u16
v20 = v20(v15)
v18 = v12 * v20
v12 = u16
v12 = v12(v14)
v19 = v18 * v12
v9.Volume = v19
end
else if v9 then
v20 = "Base"
v18 = v18(v20)
v19 = v18.Transparency
if v19 == 0 then
v12 = "Head"
else if v19 then
v20 = v3.Head
v12 = v20.CFrame
v18 = v12.LookVector
local L_Base_2 = v15("Base")
local v21 = v3.Head
L_Base_2 = v21.Position
v20 = v14 - L_Base_2
v12 = v20.Unit
L_Base_2 = L_Base_2(v12)
v18 = 0.78539816339745
if v19 <= v18 then
v19 = RaycastParams.new
local v22 = v19()
v18 = Enum.RaycastFilterType.Exclude
v22.FilterType = v18
v18 = {}
v21 = workspace.Map
L_Base_2 = v21.Nodes
local v23, v24, v25 = v12()
for v26,v27 in v23 do
v17 = v27.Hitbox
table.insert(v18, v17)
end
local v28, v29, v30 = v23()
for v31,v32 in v28 do
v17 = "emfpart"
else if v32.Name:match(v17) then
table.insert(v18, v17)
end
end
v22.FilterDescendantsInstances = v18
v22.IgnoreWater = v28
local v33 = v3.Head
v17 = v33.Position
local v34 = v17.Position - v17.Unit
v31 = v34 * 60
local v35 = v28(v30, v31, v34)
else if v35 then
if v29 then
v31 = v35.Instance
if v29 ~= "Ghost" then
v31 = "Draining"
v34 = false
v29(v31, v34)
end
end
v29(v31, v34)
end
v31 = "Draining"
v34 = false
v29(v31, v34)
end
v22(v35, v29)
end
v22(v35, v29)
else if v3 then
local v36 = "Head"
local v37 = "RightUpperArm"
else if v18 then
if v22 then
v31 = true
v31 = "Neck"
v34 = true
else if v36 then
if v37 then
v34 = v34("HumanoidRootPart")
v31 = v34.CFrame
v17 = workspace
v31 = v31(v17.CurrentCamera.CFrame)
local v38 = v31.LookVector
if v36 then
if v37 then
if v4 ~= "Flashlight" then
if v4 == "Camera" then
end
v17 = v36.C0
v33 = v36.C0
v17 = v33.Y
v33 = -(v38.X)
v34 = CFrame.new(v17.X, v17, v33) * CFrame.Angles(v17, v33, 0)
v17 = v38.Y
v31 = v34 * CFrame.Angles(CFrame.Angles(v17, v33, 0)(v17), v17, v33)
v34 = u30
if v34 then
v34 = u30
v17 = 0.25
u30 = v34
end
u30 = v31
v36.C0 = v34
u31 = v34
end
v36.C0 = v31
local v39 = -0(v38.X)
v34 = CFrame.new(0, v17, v33) * CFrame.Angles(v17, v39, 0)
v17 = v38.Y
u31 = v31
if v4 then
if v4 ~= "" then
else if v22 then
else if v36 then
if v3 then
if v18 then
local v40, v41, v42 = v36()
if v41 then
local v43 = nil
v34 = u17
else if v34 then
v34 = u17
v34 = v34("ModelName")
if v34 == v4 then
v34 = u17
break
end
end
v34 = u17
else if v34 then
v34 = u17
v34 = v34("ModelName")
if v34 ~= v4 then
v34 = u17
local v44, v45, v46 = v34()
for v47,v48 in v44 do
if v48.Name == "ViewModel" then
v48:Destroy()
print("Destroy")
end
end
end
end
v43.Parent = v44
v43.Name = v44
v44(v46, v47)
local v49, v50, v51 = v44(v45)
for v52,v53 in v49 do
else if v53:IsA("ProximityPrompt") then
v53.Enabled = false
end
end
local v54, v55, v56 = v49(v50)
for v57,v58 in v54 do
else if v58:IsA("BasePart") then
if v58.Transparency ~= 1 then
v58.Transparency = 0.15
v58.Color = Color3.fromRGB(0, 170, 0)
continue
end
end
else if v58:IsA("BasePart") then
v58.CanCollide = false
v58.Anchored = true
v58.CanCollide = false
else if v58:FindFirstChildOfClass("Motor6D") then
v58:FindFirstChildOfClass("Motor6D"):Destroy()
end
end
end
if v43 then
local v59, v60 = v54()
v57 = CFrame.new
v57 = v57()
v58 = v58(workspace.Van)
else if not v58 then
local v61 = v43.PrimaryPart
v58 = v3.HumanoidRootPart.Position - v61.Position.Magnitude
if 8 < v58 then
end
v58 = Color3.fromRGB
end
local v62, v63, v64 = v58(v43:GetChildren())
for v65,v66 in v62 do
else if v66:IsA("BasePart") then
v66.Color = v56
end
end
else if v62 then
if not v63 then
end
v57 = v62 * v63
else if v4 == "Motion Sensor" then
if not v63 then
end
end
if v57 then
v62(v64)
return
end
v40()
return
end
v40()
return
end
v40()
return
end
v18()
return
end
end
v22()
end
end
end
end)
script:GetAttributeChangedSignal("Draining"):Connect((function()
game.ReplicatedStorage:WaitForChild("Events"):WaitForChild("PhantomDrain"):FireServer(script:GetAttribute("Draining"))
end))
u16:GetMouse().Button1Down:Connect((function()
else if not u9.GuiService:IsTenFootInterface() then
if u9.UserInputService.GamepadEnabled then
end
end
if u9.UserInputService.TouchEnabled then
if not u9.UserInputService.KeyboardEnabled then
end
end
if "Desktop" == "Mobile" then
return
end
attemptPlace()
end))
local u37 = {}
local u38 = tick() + math.random(1, 10) / 10
local v39, v40, v41 = pairs(u9.CollectionService:GetTagged("Flicker"))
for v42,v43 in v39 do
u37[v43] = v43
end
v39(v41)
v39(v41)
local u44 = (function() -- heartbeatUpdate
if u38 < tick() then
u38 = tick() + math.random(1, 10) / 30
local v1, v2, v3 = pairs(u37)
for v4,v5 in v1 do
local v6, v7, v8 = pairs(v5:GetChildren())
for v9,v10 in v6 do
if not v10.SpotLight.Enabled then
return
end
v10.SpotLight.Brightness = math.random(1, 10) / 10
v10.Transparency = math.random(1, 10) / 10
end
end
end
end)
v40(v42)
v40(v42)
v40(v42)
v40(v42)
v40(v42)
v40(v41)
v40(v42)
v41(v43)
local u45 = workspace.ScareGhost.AnimSaves
local L_workspace.ScareGhost.AnimSaves.Scares:GetChildren()[math.random(1,_#u45.Scares:GetChildren())]_6 = v41(v43)
v42(1)
v42((function()
L_Gui_1:WaitForChild("Toolbar").Visible = false
L_Gui_1:WaitForChild("Stamina").Visible = false
print("client died")
local v1, v2, v3 = pairs(workspace:GetDescendants())
for v4,v5 in v1 do
else if v5:IsA("ProximityPrompt") then
v5:SetAttribute("Distance", v5.MaxActivationDistance)
v5.MaxActivationDistance = 0
end
end
v1(v2)
v1.Visible = v2
v1.Volume = v2
v1.Volume = v2
v1(v3)
else if v1 then
v1()
v1.CameraType = v2
v1.CFrame = v2
v5.FieldOfView = 65
v1()
v1()
end
v1.Visible = v2
v1(v2)
v1.Visible = v2
end))
v42((function()
L_Gui_1:WaitForChild("Toolbar").Visible = false
L_Gui_1:WaitForChild("Stamina").Visible = false
L_Gui_1:WaitForChild("RoomName").Text = "PURGATORY"
L_Gui_1:WaitForChild("Revive").Visible = true
u17.CameraSubject = workspace:WaitForChild(u16.Name):WaitForChild("Humanoid")
u17.CameraType = Enum.CameraType.Custom
u9.Lighting:WaitForChild("DeathTint").Enabled = true
game.Lighting.FogColor = Color3.fromRGB(0, 255, 255)
game.Lighting.FogEnd = 100
game.Lighting.FogStart = 0
game.Lighting.Atmosphere.Density = 0.65
game.Lighting.Atmosphere.Color = Color3.fromRGB(0, 255, 255)
game.Lighting.Atmosphere.Decay = Color3.fromRGB(0, 255, 255)
game.Lighting.Atmosphere.Glare = 0
game.Lighting.Atmosphere.Haze = 10
for v1 = 0, 1, 0.02 do
task.wait()
L_Gui_1:WaitForChild("Death").BackgroundTransparency = v1
end
L_Gui_1:WaitForChild(v1).BackgroundTransparency = 1
L_Gui_1:WaitForChild(v1).Visible = false
L_Gui_1:WaitForChild(v1).BackgroundTransparency = 0
else if workspace.Map:FindFirstChild(v1) then
local v2, v3, v4 = v1.Map.Doors:GetChildren()
for v5,v6 in v2 do
local v7, v8, v9 = v6:GetDescendants()
for v10,v11 in v7 do
local L_BasePart_1 = v11:IsA("BasePart")
else if L_BasePart_1 then
L_BasePart_1 = v11.CanCollide
v11:SetAttribute("CanCollide", L_BasePart_1)
local v12 = v11.Transparency
v11:SetAttribute("Transparency", v12)
v11.CanCollide = false
v11.Transparency = 1
end
end
end
end
local v13 = u9
v13.Volume = v7
v2()
local v14 = u9
v14.Volume = v7
v2()
end))
v42((function()
local v1, v2, v3 = workspace:GetDescendants()
for v4,v5 in v1 do
else if v5:IsA("ProximityPrompt") then
else if v5:GetAttribute("Distance") then
v5.MaxActivationDistance = v5:GetAttribute("Distance")
end
end
end
else if v1 then
local v6, v7, v8 = v1()
for v9,v10 in v6 do
local v11, v12, v13 = workspace.Map.Doors:GetChildren()
for v14,v15 in v11 do
print("Makking doors visible")
local v16, v17, v18 = v15:GetDescendants()
for v19,v20 in v16 do
else if v20:IsA("BasePart") then
v20.CanCollide = v20:GetAttribute("CanCollide")
v20.Transparency = v20:GetAttribute("Transparency")
end
end
end
end
end
end))
v42((function()
else if not u16:GetAttribute("Dead") then
L_Gui_1:WaitForChild("Revive").Visible = false
L_Gui_1:WaitForChild("Toolbar").Visible = true
L_Gui_1:WaitForChild("RoomName").Text = ""
L_Gui_1:WaitForChild("Stamina").Visible = true
u9.Lighting:WaitForChild("DeathTint").Enabled = false
local v1, v2, v3 = pairs(workspace:GetDescendants())
for v4,v5 in v1 do
else if v5:IsA("ProximityPrompt") then
else if v5:GetAttribute("Distance") then
v5.MaxActivationDistance = v5:GetAttribute("Distance")
end
end
end
v1.FogColor = v2
v1.FogEnd = v2
v1.FogStart = v2
v1.Density = v2
v1.Color = v2
v1.Decay = v2
v1.Glare = v2
v1.Haze = v2
end
end))
v42((function(a1)
if a1 then
local L__1 = workspace:FindFirstChild(a1.Name)
else if L__1 then
else if a1:GetAttribute("Dead") then
else if u16:GetAttribute("Dead") then
local v1, v2, v3 = pairs(L__1:GetChildren())
for v4,v5 in v1 do
else if v5:IsA("BasePart") then
if v5.Name ~= "HumanoidRootPart" then
v5.Transparency = 0
else if L__1.Head:FindFirstChild("Face") then
L__1.Head.face.Transparency = 0
end
end
end
end
return
end
local v6, v7, v8 = v1(v2)
for v9,v10 in v6 do
else if v10:IsA("BasePart") then
if v10.Name ~= "HumanoidRootPart" then
v10.Transparency = 1
else if L__1.Head:FindFirstChild("Face") then
L__1.Head.face.Transparency = 1
end
end
end
end
v6()
return
end
local v11, v12, v13 = v6(v7)
for v14,v15 in v11 do
else if v15:IsA("BasePart") then
if v15.Name ~= "HumanoidRootPart" then
v15.Transparency = 0
end
end
end
else if v11 then
v11.Transparency = v12
end
end
end
end))
local L_Journal_7 = v42("Journal")
local L_Photos_8 = v43("Photos")
local L_Overview_9 = L_Journal_7:WaitForChild("Content"):WaitForChild("Overview")
toggleJournal = (function(a1, a2, a3) -- toggleJournal
if a2 == Enum.UserInputState.Begin then
L_Journal_7.Visible = not L_Journal_7.Visible
if not L_Journal_7.Visible then
local v1, v2, v3 = L_Photos_8:GetChildren()
for v4,v5 in v1 do
else if v5:IsA("Frame") then
local L_ViewportFrame_1 = v5:FindFirstChildOfClass("ViewportFrame")
else if L_ViewportFrame_1 then
v5.staticframe.Visible = true
L_ViewportFrame_1.Size = UDim2.new(0, 0, 0, 0)
L_ViewportFrame_1.Parent = L_Gui_1.Photos
end
end
end
return
end
if v1 == "Photos" then
local v6, v7, v8 = v1()
for v9,v10 in v6 do
v10.Size = L_ViewportFrame_1
v10.Parent = L_ViewportFrame_1
end
end
end
end)
u1.EzUI:Init()
local u46 = pairs(L_Journal_7:WaitForChild("Navigation"):GetChildren())
for v47,v48 in u46 do
else if v48:IsA("TextButton") then
v48.Activated:Connect((function()
else if L_Journal_7:WaitForChild("Content"):FindFirstChild(v48.Name) then
if L_Overview_9 then
L_Overview_9.Visible = false
L_Journal_7:WaitForChild("Navigation"):FindFirstChild(L_Overview_9.Name).TextColor3 = Color3.fromRGB(170, 170, 170)
end
L_Overview_9 = L_Journal_7:WaitForChild("Content"):FindFirstChild(v48.Name)
L_Journal_7:WaitForChild("Navigation"):FindFirstChild(v48.Name).TextColor3 = Color3.fromRGB(255, 255, 255)
if L_Overview_9.Name == "Photos" then
local v1, v2, v3 = L_Gui_1.Photos:GetChildren()
for v4,v5 in v1 do
v5.Size = UDim2.new(1, 0, 1, 0)
v5.Parent = L_Photos_8:FindFirstChild(v5.Name)
end
break
end
local v6, v7, v8 = v1()
for v9,v10 in v6 do
else if v10:IsA("Frame") then
local L_ViewportFrame_1 = v10:FindFirstChildOfClass("ViewportFrame")
else if L_ViewportFrame_1 then
L_ViewportFrame_1.Size = UDim2.new(0, 0, 0, 0)
L_ViewportFrame_1.Parent = L_Gui_1.Photos
end
end
end
v6.Visible = v7
end
end))
end
end
local u49 = nil
local u50 = nil
local u51 = {}
local L_GhostCheckboxes_10 = v48:WaitForChild("GhostCheckboxes")
local u52 = (function() -- updateEvidence
local v1, v2, v3 = pairs(L_GhostCheckboxes_10:GetChildren())
for v4,v5 in v1 do
else if v5:IsA("Frame") then
local v6, v7, v8 = pairs(u51)
for v9,v10 in v6 do
if not table.find(u10.Ghosts[v5.Name], v10) then
end
end
if true then
v6.Text = v7
if v6 ~= v7 then
v6.TextColor3 = v7
continue
end
v6.Text = v7
if v6 ~= v7 then
v6.TextColor3 = v7
end
end
end
end
end)
local v53, v54, v55 = pairs(v48:WaitForChild("EvidenceCheckboxes"):GetChildren())
for v56,v57 in v53 do
else if v57:IsA("Frame") then
local v58 = "Box"
v57:WaitForChild(v58).Activated:Connect((function()
v57:WaitForChild("Box"):WaitForChild("Selected").Visible = not v57:WaitForChild("Box"):WaitForChild("Selected").Visible
if u46 == 3 then
if v57:WaitForChild("Box"):WaitForChild("Selected").Visible then
u49:WaitForChild("Box"):WaitForChild("Selected").Visible = false
table.insert(u51, v57.Name)
table.remove(u51, table.find(u51, u49.Name))
end
end
if v57:WaitForChild("Box"):WaitForChild("Selected").Visible then
u46 = u46 + 1
table.insert(u51, v57.Name)
end
u46 = u46 - 1
table.remove(u51, table.find(u51, v57.Name))
u49 = v57
u52()
end))
end
end
local v59, v60, v61 = v53(v54)
for v62,v63 in v59 do
else if v63:IsA("Frame") then
v58 = "Box"
v63:WaitForChild(v58).Activated:Connect((function()
v63:WaitForChild("Box"):WaitForChild("Selected").Visible = not v63:WaitForChild("Box"):WaitForChild("Selected").Visible
if u50 then
u50:WaitForChild("Box"):WaitForChild("Selected").Visible = false
else if not u50:WaitForChild("TextLabel").Text:match("<s>") then
u50:WaitForChild("TextLabel").TextColor3 = Color3.fromRGB(255, 255, 255)
end
u50:WaitForChild("TextLabel").TextColor3 = Color3.fromRGB(170, 170, 170)
end
if v63:WaitForChild("Box"):WaitForChild("Selected").Visible then
u50 = v63
u50:WaitForChild("TextLabel").TextColor3 = Color3.fromRGB(208, 176, 94)
u9.ReplicatedStorage.Events.Guess:FireServer(u50.Name)
return
end
u50 = nil
end))
end
end
local L_Tools_11 = v60(v62)
local L_Tools_12 = v61(v63)
local u64 = nil
local v65, v66, v67 = v63(L_Tools_12:GetChildren())
for v68,v69 in v65 do
local v70 = "TextButton"
local L_TextButton_13 = v69:IsA(v70)
else if L_TextButton_13 then
L_TextButton_13 = v69.Activated
v70 = (function()
L_Tools_12.Parent.Visible = false
if u64 then
u64.Visible = false
end
u64 = L_Tools_11:FindFirstChild(v69.Name)
if u64 then
u64.Visible = true
end
warn("Invalid tool, cannot find page")
L_Tools_11.Visible = true
end)
L_TextButton_13(v70)
end
end
v65(v67)
v65(v67)
local L_Buttons_14 = v66(v68)
local L_Ghosts_15 = v67(v69)
local u71 = nil
local v72, v73, v74 = v69(L_TextButton_13)
for v75,v76 in v72 do
else if v76:IsA("TextButton") then
v76.Activated:Connect((function()
L_Buttons_14.Visible = false
if u71 then
u71.Visible = false
end
u71 = L_Ghosts_15:FindFirstChild(v76.Name)
if u71 then
u71.Visible = true
end
warn("Invalid ghost, cannot find page")
L_Ghosts_15.Visible = true
end))
end
end
v72(v74)
v72(v74)
v72(v74)
v72(v74)
v73 = v73(v75)
if v73 == "Console" then
v73 = task.spawn
v73(v74)
end
v73(v74)
local v77, v78, v79 = v74()
for v80,v81 in v77 do
if table.find(v73, v81:WaitForChild("NotePrompt").ObjectText) then
v81:Destroy()
end
end
v77(v79)
local u82 = false
v79(v81)
local v83 = v80.Binds
v80("Equip", equipTool, false, Enum.KeyCode.One, Enum.KeyCode.Two, Enum.KeyCode.Three, Enum.KeyCode.Four)
v80("Sprint", handleSprint, true, Enum[v83.Sprint.Type][v83.Sprint.Code], Enum.KeyCode.ButtonL3)
v80("Drop", dropTool, true, Enum[v83.Drop.Type][v83.Drop.Code], Enum.KeyCode.DPadDown)
v80("Journal", toggleJournal, true, Enum[v83.Journal.Type][v83.Journal.Code], Enum.KeyCode.ButtonY)
v80("Revive", v40, false, Enum[v83.Revive.Type][v83.Revive.Code], Enum.KeyCode.ButtonX)
v80("Headlight", v72, true, Enum[v83.Headlight.Type][v83.Headlight.Code], Enum.KeyCode.ButtonB)
v80("Switch", dpad, false, Enum.KeyCode.DPadLeft, Enum.KeyCode.DPadRight)
v80("Waypoint", v78, true, Enum[v83.Waypoint.Type][v83.Waypoint.Code], Enum.KeyCode.DPadUp)
local v84 = UDim2.new(1, -140, 1, -85)
v80("Sprint", v84)
local v85 = UDim2.new(1, -80, 1, -85)
v80("Drop", v85)
local v86 = UDim2.new(1, -80, 1, -145)
v80("Headlight", v86)
local v87 = UDim2.new(1, -140, 1, -145)
v80("Journal", v87)
v80("ToggleTool", u18)
local v88 = UDim2.new(1, -140, 1, -205)
v80("Waypoint", v88)
v80("Sprint", "rbxassetid://14055955942")
v80("Journal", "rbxassetid://14055956335")
v80("Drop", "rbxassetid://14055956661")
v80("ToggleTool", "rbxassetid://14055955684")
v80("Headlight", "rbxassetid://14055956487")
v80("Waypoint", "rbxassetid://14055957379")
