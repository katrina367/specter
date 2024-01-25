--!strict
repeat task.wait() until game:IsLoaded()

Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/dazscripts/specter/main/functions/InGame/Extra/Notifications.lua", true))()

Notification.new("success", "Specter Autofarm V1.3 ALPHA", "Made by Drastic", true, 3)

Players = game:GetService("Players")
plr = Players.LocalPlayer

for _, v in next, getconnections(plr.Idled) do
    v:Disable()
end

WS = game:GetService("Workspace")
rep = game:GetService("ReplicatedStorage")
TweenService = game:GetService("TweenService")
rs = game:GetService("RunService")
UI = loadstring(game:GetObjects("rbxassetid://15900013841")[1].Source)()

events = rep:WaitForChild("Events")

local LobbyId = 8267733039
local GameId = 8417221956

if game.PlaceId == LobbyId then
    task.wait(3)
    Notification.new("Info", "Lobby Detected...", "Starting Autofarm", true, 3)
    loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/dazscripts/specter/main/functions/InGame/Lobby.lua"))()
elseif game.PlaceId == GameId then
    task.wait(10)
    Notification.new("Info", "InGame Detected...", "Starting Autofarm", true, 3)
    EquipmentPath = WS.Equipment
    loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/dazscripts/specter/main/functions/InGame/Main.lua"))()
end
