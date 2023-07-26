local logger = Instance.new("ScreenGui")
logger.IgnoreGuiInset = false
logger.ResetOnSpawn = true
logger.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
logger.Name = "Logger"
logger.Parent = game.CoreGui

local container = Instance.new("Frame")
container.BackgroundColor3 = Color3.new(0.221103, 0.6425, 0.265588)
container.BackgroundTransparency = 0.9900000095367432
container.BorderColor3 = Color3.new(0, 0, 0)
container.BorderSizePixel = 0
container.Position = UDim2.new(0.237875283, 0, 0.1875, 0)
container.Size = UDim2.new(0, 605, 0, 322)
container.Visible = true
container.Name = "Container"
container.Parent = logger

local drop_shadow_holder = Instance.new("Frame")
drop_shadow_holder.BackgroundTransparency = 1
drop_shadow_holder.BorderSizePixel = 0
drop_shadow_holder.Size = UDim2.new(1, 0, 1, 0)
drop_shadow_holder.Visible = true
drop_shadow_holder.ZIndex = 0
drop_shadow_holder.Name = "DropShadowHolder"
drop_shadow_holder.Parent = container

local drop_shadow = Instance.new("ImageLabel")
drop_shadow.Image = "rbxassetid://6015897843"
drop_shadow.ImageColor3 = Color3.new(0, 0, 0)
drop_shadow.ImageTransparency = 0.5
drop_shadow.ScaleType = Enum.ScaleType.Slice
drop_shadow.SliceCenter = Rect.new(49, 49, 450, 450)
drop_shadow.AnchorPoint = Vector2.new(0.5, 0.5)
drop_shadow.BackgroundTransparency = 1
drop_shadow.BorderSizePixel = 0
drop_shadow.Position = UDim2.new(0.5, 0, 0.5, 0)
drop_shadow.Size = UDim2.new(1, 47, 1, 47)
drop_shadow.Visible = true
drop_shadow.ZIndex = 0
drop_shadow.Name = "DropShadow"
drop_shadow.Parent = drop_shadow_holder

local window = Instance.new("Frame")
window.AnchorPoint = Vector2.new(0.5, 0.5)
window.BackgroundColor3 = Color3.new(1, 1, 1)
window.BorderColor3 = Color3.new(0, 0, 0)
window.BorderSizePixel = 0
window.ClipsDescendants = true
window.Position = UDim2.new(0.5, 0, 0.5, 0)
window.Size = UDim2.new(1, 0, 1, 0)
window.Visible = true
window.ZIndex = 2
window.Name = "Window"
window.Parent = container

local uicorner = Instance.new("UICorner")
uicorner.Parent = window

local uigradient = Instance.new("UIGradient")
uigradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.new(0.3125, 0.0652778, 0.0652778)), ColorSequenceKeypoint.new(0.9990000128746033, Color3.new(0.2075, 0.0396556, 0.0396556)), ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))})
uigradient.Offset = Vector2.new(1, 0)
uigradient.Rotation = 1
uigradient.Parent = window

local shadows = Instance.new("Folder")
shadows.Name = "Shadows"
shadows.Parent = window

local image_label = Instance.new("ImageLabel")
image_label.Image = "rbxassetid://9405314976"
image_label.ImageTransparency = 0.800000011920929
image_label.AnchorPoint = Vector2.new(0.5, 0.5)
image_label.BackgroundColor3 = Color3.new(1, 1, 1)
image_label.BackgroundTransparency = 1
image_label.BorderColor3 = Color3.new(0, 0, 0)
image_label.BorderSizePixel = 0
image_label.Position = UDim2.new(0.499173552, 0, 0.25155279, 0)
image_label.Rotation = 180
image_label.Size = UDim2.new(0, 605, 0, 162)
image_label.Visible = true
image_label.ZIndex = 3
image_label.Parent = shadows

local uicorner_2 = Instance.new("UICorner")
uicorner_2.Parent = image_label

local image_label_2 = Instance.new("ImageLabel")
image_label_2.Image = "rbxassetid://9405314976"
image_label_2.ImageTransparency = 0.20000000298023224
image_label_2.AnchorPoint = Vector2.new(0.5, 0.5)
image_label_2.BackgroundColor3 = Color3.new(1, 1, 1)
image_label_2.BackgroundTransparency = 1
image_label_2.BorderColor3 = Color3.new(0, 0, 0)
image_label_2.BorderSizePixel = 0
image_label_2.Position = UDim2.new(0.499173552, 0, 0.74844718, 0)
image_label_2.Size = UDim2.new(0, 605, 0, 162)
image_label_2.Visible = true
image_label_2.ZIndex = 3
image_label_2.Parent = shadows

local uicorner_3 = Instance.new("UICorner")
uicorner_3.Parent = image_label_2

