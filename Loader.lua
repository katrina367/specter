--!strict

Players = game:GetService("Players")
plr = Players.LocalPlayer

WS = game:GetService("Workspace")
rep = game:GetService("ReplicatedStorage")
TweenService = game:GetService("TweenService")
TSC = game:GetService("TextChatService")

events = rep.Events

function load(link)
    loadstring(game:HttpGet(link))()
end

local LobbyId = 8267733039
local GameId = 8417221956

if game.PlaceId == LobbyId then
    local library = require(rep:WaitForChild("Library"))
    local notification = library.Notification

    local function SendStartupNotif(text : string)
        notification.Create("Success", text)
    end

    SendStartupNotif("Starting Drastic's Specter AutoFarm")

    task.wait(1)

    SendStartupNotif("Lobby Detected.. Starting")
    print("Worked")
    load("https://raw.githubusercontent.com/dazscripts/specter/main/functions/InGame/Lobby.lua")
elseif game.PlaceId == GameId then
    EquipmentPath = WS.Equipment
    load("https://raw.githubusercontent.com/dazscripts/specter/main/functions/InGame/Main.lua")
end