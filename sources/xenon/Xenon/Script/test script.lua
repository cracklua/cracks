local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Reborn a swordan 0.1",
    SubTitle = "by Xenon HUB",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "home" }),
    Train = Window:AddTab({ Title = "Train", Icon = "armchair" }),
    Teleport = Window:AddTab({ Title = "Teleport To Npc", Icon = "bone" })
}

getgenv().clicks = false
getgenv().aura = false
getgenv().training = false
getgenv().selectedPart = nil
getgenv().teleport = false
getgenv().teleportOffset = Vector3.new(0, 0, 0)
getgenv().selectedWorld = nil

local trainOptions = {
    ["World 1"] = { "1", "2", "3", "4", "5", "6" },
    ["World 2"] = { "8", "9", "10", "11", "12", "13" },
    ["World 3"] = { "15", "16", "17", "18", "19", "20" },
    ["World 4"] = { "22", "23", "24", "25", "26", "27" },
    ["World 5"] = { "29", "30", "31", "32", "33", "34" },
    ["World 6"] = { "36", "37", "38", "39", "40", "41" },
    ["World 7"] = { "43", "44", "45", "46", "47", "48" },
    ["World 8"] = { "50", "51", "52", "53", "54", "55" }
}

local trainEvents = {
    ["1"] = "TrainPower001",
    ["2"] = "TrainPower002",
    ["3"] = "TrainPower003",
    ["4"] = "TrainPower004",
    ["5"] = "TrainPower005",
    ["6"] = "TrainPower006",
    ["8"] = "TrainPower008",
    ["9"] = "TrainPower009",
    ["10"] = "TrainPower010",
    ["11"] = "TrainPower011",
    ["12"] = "TrainPower012",
    ["13"] = "TrainPower013",
    ["15"] = "TrainPower015",
    ["16"] = "TrainPower016",
    ["17"] = "TrainPower017",
    ["18"] = "TrainPower018",
    ["19"] = "TrainPower019",
    ["20"] = "TrainPower020",
    ["22"] = "TrainPower022",
    ["23"] = "TrainPower023",
    ["24"] = "TrainPower024",
    ["25"] = "TrainPower025",
    ["26"] = "TrainPower026",
    ["27"] = "TrainPower027",
    ["29"] = "TrainPower029",
    ["30"] = "TrainPower030",
    ["31"] = "TrainPower031",
    ["32"] = "TrainPower032",
    ["33"] = "TrainPower033",
    ["34"] = "TrainPower034",
    ["36"] = "TrainPower036",
    ["37"] = "TrainPower037",
    ["38"] = "TrainPower038",
    ["39"] = "TrainPower039",
    ["40"] = "TrainPower040",
    ["41"] = "TrainPower041",
    ["43"] = "TrainPower043",
    ["44"] = "TrainPower044",
    ["45"] = "TrainPower045",
    ["46"] = "TrainPower046",
    ["47"] = "TrainPower047",
    ["48"] = "TrainPower048",
    ["50"] = "TrainPower050",
    ["51"] = "TrainPower051",
    ["52"] = "TrainPower052",
    ["53"] = "TrainPower053",
    ["54"] = "TrainPower054",
    ["55"] = "TrainPower055",
}

local function clickBoss()
    while getgenv().clicks do
        task.wait(0.1)
        local relicArgs = { [1] = 3 }
        local success, err = pcall(function()
            game:GetService("ReplicatedStorage").Events.Relics.Re_TakeDamage:FireServer(unpack(relicArgs))
        end)
        if not success then
            warn("Error in clickBoss: " .. err)
        end
    end
end

local function clickRelic()
    while getgenv().clicks do
        task.wait(0.1)
        local towerArgs = { [1] = 2 }
        local success, err = pcall(function()
            game:GetService("ReplicatedStorage").Events.Tower.Re_TakeDamage:FireServer(unpack(towerArgs))
        end)
        if not success then
            warn("Error in clickRelic: " .. err)
        end
    end
end

local function getFightFolders()
    local fightFolder = game:GetService("Workspace"):FindFirstChild("FightNpcs")
    local folders = {}
    if fightFolder then
        for _, folder in ipairs(fightFolder:GetChildren()) do
            if folder:IsA("Model") then
                table.insert(folders, folder.Name)
            end
        end
    else
        warn("Fight folder not found")
    end
    return folders
end

local function killAura()
    while getgenv().aura do
        task.wait(0.5)
        local folders = getFightFolders()
        if #folders > 0 then
            for _, folder in ipairs(folders) do
                local args = {
                    [1] = folder,
                    [2] = 3
                }
                local success, err = pcall(function()
                    game:GetService("ReplicatedStorage").Events.Fight.Re_TakeDamage:FireServer(unpack(args))
                end)
                if not success then
                    warn("Error in killAura: " .. err)
                end
            end
        end
    end
end