local scrolling_frame = Instance.new("ScrollingFrame")
scrolling_frame.AutomaticCanvasSize = Enum.AutomaticSize.Y
scrolling_frame.CanvasPosition = Vector2.new(0, 330)
scrolling_frame.ScrollBarImageColor3 = Color3.new(0, 0, 0)
scrolling_frame.ScrollBarImageTransparency = 1
scrolling_frame.Active = true
scrolling_frame.AnchorPoint = Vector2.new(0.5, 0.5)
scrolling_frame.BackgroundColor3 = Color3.new(1, 1, 1)
scrolling_frame.BackgroundTransparency = 0.9900000095367432
scrolling_frame.BorderColor3 = Color3.new(0, 0, 0)
scrolling_frame.BorderSizePixel = 0
scrolling_frame.Position = UDim2.new(0.5, 0, 0.511645973, 0)
scrolling_frame.Size = UDim2.new(0, 605, 0, 314)
scrolling_frame.Visible = true
scrolling_frame.ZIndex = 2
scrolling_frame.Parent = window

local uilist_layout = Instance.new("UIListLayout")
uilist_layout.Padding = UDim.new(0, 3)
uilist_layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
uilist_layout.SortOrder = Enum.SortOrder.LayoutOrder
uilist_layout.Parent = scrolling_frame

local template = Instance.new("Folder")
template.Name = "Template"
template.Parent = window

local minimize = Instance.new("ImageButton")
minimize.Image = "rbxassetid://9405925508"
minimize.AnchorPoint = Vector2.new(0.5, 0.5)
minimize.BackgroundColor3 = Color3.new(1, 1, 1)
minimize.BackgroundTransparency = 1
minimize.BorderColor3 = Color3.new(0, 0, 0)
minimize.BorderSizePixel = 0
minimize.Position = UDim2.new(0.949586809, 0, 0.0947204977, 0)
minimize.Size = UDim2.new(0, 31, 0, 31)
minimize.Visible = true
minimize.ZIndex = 4
minimize.Name = "Minimize"
minimize.Parent = window

local dragify = Instance.new("LocalScript")
dragify.Name = "Dragify"
dragify.Parent = container

local open = Instance.new("ImageButton")
open.Image = "rbxassetid://1050849759"
open.ImageColor3 = Color3.new(0.309804, 0, 0)
open.AnchorPoint = Vector2.new(0.5, 1)
open.BackgroundColor3 = Color3.new(1, 1, 1)
open.BackgroundTransparency = 1
open.BorderColor3 = Color3.new(0, 0, 0)
open.BorderSizePixel = 0
open.Position = UDim2.new(0.5, 0, 0.99000001, 0)
open.Rotation = 90
open.Size = UDim2.new(0, 50, 0, 50)
open.Visible = true
open.Name = "Open"
open.Parent = logger

local modules = {}


task.spawn(function()
	local script = dragify

	local oldreq = require
	local function require(target)
		if modules[target] then
			return modules[target]()
		end
		return oldreq(target)
	end

	local UIS = game:GetService("UserInputService")
	function dragify(Frame)
	    dragToggle = nil
	    local dragSpeed = 0.50
	    dragInput = nil
	    dragStart = nil
	    local dragPos = nil
	    function updateInput(input)
	        local Delta = input.Position - dragStart
	        local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
	        game:GetService("TweenService"):Create(Frame, TweenInfo.new(0.30), {Position = Position}):Play()
	    end
	    Frame.InputBegan:Connect(function(input)
	        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and UIS:GetFocusedTextBox() == nil then
	            dragToggle = true
	            dragStart = input.Position
	            startPos = Frame.Position
	            input.Changed:Connect(function()
	                if input.UserInputState == Enum.UserInputState.End then
	                    dragToggle = false
	                end
	            end)
	        end
	    end)
	    Frame.InputChanged:Connect(function(input)
	        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
	            dragInput = input
	        end
	    end)
	    game:GetService("UserInputService").InputChanged:Connect(function(input)
	        if input == dragInput and dragToggle then
	            updateInput(input)
	        end
	    end)
	end
	
	dragify(script.Parent)
end)

local function ConsoleEntry(...)
    local info = Instance.new("TextLabel")
    info.Font = Enum.Font.Code
    info.Text = ...
    info.TextColor3 = Color3.new(1, 1, 1)
    info.TextSize = 20
    info.TextXAlignment = Enum.TextXAlignment.Left
    info.AnchorPoint = Vector2.new(0.5, 0.5)
    info.BackgroundColor3 = Color3.new(1, 1, 1)
    info.BackgroundTransparency = 1
    info.BorderColor3 = Color3.new(0, 0, 0)
    info.BorderSizePixel = 0
    info.Position = UDim2.new(0.509917378, 0, 0.0365079381, 0)
    info.Size = UDim2.new(0.958677709, 0, 0, 23)
    info.Visible = true
    info.Name = "Info"
    info.Parent = scrolling_frame
end

local ConsoleInput
ConsoleInput = hookfunction(print, function(...)
    ConsoleEntry(...)
end)

