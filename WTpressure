-- src leaked by 25ms

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local UserInputService = game:GetService("UserInputService")
local lockerArray = {}
local livingMonsterTP = false
local generatorArray = {}
local fixedGeneratorArray = {}
local monstersArray = {}
local moneyArray = {}
local keycards = {}
local moneyFarmEnable = false
local monsterTpEnable = false
local keyCardESPObjects = {}
local monstersESPObjects = {}
local generatorESPObjects = {}
local detectedMonsters = {}
local localDoor = {}
local doorsESPObjects = {}
local doorArray = {}
local itemsArray = {}
local itemsESPObjects = {}
local monstersEnabled = false
local monsterLockerEnabled = false
local searchLightEnabled = false
local squiddleEnabled = false
local keyCardEnabled = false
local generatorEnabled = false
local itemEnabled = false
local doorEnabled = false
local previousDoorESP  = nil 
local monsterLocker = {}
local squiddles = {}
local render = false
local tempDoor = nil

local Window = Fluent:CreateWindow({
    Title = "WT | Pressure",
    SubTitle = "cracked by 25ms",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "house-plus" }),
    Visuals = Window:AddTab({ Title = "Visuals", Icon = "eye" }),
    Teleports = Window:AddTab({ Title = "Teleports", Icon = "map" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

Fluent:Notify({
    Title = "cracked by 25ms | Last Update:",
    Content = "2024-07-25",
    SubContent = "v2.5",
    Duration = 5
})

local FullbrightToggle = Tabs.Visuals:AddToggle("Fullbright", {Title = "Fullbright", Default = true})
local DoorESP = Tabs.Visuals:AddToggle("DoorESP", { Title = "Doors ESP", Default = false })
local MonstersESP = Tabs.Visuals:AddToggle("MonstersESP", { Title = "Monsters ESP", Default = false })
local ItemsESP = Tabs.Visuals:AddToggle("ItemsESP", { Title = "Items ESP", Default = false })
local KeyCardsESP = Tabs.Visuals:AddToggle("KeyCardsESP", { Title = "Key Cards ESP", Default = false })
local GeneratorESP = Tabs.Visuals:AddToggle("GeneratorESP", { Title = "Generator ESP", Default = false })
local DestroySquiddles = Tabs.Visuals:AddToggle("DestroySquiddles", { Title = "Remove Squiddles", Default = false })
local DestroyMonsterLocker = Tabs.Visuals:AddToggle("DestroyMonsterLocker", { Title = "Remove MonsterLocker", Default = false })
local MoneyFarm = Tabs.Visuals:AddToggle("MoneyFarm", {Title = "Farm Money", Description = "Hotkey : NumPad 5", Default = false})


local WalkSpeedSlider = Tabs.Main:AddSlider("WalkSpeedSlider", {
    Title = "Walk Speed",
    Description = "Adjust the player's walk speed",
    Default = 16,
    Min = 0,
    Max = 25,
    Rounding = 1,
    Callback = function(Value)
        local player = game.Players.LocalPlayer
        if player and player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
            player.Character.Humanoid.WalkSpeed = Value
        end
    end
})

WalkSpeedSlider:OnChanged(function(Value)
end)

WalkSpeedSlider:SetValue(16)

local FOVSlider = Tabs.Main:AddSlider("FOVSlider", {
    Title = "FOV",
    Description = "Adjust the player's field of view",
    Default = 70,
    Min = 0,
    Max = 120,
    Rounding = 1,
    Callback = function(Value)
        local player = game.Players.LocalPlayer
        if player and player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
            local camera = game.Workspace.CurrentCamera
            camera.FieldOfView = Value
        end
    end
})

FOVSlider:OnChanged(function(Value)
end)

FOVSlider:SetValue(70)

-- ===================================================== SOME READS
-- MULTI FINDER

local function findRooms()
    for _, object in pairs(workspace:GetChildren()) do
        if object:IsA("Folder") and object.Name == "Rooms" then
            return object:GetChildren()
        end
    end
    return nil
end

local function findPreLastRoom()
    local rooms = findRooms()
    if rooms and #rooms > 1 then
        local prelastRoom = rooms[#rooms - 1]
        if prelastRoom then
            return prelastRoom
        else
            print("No pre-last room found")
        end
    end
end


local function checkRenderCondition()
    while true do 
        if monstersEnabled or monsterLockerEnabled or searchLightEnabled or keyCardEnabled or generatorEnabled or itemEnabled or doorEnabled then
            local preLastDoor = findPreLastRoom()
            if tempDoor then
                if tempDoor ~= preLastDoor then
                    render = true
                    tempDoor = preLastDoor
                else
                    render = false
                end
                task.wait(1)
            else
                tempDoor = preLastDoor
            end
            task.wait(1)
        else
            render = false
            task.wait(1)
        end
    end
end


local function multiFinder()
    monstersArray = {}
    keycards = {}
    generatorArray = {}
    fixedGeneratorArray = {}
    itemsArray = {}
    doorArray = {}
    monsterLocker = {}
    squiddles = {}

    if monstersEnabled or searchLightEnabled or keyCardEnabled or generatorEnabled or itemEnabled or doorEnabled then
        for _,object in pairs(workspace:GetDescendants()) do
            if object:IsA("Model") or object:IsA("Part") then
                if monstersEnabled then
                    if object:IsA("Part") then
                        if object.Name == "Angler" 
                        or object.Name == "Pinkie" 
                        or object.Name == "Froger" 
                        or object.Name == "Blitz" 
                        or object.Name == "Chainsmoker" 
                        or object.Name == "Pandemonium" 
                        or object.Name == "Eyefestation" 
                        or object.Name == "Styx" 
                        or object.Name == "Mirage"
                        or object.Name == "Z-130"
                        or object.Name == "A-60"
                        or object.Name == "TheMulti-Monster"
                        or object.Name == "RunEnder"
                        or object.Name == "Z-90"
                        or object.Name == "WallDwellers"
                        or object.Name == "Amalgamation"
                        or object.Name == "RidgeAngler" 
                        or object.Name == "RidgePinkie" 
                        or object.Name == "RidgeFroger" 
                        or object.Name == "RidgeBlitz" 
                        or object.Name == "RidgeChainsmoker" 
                        or object.Name == "RidgePandemonium" 
                        or object.Name == "RidgeEyefestation" 
                        or object.Name == "RidgeStyx" then
                            table.insert(monstersArray, object)

                            if not detectedMonsters[object] then
                                detectedMonsters[object] = true
                                Fluent:Notify({
                                    Title = "Warning",
                                    Content = "Watch out " .. object.Name .. " is coming!",
                                    Duration = 8
                                })
                            end

                        end
                    end
                end

                -- if monsterLockerEnabled then
                --     if object.Name == "MonsterLocker" then
                --         table.insert(monsterLocker, object)
                --     end
                -- end

                -- if squiddleEnabled then
                --     if object.Name == "SquiddleBuildup" and object.Parent and object.Parent.Name == "Face" then
                --         local face = object.Parent
                --         local Squiddle = face.Parent
                --         if Squiddle then
                --             table.insert(squiddles, Squiddle)
                --         end
                --     end
                -- end

                if keyCardEnabled then
                    if object:IsA("Model") and object.Parent.Parent.Name ~= "Characters" then
                        if object.Name == "NormalKeyCard" then
                            local keycardPart = object:FindFirstChild("NumberPart")
                            if keycardPart then
                                table.insert(keycards, keycardPart)
                            end
                        elseif object.Name == "InnerKeyCard" then
                            local keycardPart = object:FindFirstChild("Logo")
                            if keycardPart then
                                table.insert(keycards, keycardPart)
                            end
                        elseif object.Name == "RidgeKeyCard" then
                            local keycardPart = object:FindFirstChild("Logo")
                            if keycardPart then
                                table.insert(keycards, keycardPart)
                            end
                        end
                    end
                end

                if generatorEnabled then
                    if object:IsA("Model") then
                        if object.Name == "Generator" or object.Name == "EncounterGenerator" or object.Name == "BrokenCables" then
                            if object.Name == "Generator" or object.Name == "EncounterGenerator" then
                                local fixed = object:FindFirstChild("Fixed")
                                if fixed.Value == 0 then
                                    local generator = object:FindFirstChild("Part")
                                    if generator then
                                        table.insert(generatorArray, generator)
                                    end
                                elseif fixed.Value == 100 then
                                    local generator = object:FindFirstChild("Part")
                                    if generator then
                                        table.insert(fixedGeneratorArray, generator)
                                    end
                                end
                            end
                
                            if object.Name == "BrokenCables" then
                                local fixed = object:FindFirstChild("Fixed")
                                if fixed.Value == 0 then
                                    local generator = object:FindFirstChild("ProxyPart")
                                    if generator then
                                        table.insert(generatorArray, generator)
                                    end
                                elseif fixed.Value == 100 then
                                    local generator = object:FindFirstChild("Part")
                                    if generator then
                                        table.insert(fixedGeneratorArray, generator)
                                    end
                                end
                            end
                        end
                    end
                end

                if itemEnabled then
                    if object:IsA("Model") then
                        if object.Name == "Medkit" then
                            local zItem = object:FindFirstChild("Part")
                            table.insert(itemsArray,zItem)
                        end
                    end
                end

                if doorEnabled then
                    if object.Name == "NormalDoor" and object:IsA("Part") then
                        table.insert(doorArray, object)
                    end
                end

            end
        end
    end
end



local function doFindAll()
    while true do
        if monstersEnabled or monsterLockerEnabled or searchLightEnabled or keyCardEnabled or generatorEnabled or itemEnabled or doorEnabled then
            if render then
                multiFinder()
            end
        end
        task.wait(.6)
    end
end


-- =====================================================
-- ROOMS



local function findLastRoom()
    local rooms = findRooms()
    if rooms then
        local lastRoom = rooms[#rooms]
        if lastRoom then
            return lastRoom
        end
    end
end




local function tpToLastRoom()
    local lastRoom = findLastRoom()
    if lastRoom then
        local roomStart = lastRoom:FindFirstChild("NormalDoor")
        if roomStart then
            local player = game.Players.LocalPlayer
            player.Character.HumanoidRootPart.CFrame = roomStart.CFrame
        end
    end

end


local function tpToLastRoomOpened()
    local preLastRoom = findPreLastRoom()
    if preLastRoom then
        local exits = preLastRoom:FindFirstChild("Exits")
        if exits then
            local exitRoom = exits:FindFirstChild("1")
            if exitRoom then
                local player = game.Players.LocalPlayer
                player.Character.HumanoidRootPart.CFrame = exitRoom.CFrame
            end
        end
    end
end

local function tpToOUTOFLastRoomOpened()
    local lastRoom = findLastRoom()
    if lastRoom then
        local roomStart = lastRoom:FindFirstChild("NormalDoor")
        if roomStart then           
                local player = game.Players.LocalPlayer
                local targetCFrame = roomStart.CFrame * CFrame.new(0, 60, 0)
                player.Character.HumanoidRootPart.CFrame = targetCFrame
        end
    end
end
local function tpToLastRoom()
    local lastRoom = findLastRoom()
    if lastRoom then
        local roomStart = lastRoom:FindFirstChild("NormalDoor")
        if roomStart then
            local player = game.Players.LocalPlayer
            player.Character.HumanoidRootPart.CFrame = roomStart.CFrame
        end
    end

end


-- =====================================================
-- LOCKERS

local function findLockers()
    lockerArray = {}
    local preLastRoom = findPreLastRoom()
    if preLastRoom then
        for _, locker in pairs(preLastRoom:GetChildren()) do
            if locker:IsA("Model") and locker.Name == "Locker" then
                table.insert(lockerArray, locker)
            end
        end
    end
end

local function findLastLocker()
    if #lockerArray > 0 then
        local randomIndex = math.random(1, #lockerArray)
        local lastLocker = lockerArray[randomIndex]
        if lastLocker then
            return lastLocker
        end
    end
end


local function tpToLastLocker()
    findLockers()
    local lastLocker = findLastLocker()
    if lastLocker then
        local lockerFace = lastLocker:FindFirstChild("Start")
        if lockerFace then
            local player = game.Players.LocalPlayer
            player.Character.HumanoidRootPart.CFrame = lockerFace.CFrame
        end
    end
end


-- =====================================================
-- Monsters


local function deleteSearchLight()
    for _,object in pairs(workspace:GetDescendants()) do
        if object.Name == "MainSearchlight" or object.Name == "Searchlights1" or object.Name == "Searchlights2" or object.Name == "Searchlights3" or object.Name == "SearchlightsCave" then
            for _, child in pairs(object:GetChildren()) do
                child:Destroy()
            end
        end
    end
end

local function destroySquiddles()
    for _,object in pairs(workspace:GetDescendants()) do
        if object.Name == "SquiddleBuildup" and object.Parent and object.Parent.Name == "Face" then
            local face = object.Parent
            local Squiddle = face.Parent
            if Squiddle then
                Squiddle:Destroy()
            end
        end
    end
end

local function destroyMonsterLocker()
    for _,mLocker in pairs(workspace:GetDescendants()) do
        if mLocker.Name == "MonsterLocker" then
            mLocker:Destroy()
        end
    end
end

-- ===========================================
-- KEYCARD


local function tpToKeyCard()
    for _, keyCard in pairs(keycards) do
        if keyCard:FindFirstChild("KeyCard_ESP") then
            local player = game.Players.LocalPlayer
            player.Character.HumanoidRootPart.CFrame = keyCard.CFrame
        end
    end
end



-- =====================================================
-- Generator



local function tpToGenerator()
    local generators = generatorArray
    local randomGenerator = math.random(1, #generators)
    local generator = generators[randomGenerator]

    if generator then
        local player = game.Players.LocalPlayer
        player.Character.HumanoidRootPart.CFrame = generator.CFrame
    end
end

-- =====================================================
-- Items


-- =====================================================
-- Money

local function findMoney()
    local room = findPreLastRoom()
    for _,object in pairs(room:GetDescendants()) do
        if object.Name == "50Currency" or object.Name == "15Currency" or object.Name == "10Currency" or object.Name == "100Currency" or object.Name == "5Currency" or object.Name == "200Currency" or object.Name == "25Currency" then
            local money = object:FindFirstChild("ProxyPart")
            table.insert(moneyArray, money)
        end
    end
    return moneyArray
end

local function farmMoney()
    if moneyFarmEnable then
        local player = game.Players.LocalPlayer
        local playerPos = player.Character.HumanoidRootPart.CFrame

        moneyArray = findMoney()
        for _, money in pairs(moneyArray) do
            if moneyFarmEnable then
                player.Character.HumanoidRootPart.CFrame = money.CFrame
                task.wait(2)
            else
                break
            end
        end
        player.Character.HumanoidRootPart.CFrame = playerPos
        moneyFarmEnable = false
    end
end

-- ===========================================


Tabs.Teleports:AddButton({
    Title = "Teleport to Last Room",
    Description = "Hotkey : NumPad 1",
    Callback = function()
        tpToLastRoom()
    end
})

Tabs.Teleports:AddButton({
    Title = "Teleport to Last Room Opened",
    Description = "Hotkey : NumPad 2",
    Callback = function()
        tpToLastRoomOpened()
    end
})

Tabs.Teleports:AddButton({
    Title = "Teleport to Last Locker",
    Description = "Hotkey : NumPad 3",
    Callback = function()
        tpToLastLocker()
    end
})

Tabs.Teleports:AddButton({
    Title = "Teleport to KeyCard",
    Description = "Hotkey : NumPad 4",
    Callback = function()
        tpToKeyCard()
    end
})

Tabs.Teleports:AddButton({
    Title = "Hide From Monsters",
    Description = "Hotkey : NumPad 7",
    Callback = function()
        tpToOUTOFLastRoomOpened()
    end
})

Tabs.Teleports:AddButton({
    Title = "Teleport to Generator",
    Description = "Hotkey : NumPad 8",
    Callback = function()
        tpToGenerator()
    end
})


local function createBillboard(spawner, EspName, Shape, GuiColor,GUIESPNAME,b_s,t_so)
    local billboardGui = Instance.new("BillboardGui")
    billboardGui.Size = UDim2.new(b_s, 0, b_s, 0)
    billboardGui.AlwaysOnTop = true
    billboardGui.Name = GUIESPNAME
    billboardGui.Adornee = spawner
    
    if t_so == 5 then
        billboardGui.SizeOffset = Vector2.new(0, 10)
        billboardGui.StudsOffsetWorldSpace  = Vector3.new(4, 0, 0)
    end

    if Shape ~= 0 then
        local frame = Instance.new("Frame", billboardGui)
        frame.BackgroundColor3 = GuiColor
        frame.BackgroundTransparency = 0.5
        frame.Size = UDim2.new(1, 0, 1, 0)
        frame.BorderSizePixel = 0

        local uiStroke = Instance.new("UIStroke")
        if t_so ~= 5 then
            uiStroke.Thickness = 4
            uiStroke.Color = Color3.new(0, 0, 1)
        else 
            uiStroke.Thickness = 1
            uiStroke.Color = Color3.new(1, 1, 0)
        end
        uiStroke.Transparency = 0.1
        uiStroke.Parent = frame

        if Shape == 2 then
            local uiCorner = Instance.new("UICorner")
            uiCorner.CornerRadius = UDim.new(0.5, 0)
            uiCorner.Parent = frame
        end
    end

    
    local nameGui = Instance.new("BillboardGui")
    if t_so == 5 then
        nameGui.Size = UDim2.new(0, 0, 0, 0)
    else  
        nameGui.Size = UDim2.new(3, 0, 1.5, 0)
    end
    nameGui.SizeOffset = Vector2.new(0, t_so)
    nameGui.AlwaysOnTop = true
    nameGui.Name = "Name"
    nameGui.Adornee = spawner

    local textLabel = Instance.new("TextLabel", nameGui)
    textLabel.TextColor3 = Color3.new(255 / 255, 80 / 255, 60 / 255)
    textLabel.TextTransparency = 0.25
    textLabel.BackgroundTransparency = 1
    textLabel.Font = Enum.Font.LuckiestGuy
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.TextScaled = true
    textLabel.Name = "Text"

    textLabel.TextStrokeTransparency = 0.2
    textLabel.TextStrokeColor3 = Color3.new(0, 0, 1)

    local function updateDistance()
        local player = game.Players.LocalPlayer
        if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local distance = (spawner.Position - player.Character.HumanoidRootPart.Position).Magnitude
            textLabel.Text = EspName .. " (" .. math.floor(distance) .. " studs)"
        end
    end

    updateDistance()
    game:GetService("RunService").RenderStepped:Connect(updateDistance)

    billboardGui.Parent = spawner
    nameGui.Parent = spawner

    local screenGui = Instance.new("ScreenGui")
    local warningLabel = Instance.new("TextLabel")

    warningLabel.Parent = screenGui
    warningLabel.Size = UDim2.new(1, 0, 1, 0)
    warningLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
    warningLabel.AnchorPoint = Vector2.new(0.5, 0.5)
    warningLabel.TextSize = 50
    warningLabel.TextColor3 = Color3.new(1, 0, 0)
    warningLabel.BackgroundTransparency = 1
    warningLabel.TextStrokeTransparency = 0.2
    warningLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    warningLabel.Visible = false

    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    return { billboardGui, nameGui, warningLabel, screenGui }
end


local function removeDoorsESP()
    for _, esp in pairs(doorsESPObjects) do
        esp[1]:Destroy()
        esp[2]:Destroy()
    end
    doorsESPObjects = {}
end

DoorESP:OnChanged(function()
    if Options.DoorESP.Value then
        doorEnabled = true
        render = true
        while Options.DoorESP.Value do
            local preLastDoor = doorArray[#doorArray - 1]

            if preLastDoor then
                if not preLastDoor:FindFirstChild("Door_ESP") then
                    local espObjects = createBillboard(preLastDoor, "Door", 2, Color3.fromRGB(255, 255, 255), "Door_ESP", .5, 5)
                    table.insert(doorsESPObjects, espObjects)
                end
                
                if previousDoorESP and previousDoorESP ~= preLastDoor then
                    local oldESP = previousDoorESP:FindFirstChild("Door_ESP")
                    if oldESP then
                        oldESP:Destroy()
                    end
                end

                previousDoorESP = preLastDoor
            end

            task.wait(1)
        end
    else
        doorEnabled = false
        removeDoorsESP()
    end
end)



local function removeItemsESP()
    for _, esp in pairs(itemsESPObjects) do
        esp[1]:Destroy()
        esp[2]:Destroy()
    end
    itemsESPObjects = {}
end

ItemsESP:OnChanged(function()
    if Options.ItemsESP.Value then
        itemEnabled = true
        render = true
        while Options.ItemsESP.Value do
            for _, item in pairs(itemsArray) do
                if not item:FindFirstChild("Item_ESP") then
                    local espObjects = createBillboard(item, "MedKit", 1, Color3.fromRGB(0, 255, 255),"Item_ESP",1,1)
                    table.insert(itemsESPObjects, espObjects)
                end
            end
            task.wait(1)
        end
    else
        itemEnabled = false
        removeItemsESP()
    end
end)

local function removeMonstersESP()
    for _, esp in pairs(monstersESPObjects) do
        esp[1]:Destroy()
        esp[2]:Destroy()
    end
    monstersESPObjects = {}
end

MonstersESP:OnChanged(function()
    if Options.MonstersESP.Value then
        monstersEnabled = true
        render = true
        while Options.MonstersESP.Value do
            for _, monster in pairs(monstersArray) do
                if not monster:FindFirstChild("Monster_ESP") then
                    local espObjects = createBillboard(monster, monster.Name, 2, Color3.fromRGB(255, 0, 0),"Monster_ESP",1,1)
                    table.insert(monstersESPObjects, espObjects)
                end
            end
            task.wait(1)
        end
    else
        monstersEnabled = false
        removeMonstersESP()
    end
end)

local function removeKeyCardESP()
    for _, esp in pairs(keyCardESPObjects) do
        esp[1]:Destroy()
        esp[2]:Destroy()
    end
    keyCardESPObjects = {}
end

KeyCardsESP:OnChanged(function()
    if Options.KeyCardsESP.Value then
        keyCardEnabled = true
        render = true
        while Options.KeyCardsESP.Value do
            for _, keyCard in pairs(keycards) do
                if not keyCard:FindFirstChild("KeyCard_ESP") then
                    local espObjects = createBillboard(keyCard, "KeyCard", 1, Color3.fromRGB(0, 255, 0),"KeyCard_ESP",1,1)
                    table.insert(keyCardESPObjects, espObjects)  
                end
            end
            task.wait(1)
        end
    else
        keyCardEnabled = false
        removeKeyCardESP()
    end
end)


local function removeGeneratorESP()
    for _, esp in pairs(generatorESPObjects) do
        esp[1]:Destroy()
        esp[2]:Destroy()
    end
    generatorESPObjects = {}
end


GeneratorESP:OnChanged(function()
    if Options.GeneratorESP.Value then
        generatorEnabled = true
        render = true
        while Options.GeneratorESP.Value do
            for _, generator in pairs(generatorArray) do
                if not generator:FindFirstChild("Generator_ESP") then
                    local espObjects = createBillboard(generator, "Generator", 1, Color3.fromRGB(255, 255, 0),"Generator_ESP",1,1)
                    table.insert(generatorESPObjects, espObjects)
                end
            end
            if fixedGeneratorArray then
                for _, generator in pairs(fixedGeneratorArray) do
                    generator:Destroy()
                end
                fixedGeneratorArray = {}
            end
            task.wait(1)
        end
    else
        generatorEnabled = false
        removeGeneratorESP()
    end
end)



MoneyFarm:OnChanged(function()
    if Options.MoneyFarm.Value then
        while Options.MoneyFarm.Value do
            moneyFarmEnable = not moneyFarmEnable
            farmMoney()
            task.wait(1)
        end
    else
        moneyFarmEnable = not moneyFarmEnable
    end
end)

DestroySquiddles:OnChanged(function()
    if Options.DestroySquiddles.Value then
        while Options.DestroySquiddles.Value do
            destroySquiddles()
            task.wait(1)
        end
    end
end)



DestroyMonsterLocker:OnChanged(function()
    if Options.DestroyMonsterLocker.Value then
        while Options.DestroyMonsterLocker.Value do
            destroyMonsterLocker()
            task.wait(1)
        end
    end
end)



Tabs.Visuals:AddButton({
    Title = "Passive SearchLights",
    Description = "Press it when SearchLight Spawns",
    Callback = function()
        deleteSearchLight()
    end
})




local function setFullbright(enabled)
    if enabled then
        game.Lighting.Brightness = 2
        game.Lighting.GlobalShadows = false
        game.Lighting.Ambient = Color3.fromRGB(255, 255, 255)
    else
        game.Lighting.Brightness = 1
        game.Lighting.GlobalShadows = true
        game.Lighting.Ambient = Color3.fromRGB(127, 127, 127)
    end
end

local function setupHotkeys()
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end

        if input.KeyCode == Enum.KeyCode.KeypadOne then
            tpToLastRoom()
        elseif input.KeyCode == Enum.KeyCode.KeypadTwo then
            tpToLastRoomOpened()
        elseif input.KeyCode == Enum.KeyCode.KeypadThree then
            tpToLastLocker()
        elseif input.KeyCode == Enum.KeyCode.KeypadFour then
            tpToKeyCard()
        elseif input.KeyCode == Enum.KeyCode.KeypadFive then
            moneyFarmEnable = not moneyFarmEnable
            farmMoney()
        elseif input.KeyCode == Enum.KeyCode.KeypadSeven then
            tpToOUTOFLastRoomOpened()
        elseif input.KeyCode == Enum.KeyCode.KeypadEight then
            tpToGenerator()
        end
    end)
end

setupHotkeys()
spawn(checkRenderCondition)
spawn(doFindAll)

FullbrightToggle:OnChanged(function()
    setFullbright(Options.Fullbright.Value)
end)

setFullbright(Options.Fullbright.Value)

SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)

Window:SelectTab(1)

Fluent:Notify({
    Title = "cracked by 25ms | Join Discord",
    Content = "https://discord.gg/AC85fM4Hp8",
    Duration = 8
})

SaveManager:LoadAutoloadConfig()