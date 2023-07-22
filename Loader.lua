--!strict

Players = game:GetService("Players")
plr = Players.LocalPlayer

rep = game:GetService("ReplicatedStorage")
events = rep.Events

local function load(link : string)
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
    load("https://github.com/dazscripts/specter/blob/main/functions/InGame/Lobby")
elseif game.PlaceId == GameId then
    load("https://github.com/dazscripts/specter/blob/main/functions/InGame/Main")
end