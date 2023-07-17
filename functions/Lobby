    local guiPath = plr.PlayerGui.ScreenGui.Home.Play

    local lobby = guiPath.Lobby
    local nav = guiPath.Navigation

    lobby.Visible = true
    nav.Visible = false

    local CreateLobby = events:WaitForChild("CreateLobby")
    local StartLobby = events:WaitForChild("StartLobby")
    local UpdateLobbyInfo = events:WaitForChild("UpdateLobbyInfo")

    local LobbyArgs = {[1] = "",[2] = 1,[3] = 0,[4] = "Private",[5] = "Classic",[6] = 4}
    local MapArgs = {[1] = "Map",[2] = "Asylum"}
    local DifficultyArgs = {[1] = "Difficulty",[2] = "Insanity"}

    CreateLobby:InvokeServer(unpack(LobbyArgs))

    UpdateLobbyInfo:FireServer(unpack(MapArgs))

    UpdateLobbyInfo:FireServer(unpack(DifficultyArgs))

    local function AddEquipment(Type, amount)
        local EquipRemote = events:WaitForChild("AddEquipment")
        local args = {[1] = Type,[2] = amount}
    
        EquipRemote:InvokeServer(unpack(args))
    end

    AddEquipment("Camera", 1)
    AddEquipment("Crucifix", 1)

    task.wait(1)

    StartLobby:InvokeServer()