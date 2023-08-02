--!strict
task.wait(20)
print("   -----------------------------------   Specter Autofarm V1.2 ALPHA   -----------------------------------   ")
print("  ----  CURRENT FEATURES  ----  " .. "  ----  FEATURES IN DEVELOPMENT  ----  ".. "  ----  FEATURES IN DEVELOPMENT  ----  ")

Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/Jxereas/UI-Libraries/main/notification_gui_library.lua", true))()

--[[
Notification.new("error", "Error Heading", "Error body message.") -- Args(<string> Type, <string> Heading, <string> Body, <boolean?> AutoRemoveNotif, <number?> AutoRemoveTime, <function?> OnCloseFunction)
Notification.new("success", "Success Heading", "Success body message.") -- Args(<string> Type, <string> Heading, <string> Body, <boolean?> AutoRemoveNotif, <number?> AutoRemoveTime, <function?> OnCloseFunction)
Notification.new("info", "Information Heading", "Information body message.") -- Args(<string> Type, <string> Heading, <string> Body, <boolean?> AutoRemoveNotif, <number?> AutoRemoveTime, <function?> OnCloseFunction)
Notification.new("warning", "Warning Heading", "Warning body message.") -- Args(<string> Type, <string> Heading, <string> Body, <boolean?> AutoRemoveNotif, <number?> AutoRemoveTime, <function?> OnCloseFunction)
Notification.new("message", "Message Heading", "Message body message.") -- Args(<string> Type, <string> Heading, <string> Body, <boolean?> AutoRemoveNotif, <number?> AutoRemoveTime, <function?> OnCloseFunction)

local notif = Notification.new("success", "Success", "Success body message.")
task.wait(3)
notif:changeHeading("New Heading") -- Args(<string> NewHeading)
notif:changeBody("New Body") -- Args(<string> NewBody)
notif:deleteTimeout(3) -- Args(<number> DeleteWaitTime)
]]

Players = game:GetService("Players")
plr = Players.LocalPlayer

for _, v in next, getconnections(plr.Idled) do
    v:Disable()
end

WS = game:GetService("Workspace")
rep = game:GetService("ReplicatedStorage")
TweenService = game:GetService("TweenService")
rs = game:GetService("RunService")

events = rep.Events

local LobbyId = 8267733039
local GameId = 8417221956

Notification.new("success", "Specter Autofarm V1.2 ALPHA", "Made by Drastic", true, 10)

if game.PlaceId == LobbyId then
    task.wait(1)
    Notification.new("Info", "Lobby Detected...", "Starting Autofarm", true, 3)
    loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/dazscripts/specter/main/functions/InGame/Lobby.lua"))()
elseif game.PlaceId == GameId then
    task.wait(1)
    Notification.new("Info", "InGame Detected...", "Starting Autofarm", true, 3)
    EquipmentPath = WS.Equipment
    loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/dazscripts/specter/main/functions/InGame/Main.lua"))()
end