local function train()
    while getgenv().training do
        if getgenv().selectedPart then
            local args = {
                [1] = getgenv().selectedPart
            }
            local success, err = pcall(function()
                game:GetService("ReplicatedStorage").Events.Game.Re_TrainPower:FireServer(unpack(args))
            end)
            if not success then
                warn("Error in train: " .. err)
            end
        end
        task.wait(1)
    end
end

local function teleportToFightNpcs()
    while getgenv().teleport do
        task.wait()
        local folders = getFightFolders()
        if #folders > 0 then
            for _, folder in ipairs(folders) do
                local model = game:GetService("Workspace").FightNpcs:FindFirstChild(folder)
                if model and model:FindFirstChild("Humanoid") and model.Humanoid.Health > 0 then
                    local success, err = pcall(function()
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = model.HumanoidRootPart.CFrame * CFrame.new(getgenv().teleportOffset)
                    end)
                    if not success then
                        warn("Error in teleportToFightNpcs: " .. err)
                    end
                end
            end
        end
    end
end


do
    Fluent:Notify({
        Title = "Notification",
        Content = "This is a notification",
        SubContent = "XENON HUB",
        Duration = 5
    })

    local dropdownOptions = {}
    for world, numbers in pairs(trainOptions) do
        table.insert(dropdownOptions, world)
        for _, number in ipairs(numbers) do
            table.insert(dropdownOptions, world .. " - " .. number)
        end
    end

    table.sort(dropdownOptions, function(a, b)
        local worldA, numA = string.match(a, "(World %d+) %- (%d+)")
        local worldB, numB = string.match(b, "(World %d+) %- (%d+)")
        if worldA and worldB then
            if worldA == worldB then
                return tonumber(numA) < tonumber(numB)
            else
                return worldA < worldB
            end
        elseif worldA then
            return false
        elseif worldB then
            return true
        else
            return a < b
        end
    end)

    local TrainDropdown = Tabs.Train:AddDropdown("TrainDropdown", {
        Title = "Select Train Dropdown",
        Values = dropdownOptions,
        Multi = false,
        Default = 1
    })

    TrainDropdown:OnChanged(function(value)
        local world, number = string.match(value, "(World %d+) %- (%d+)")
        if world and number then
            getgenv().selectedPart = trainEvents[number]
            print("Selected Train Part:", getgenv().selectedPart)
        else
            getgenv().selectedPart = nil
        end
    end)

    local NPCToggle = Tabs.Train:AddToggle("NPCToggle", {Title = "Auto NPC Train", Description = "This option allows you to automatically train NPCs", Default = false})

    NPCToggle:OnChanged(function(value)
        getgenv().training = value
        if value then
            task.spawn(train)
        end
    end)

    local AutoClickBossToggle = Tabs.Main:AddToggle("AutoClickBossToggle", {Title = "Auto Click Boss", Description = "This is an automatic damage if the enemy is close", Default = false})

    AutoClickBossToggle:OnChanged(function(value)
        getgenv().clicks = value
        if value then
            task.spawn(clickBoss)
        end
    end)

    local AutoClickRelicToggle = Tabs.Main:AddToggle("AutoClickRelicToggle", {Title = "Auto Click Infinite Dungeon", Description = "This is an automatic damage if the enemy is close", Default = false})

    AutoClickRelicToggle:OnChanged(function(value)
        getgenv().clicks = value
        if value then
            task.spawn(clickRelic)
        end
    end)

    local KillAura = Tabs.Main:AddToggle("KillAura", {Title = "Kill Aura", Description = "This is for normal not dungeon and boss", Default = false})

    KillAura:OnChanged(function(value)
        getgenv().aura = value
        if value then
            task.spawn(killAura)
        end
    end)

    local OffsetXSlider = Tabs.Teleport:AddSlider("OffsetXSlider", {
        Title = "Teleport Offset X",
        Min = -50,
        Max = 50,
        Default = 3,
        Rounding = 1,
        Callback = function(value)
            getgenv().teleportOffset = Vector3.new(value, getgenv().teleportOffset.Y, getgenv().teleportOffset.Z)
        end
    })

    local OffsetYSlider = Tabs.Teleport:AddSlider("OffsetYSlider", {
        Title = "Teleport Offset Y",
        Min = -50,
        Max = 50,
        Default = 10,
        Rounding = 1,
        Callback = function(value)
            getgenv().teleportOffset = Vector3.new(getgenv().teleportOffset.X, value, getgenv().teleportOffset.Z)
        end
    })

    local OffsetZSlider = Tabs.Teleport:AddSlider("OffsetZSlider", {
        Title = "Teleport Offset Z",
        Min = -10,
        Max = 10,
        Default = 10,
        Rounding = 1,
        Callback = function(value)
            getgenv().teleportOffset = Vector3.new(getgenv().teleportOffset.X, getgenv().teleportOffset.Y, value)
        end
    })

    local TeleportToggle = Tabs.Teleport:AddToggle("TeleportToggle", {Title = "Teleport To Fight NPCs", Default = false})

    TeleportToggle:OnChanged(function(value)
        getgenv().teleport = value
        if value then
            task.spawn(teleportToFightNpcs)
        end
    end)
end
