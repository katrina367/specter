--!strict

print("   -----------------------------------   Specter Autofarm V0.04 BETA   -----------------------------------   ")
print("  ----  CURRENT FEATURES  ----  " .. "  ----  FEATURES IN DEVELOPMENT  ----  ".. "  ----  FEATURES IN DEVELOPMENT  ----  ")

Players = game:GetService("Players")
plr = Players.LocalPlayer

WS = game:GetService("Workspace")
rep = game:GetService("ReplicatedStorage")
TweenService = game:GetService("TweenService")

events = rep.Events

function load(link)
    loadstring(game:HttpGet(link))()
end

local LobbyId = 8267733039
local GameId = 8417221956

if rep:FindFirstChild("Library") then
    local notification = require(rep.Library).Notification
    function SuccessNotif(text : string)
        notification.Create("Success", text)
    end
elseif plr.PlayerScripts:FindFirstChild("ClientMain").Modules.NotificationManager then
    local notification = require(plr.PlayerScripts.ClientMain.Modules.NotificationManager)
    function SuccessNotif(text : string)
        notification:Create("Success", text)
    end
    function FailNotif(text : string)
        notification:Create("Error", text)
    end
end

SuccessNotif("Starting Drastic's Specter AutoFarm")

if game.PlaceId == LobbyId then
    task.wait(1)
    SuccessNotif("Lobby Detected.. Starting")
    load("https://raw.githubusercontent.com/dazscripts/specter/main/functions/InGame/Lobby.lua")
elseif game.PlaceId == GameId then
    task.wait(1)
    SuccessNotif("Ingame Detected.. Starting")
    ClientMain = getsenv(plr.PlayerScripts.ClientMain)
    EquipmentPath = WS.Equipment
    load("https://raw.githubusercontent.com/dazscripts/specter/main/functions/InGame/Main.lua")
end
