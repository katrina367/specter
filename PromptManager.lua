-- Decompiled by Electron BETA [ Made By (Co) ]
-- Path: Players.lolsusezezezlolol.PlayerScripts.ClientMain.Modules.PromptManager
local S_ReplicatedStorage_1 = game:GetService("ReplicatedStorage")
local u1 = {}
local S_UserInputService_2 = game:GetService("UserInputService")
local S_ProximityPromptService_3 = game:GetService("ProximityPromptService")
local S_TweenService_4 = game:GetService("TweenService")
local v2 = "TextService"
local S_TextService_5 = game:GetService(v2)
local S_Players_6 = game:GetService("Players")
v2.HandlePrompt = (function(a1, a2) -- HandlePrompt
if a1.Name == "PickupPrompt" then
local v1 = (function() -- PlaySwing
if not u1.SwingUpDown thenor a2.Character 
else if a2.Character:FindFirstChild("Humanoid"):FindFirstChild("Animator") then
u1.SwingUpDown = a2.Character.Humanoid.Animator:LoadAnimation(S_ReplicatedStorage_1:WaitForChild("Animations"):WaitForChild("ArmSwingUpDown"))
return
u1.SwingUpDown:Play()
end
end)
v1()
S_ReplicatedStorage_1.Events.Pickup:InvokeServer(a1.Parent.Parent)
return
else if a1.Name == "LightswitchPrompt" then
v1()
S_ReplicatedStorage_1.Events.Lightswitch:FireServer(a1.Parent.Parent)
return
else if a1.Name == "LightPrompt" then
S_ReplicatedStorage_1.Events.LightCandle:FireServer(a1.Parent.Parent)
return
else if a1.Name == "LuxuryLaptopPrompt" then
S_ReplicatedStorage_1.Events.LuxuryLaptop:FireServer(a1.Parent.Parent)
a1.Enabled = false
return
else if a1.Name == "NotePrompt" then
S_ReplicatedStorage_1.Events.CollectNote:FireServer(a1)
a1.Parent:Destroy()
return
else if a1.Name == "OccultCard" then
S_ReplicatedStorage_1.Events.OccultPrompt:Fire(a2, true)
end
end)
v2.Customize = (function(a1) -- Customize
local L_PlayerGui_1 = S_Players_6.LocalPlayer:WaitForChild("PlayerGui")
local u1 = {}
u1[Enum.KeyCode.ButtonX] = "rbxasset://textures/ui/Controls/xboxX.png"
u1[Enum.KeyCode.ButtonY] = "rbxasset://textures/ui/Controls/xboxY.png"
u1[Enum.KeyCode.ButtonA] = "rbxasset://textures/ui/Controls/xboxA.png"
u1[Enum.KeyCode.ButtonB] = "rbxasset://textures/ui/Controls/xboxB.png"
u1[Enum.KeyCode.DPadLeft] = "rbxasset://textures/ui/Controls/dpadLeft.png"
u1[Enum.KeyCode.DPadRight] = "rbxasset://textures/ui/Controls/dpadRight.png"
u1[Enum.KeyCode.DPadUp] = "rbxasset://textures/ui/Controls/dpadUp.png"
u1[Enum.KeyCode.DPadDown] = "rbxasset://textures/ui/Controls/dpadDown.png"
u1[Enum.KeyCode.ButtonSelect] = "rbxasset://textures/ui/Controls/xboxmenu.png"
u1[Enum.KeyCode.ButtonL1] = "rbxasset://textures/ui/Controls/xboxLS.png"
u1[Enum.KeyCode.ButtonR1] = "rbxasset://textures/ui/Controls/xboxRS.png"
local u2 = {}
u2[Enum.KeyCode.Backspace] = "rbxasset://textures/ui/Controls/backspace.png"
u2[Enum.KeyCode.Return] = "rbxasset://textures/ui/Controls/return.png"
u2[Enum.KeyCode.LeftShift] = "rbxasset://textures/ui/Controls/shift.png"
u2[Enum.KeyCode.RightShift] = "rbxasset://textures/ui/Controls/shift.png"
u2[Enum.KeyCode.Tab] = "rbxasset://textures/ui/Controls/tab.png"
local u3 = {}
u3.' = "rbxasset://textures/ui/Controls/apostrophe.png"
u3., = "rbxasset://textures/ui/Controls/comma.png"
u3.` = "rbxasset://textures/ui/Controls/graveaccent.png"
u3.. = "rbxasset://textures/ui/Controls/period.png"
u3.  = "rbxasset://textures/ui/Controls/spacebar.png"
local u4 = {}
u4[Enum.KeyCode.LeftControl] = "Ctrl"
u4[Enum.KeyCode.RightControl] = "Ctrl"
u4[Enum.KeyCode.LeftAlt] = "Alt"
u4[Enum.KeyCode.RightAlt] = "Alt"
u4[Enum.KeyCode.F1] = "F1"
u4[Enum.KeyCode.F2] = "F2"
u4[Enum.KeyCode.F3] = "F3"
u4[Enum.KeyCode.F4] = "F4"
u4[Enum.KeyCode.F5] = "F5"
u4[Enum.KeyCode.F6] = "F6"
u4[Enum.KeyCode.F7] = "F7"
u4[Enum.KeyCode.F8] = "F8"
u4[Enum.KeyCode.F9] = "F9"
u4[Enum.KeyCode.F10] = "F10"
u4[Enum.KeyCode.F11] = "F11"
u4[Enum.KeyCode.F12] = "F12"
local u5 = (function(a1, a2) -- createProgressBarGradient
local v1 = Instance.new("Frame")
v1.Size = UDim2.fromScale(0.5, 1)
if a2 then
end
v1.Position = UDim2.fromScale(0.5, 0)
v1.BackgroundTransparency = 1
v1.ClipsDescendants = true
v1.Parent = a1
local v2 = Instance.new("ImageLabel")
v2.BackgroundTransparency = 1
v2.Size = UDim2.fromScale(2, 1)
if a2 then
end
v2.Position = UDim2.fromScale(-1, 0)
v2.Image = "rbxasset://textures/ui/Controls/RadialFill.png"
v2.Parent = v1
local v3 = Instance.new("UIGradient")
v3.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.4999, 0), NumberSequenceKeypoint.new(0.5, 1), NumberSequenceKeypoint.new(1, 1)})
if a2 then
end
v3.Rotation = 0
v3.Parent = v2
return v3
end)
local u6 = (function() -- createCircularProgressBar
local v1 = Instance.new("Frame")
v1.Name = "CircularProgressBar"
v1.Size = UDim2.fromOffset(58, 58)
v1.AnchorPoint = Vector2.new(0.5, 0.5)
v1.Position = UDim2.fromScale(0.5, 0.5)
v1.BackgroundTransparency = 1
local u2 = u5(v1, true)
local u3 = u5(v1, false)
local v4 = Instance.new("NumberValue")
v4.Name = "Progress"
v4.Parent = v1
v4.Changed:Connect((function(a1)
local v1 = (a1 * 360, 0, 360)
u2.Rotation = 0(v1, 180, 360)
u3.Rotation = 0(v1, 180, 360)(v1, 0, 180)
end))
return v1
end)
local u7 = (function(a1, a2, a3) -- createPrompt
local u1 = {}
local u2 = {}
local u3 = {}
local u4 = {}
local u5 = Instance.new("BillboardGui")
u5.Name = "Prompt"
u5.AlwaysOnTop = true
local v6 = Instance.new("Frame")
v6.Size = UDim2.fromScale(0.5, 1)
v6.BackgroundTransparency = 1
v6.BackgroundColor3 = Color3.new(0.07, 0.07, 0.07)
v6.Parent = u5
Instance.new("UICorner").Parent = v6
local v7 = Instance.new("Frame")
v7.Name = "InputFrame"
v7.Size = UDim2.fromScale(1, 1)
v7.BackgroundTransparency = 1
v7.SizeConstraint = Enum.SizeConstraint.RelativeYY
v7.Parent = v6
local v8 = Instance.new("Frame")
v8.Size = UDim2.fromScale(1, 1)
v8.Position = UDim2.fromScale(0.5, 0.5)
v8.AnchorPoint = Vector2.new(0.5, 0.5)
v8.BackgroundTransparency = 1
v8.Parent = v7
Instance.new("UIScale").Parent = v8
if a2 == Enum.ProximityPromptInputType.Touch then
end
local v9 = Instance.new("UIScale")
local v10 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
Enum.ProximityPromptInputType.Touch(u1, S_TweenService_4:Create(v9, v10, {Scale = 1.33}))
Enum.ProximityPromptInputType.Touch(u2, S_TweenService_4:Create(v9, v10, {Scale = 1}))
local u11 = Instance.new("TextLabel")
u11.Name = "ActionText"
u11.Size = UDim2.fromScale(1, 1)
u11.Font = Enum.Font.Merriweather
u11.TextSize = 20
u11.BackgroundTransparency = 1
u11.TextTransparency = 1
u11.TextColor3 = Color3.fromRGB(255, 255, 255)
u11.TextXAlignment = Enum.TextXAlignment.Left
u11.Parent = v6
Enum.TextXAlignment.Left(u1, S_TweenService_4:Create(u11, v10, {TextTransparency = 1}))
Enum.TextXAlignment.Left(u2, S_TweenService_4:Create(u11, v10, {TextTransparency = 0}))
Enum.TextXAlignment.Left(u3, S_TweenService_4:Create(u11, v10, {TextTransparency = 1}))
local v12 = S_TweenService_4:Create(u11, v10, {TextTransparency = 0})
Enum.TextXAlignment.Left(u4, v12)
local u13 = Instance.new("TextLabel")
u13.Name = "ObjectText"
u13.Size = UDim2.fromScale(v12, 1)
u13.Font = Enum.Font.Merriweather
u13.TextSize = 17
u13.BackgroundTransparency = 1
u13.TextTransparency = 1
u13.TextColor3 = Color3.fromRGB(v12, 230, 230)
u13.TextXAlignment = Enum.TextXAlignment.Left
u13.Parent = v6
Enum.TextXAlignment.Left(v12, S_TweenService_4:Create(u13, v10, {TextTransparency = 1}))
Enum.TextXAlignment.Left(v12, S_TweenService_4:Create(u13, v10, {TextTransparency = 0}))
Enum.TextXAlignment.Left(v12, S_TweenService_4:Create(u13, v10, {TextTransparency = 1}))
Enum.TextXAlignment.Left(v12, S_TweenService_4:Create(u13, v10, {TextTransparency = 0}))
Enum.TextXAlignment.Left(v12, S_TweenService_4:Create(v6, v10, {Size = UDim2.fromScale(0.5, 1), BackgroundTransparency = 1}))
Enum.TextXAlignment.Left(v12, S_TweenService_4:Create(v6, v10, {Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1}))
Enum.TextXAlignment.Left(v12, S_TweenService_4:Create(v6, v10, {Size = UDim2.fromScale(0.5, 1), BackgroundTransparency = 1}))
local v14 = UDim2.fromScale(1, 1)
Enum.TextXAlignment.Left(v12, S_TweenService_4:Create(v6, v10, {Size = v14, BackgroundTransparency = v14}))
local v15 = Enum.ProximityPromptInputType.Gamepad
if a2 == v15 then
v12 = u1
v15 = v12[a1.GamepadKeyCode]
if v15 then
v15 = Instance.new
v12 = "ImageLabel"
local v16 = v15(v12)
v12 = "ButtonImage"
v16.Name = v12
v12 = Vector2.new
local v17 = 0.5
v12 = v12(0.5, v17)
v16.AnchorPoint = v12
v12 = UDim2.fromOffset
v12 = v12(24, v17)
v16.Size = v12
v12 = UDim2.fromScale
v17 = 0.5
v12 = v12(0.5, v17)
v16.Position = v12
v16.BackgroundTransparency = v12
v16.ImageTransparency = v12
v17 = a1.GamepadKeyCode
v12 = u1[v17]
v16.Image = v12
v16.Parent = v8
v17 = S_TweenService_4
local v18 = TweenInfo.new(0.06, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
v14.ImageTransparency = 1
v17 = v17(v16, v18, v14)
v12(u3, v17)
v17 = S_TweenService_4
v14.ImageTransparency = 0
v17 = v17(v16, v18, v14)
v12(u4, v17)
v16 = Enum.ProximityPromptInputType.Touch
else if a2 == v16 then
v16 = Instance.new
v12 = "ImageLabel"
local v19 = v16(v12)
v12 = "ButtonImage"
v19.Name = v12
v19.BackgroundTransparency = v12
v19.ImageTransparency = v12
v12 = UDim2.fromOffset
v12 = v12(25, v17)
v19.Size = v12
v12 = Vector2.new
v17 = 0.5
v12 = v12(0.5, v17)
v19.AnchorPoint = v12
v12 = UDim2.fromScale
v17 = 0.5
v12 = v12(0.5, v17)
v19.Position = v12
v12 = "rbxasset://textures/ui/Controls/TouchTapIcon.png"
v19.Image = v12
v19.Parent = v8
v17 = S_TweenService_4
v14.ImageTransparency = 1
v17 = v17(v19, v18, v14)
v12(u3, v17)
v17 = S_TweenService_4
v14.ImageTransparency = 0
v12(u4, v17)
end
local v20 = v19(v12)
v20.Name = v12
v20.BackgroundTransparency = v12
v20.ImageTransparency = v12
v20.Size = v12
v20.AnchorPoint = v12
v20.Position = v12
v20.Image = v12
v20.Parent = v8
v14.ImageTransparency = 1
v12(u3, v17)
v14.ImageTransparency = 0
v12(u4, v17)
v17 = u2
local v21 = a1.KeyboardKeyCode
if v17[v21] == nil then
v17 = u3
end
else if v17[v12] == nil then
v21 = u4
v17 = v21[a1.KeyboardKeyCode]
if v17 then
end
if v17[v12] then
local v22 = Instance.new
v21 = "ImageLabel"
local v23 = v22(v21)
v21 = "ButtonImage"
v23.Name = v21
v21 = Vector2.new
v21 = v21(0.5, 0.5)
v23.AnchorPoint = v21
v21 = UDim2.fromOffset
v21 = v21(36, 36)
v23.Size = v21
v21 = UDim2.fromScale
v21 = v21(0.5, 0.5)
v23.Position = v21
v23.BackgroundTransparency = v21
v23.ImageTransparency = v21
v23.Image = v17[v12]
v23.Parent = v8
v21(u3, S_TweenService_4:Create(v23, v18, {ImageTransparency = 1}))
v21(u4, S_TweenService_4:Create(v23, v18, {ImageTransparency = 0}))
else if v12 ~= nil then
if v12 ~= "" then
local v24 = Instance.new
v21 = "TextLabel"
local v25 = v24(v21)
v21 = "ButtonText"
v25.Name = v21
v21 = UDim2.fromOffset
v21 = v21(0, -1)
v25.Position = v21
v21 = UDim2.fromScale
v21 = v21(1, 1)
v25.Size = v21
v21 = Enum.Font.Merriweather
v25.Font = v21
v25.TextSize = v21
v21 = string.len
if 2 < v21 then
v25.TextSize = v21
end
v25.BackgroundTransparency = v21
v25.TextTransparency = v21
v25.TextColor3 = v21
v25.TextXAlignment = v21
v25.Text = v12
v25.Parent = v8
v25.AutoLocalize = v21
v21(u3, S_TweenService_4:Create(v25, v18, {TextTransparency = 1}))
v21(u4, S_TweenService_4:Create(v25, v18, {TextTransparency = 0}))
end
end
local v26 = "' has an unsupported keycode for rendering UI: "
v21 = "ProximityPrompt '" .. a1.Name .. v26 .. tostring(a1.KeyboardKeyCode)
v25(v21)
end
if a2 ~= v20 then
if v20 then
end
local v27 = v20(v12)
v27.BackgroundTransparency = v12
v27.TextTransparency = v12
v27.Size = v12
v27.Parent = u5
local u28 = false
v21 = (function(a1)
if a1.UserInputType ~= Enum.UserInputType.Touch then
if a1.UserInputType == Enum.UserInputType.MouseButton1 then
end
if a1.UserInputState ~= Enum.UserInputState.Change then
a1:InputHoldBegin()
u28 = true
end
end
end)
v27.TweenInfo:Connect(v21)
v21 = (function(a1)
if a1.UserInputType ~= Enum.UserInputType.Touch then
else if a1.UserInputType == Enum.UserInputType.MouseButton1 or u28 
u28 = false
a1:InputHoldEnd()
end)
v27.InputEnded:Connect(v21)
u5.Active = true
end
if u28 < v27 then
local v29 = v27()
v29.Parent = v8
local v30 = TweenInfo.new(a1.HoldDuration, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
v26.Value = 1
u28(u1, v25)
local v31 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
v26.Value = 0
u28(u2, v25)
end
local u32 = nil
local u33 = nil
local u34 = nil
local u35 = nil
v21 = a1.HoldDuration
if 0 < v21 then
v21 = a1.PromptButtonHoldBegan
local L__1 = v21((function()
local v1, v2, v3 = ipairs(u1)
for v4,v5 in v1 do
v5:Play()
end
end))
L__1 = a1.PromptButtonHoldEnded
end
local L_L__1_2 = a1.Changed:Connect(v26)
L__1()
u5.Adornee = a1.Parent
u5.Parent = a3
local v36, v37, v38 = ipairs(v26)
for v39,v40 in v36 do
v40:Play()
end
return v36
end)
S_ProximityPromptService_3.PromptShown:Connect((function(a1, a2)
if a1.Style == Enum.ProximityPromptStyle.Default then
return
end
local L_ProximityPrompts_1 = L_PlayerGui_1:FindFirstChild("ProximityPrompts")
if L_ProximityPrompts_1 == nil then
local v1 = Instance.new("ScreenGui")
L_ProximityPrompts_1.Name = v1
L_ProximityPrompts_1.ResetOnSpawn = v1
L_ProximityPrompts_1.Parent = v1
end
local v2 = L_ProximityPrompts_1
v1()
v1()
end))
LocalPlayer = (function() -- startLoad
mainGUI.Loading.Visible = true
local v1 = S_ReplicatedStorage_1.Map.Value
mainGUI.Loading.MapName.Text = string.upper(v1)
coroutine.wrap((function()

while true dotask.wait(0.5)
for v1 = 1, 3 do
task.wait(0.5)
mainGUI.Loading.Loading.Text = "LOADING" .. string.rep(".", v1)
end
end
end))()
while true do
task.wait()
local v2 = mainGUI.Loading.Circle
v2.Rotation = v2.Rotation - 4
end
end)
end)
return v2
