local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Anime Stars Simulator" .. Fluent.Version,
    SubTitle = "by Xenon",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.X -- Used when theres no MinimizeKeybind
})

-- Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "home" }),
    Enemy = Window:AddTab({ Title = "Enemy", Icon = "skull" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options
local Players = game:GetService("Players")
local VirtualUser = game:GetService("VirtualUser")

-- Functions
do
    Fluent:Notify({
        Title = "Notification",
        Content = "This is a notification",
        SubContent = "XENON HUB", -- Optional
        Duration = 5 -- Set to nil to make the notification not disappear
    })

    Tabs.Main:AddParagraph({
        Title = "WalkSpeed",
        Content = "Default WalkSpeed 16.\nInput your WalkSpeed!"
    })

    local walkSpeedValue = 16
    local Input = Tabs.Main:AddInput("Input", {
        Title = "WalkSpeed",
        Default = "Default",
        Placeholder = "Enter WalkSpeed",
        Numeric = false, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(Value)
            walkSpeedValue = tonumber(Value) or 16
            local humanoid = Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = walkSpeedValue
            end
            print("Input changed:", Value)
        end
    })

    Input:OnChanged(function()
        print("Input updated:", Input.Value)
    end)
end

local MapsFolder = workspace.Maps
local maps = {}

for _, map in ipairs(MapsFolder:GetChildren()) do
    if map:IsA("Folder") then
        table.insert(maps, map.Name)
    end
end

local DropdownMaps = Tabs.Enemy:AddDropdown("DropdownMaps", {
    Title = "Map Dropdown",
    Values = maps,
    Multi = false,
    Default = 1,
})

local DropdownEnemies = nil

DropdownMaps:OnChanged(function(Value)
    getgenv().mapall = Value 
    print("Map Dropdown changed:", Value)

    local EnemiesFolder = MapsFolder:FindFirstChild(Value)
    if EnemiesFolder then
        local EnemiesSubfolder = EnemiesFolder:FindFirstChild("Enemies")
        if EnemiesSubfolder then
            local enemies = {}

            for _, enemy in ipairs(EnemiesSubfolder:GetChildren()) do
                table.insert(enemies, enemy.Name)
            end

            if DropdownEnemies then
                DropdownEnemies:Destroy()
            end

            DropdownEnemies = Tabs.Enemy:AddDropdown("DropdownEnemies", {
                Title = "Enemies Dropdown",
                Values = enemies,
                Multi = false,
                Default = 1,
            })

            DropdownEnemies:OnChanged(function(Value)
                getgenv().enemie = Value 
                print("Enemies Dropdown changed:", Value)
            end)
        else
            print("Enemies folder not found for selected map.")
            if DropdownEnemies then
                DropdownEnemies:Destroy()
                DropdownEnemies = nil
            end
        end
    else
        print("Map folder not found.")
        if DropdownEnemies then
            DropdownEnemies:Destroy()
            DropdownEnemies = nil
        end
    end
end)


local Toggle = Tabs.Main:AddToggle("MyToggle", { Title = "Auto Damage", Default = false })

Toggle:OnChanged(function(value)
    a = value
    while a do
        task.wait() -- Tunda selama 1 detik sebelum memanggil InvokeServer kembali
        game:GetService("ReplicatedStorage").Remotes.EnemyRemotes.AttackClick:InvokeServer()
        print("Toggle changed:", Options.MyToggle.Value)
        
        if not a then
            break -- Keluar dari loop jika toggle dinonaktifkan
        end
    end
end)

    Tabs.Main:AddParagraph({
        Title = "Auto Attack",
        Content = "Is Auto Attack.\nSelect NPC in tab Enemy!"
    })

local Toggle = Tabs.Main:AddToggle("MyToggle", { Title = "Auto Attack", Default = false })

local function attackEnemy()
    while true do
        if b and getgenv().enemie then
            pcall(function()
                local EnemiesFolder = MapsFolder:FindFirstChild(getgenv().mapall)
                if EnemiesFolder then
                    local enemyModel = EnemiesFolder.Enemies:FindFirstChild(getgenv().enemie)
                    if enemyModel then
                        local player = Players.LocalPlayer
                        local character = player.Character or player.CharacterAdded:Wait()
                        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

                        humanoidRootPart.CFrame = enemyModel.PrimaryPart.CFrame * CFrame.new(0, 0, 5) -- Teleport 5 studs behind the enemy
                        game:GetService("ReplicatedStorage").Remotes.EnemyRemotes.AttackEnemy:FireServer(enemyModel)
                    end
                end
            end)
        end
        task.wait()
    end
end

Toggle:OnChanged(function(Value)
    b = Value
    print("Toggle changed:", Value)
    if Value then
        task.spawn(attackEnemy)
    end
end)

Tabs.Main:AddButton({
    Title = "Button",
    Description = "Anti AFK",
    Callback = function()
        Window:Dialog({
            Title = "Title",
            Content = "This is a ANTI AFK",
            Buttons = {
                {
                    Title = "Confirm",
                    Callback = function()
                        local Xenon = Instance.new("ScreenGui")
                        local Main = Instance.new("Frame")
                        local Title = Instance.new("TextLabel")
                        local Credits = Instance.new("TextLabel")
                        local Activate = Instance.new("TextButton")
                        local UICorner = Instance.new("UICorner")
                        local OpenClose = Instance.new("TextButton")
                        local UICorner_2 = Instance.new("UICorner")

                        Xenon.Name = "Xenon"
                        Xenon.Parent = game.CoreGui
                        Xenon.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

                        Main.Name = "Main"
                        Main.Parent = Xenon
                        Main.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                        Main.BorderSizePixel = 0
                        Main.Position = UDim2.new(0.321207851, 0, 0.409807354, 0)
                        Main.Size = UDim2.new(0, 295, 0, 116)
                        Main.Visible = false
                        Main.Active = true
                        Main.Draggable =  true

                        Title.Name = "Title"
                        Title.Parent = Main
                        Title.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                        Title.BorderSizePixel = 0
                        Title.Size = UDim2.new(0, 295, 0, 16)
                        Title.Font = Enum.Font.GothamBold
                        Title.Text = "Xenon Anti-Afk"
                        Title.TextColor3 = Color3.fromRGB(255, 255, 255)
                        Title.TextScaled = true
                        Title.TextSize = 12.000
                        Title.TextWrapped = true

                        Credits.Name = "Credits"
                        Credits.Parent = Main
                        Credits.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                        Credits.BorderSizePixel = 0
                        Credits.Position = UDim2.new(0, 0, 0.861901641, 0)
                        Credits.Size = UDim2.new(0, 295, 0, 16)
                        Credits.Font = Enum.Font.GothamBold
                        Credits.Text = "Made by Xenon Hub"
                        Credits.TextColor3 = Color3.fromRGB(255, 255, 255)
                        Credits.TextScaled = true
                        Credits.TextSize = 12.000
                        Credits.TextWrapped = true

                        Activate.Name = "Activate"
                        Activate.Parent = Main
                        Activate.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                        Activate.BorderColor3 = Color3.fromRGB(27, 42, 53)
                        Activate.BorderSizePixel = 0
                        Activate.Position = UDim2.new(0.0330629945, 0, 0.243326917, 0)
                        Activate.Size = UDim2.new(0, 274, 0, 59)
                        Activate.Font = Enum.Font.GothamBold
                        Activate.Text = "Activate"
                        Activate.TextColor3 = Color3.fromRGB(0, 255, 127)
                        Activate.TextSize = 43.000
                        Activate.TextStrokeColor3 = Color3.fromRGB(102, 255, 115)
                        Activate.MouseButton1Down:connect(function()
                            local vu = game:GetService("VirtualUser")
                            game:GetService("Players").LocalPlayer.Idled:connect(function()
                                vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
                                wait(1)
                                vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
                            end)
                        end)


                        UICorner.Parent = Activate

                        OpenClose.Name = "Open/Close"
                        OpenClose.Parent = Xenon
                        OpenClose.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                        OpenClose.Position = UDim2.new(0.353924811, 0, 0.921739101, 0)
                        OpenClose.Size = UDim2.new(0, 247, 0, 35)
                        OpenClose.Font = Enum.Font.GothamBold
                        OpenClose.Text = "Open/Close"
                        OpenClose.TextColor3 = Color3.fromRGB(255, 255, 255)
                        OpenClose.TextSize = 14.000

                        UICorner_2.Parent = OpenClose

                        local function NERMBF_fake_script() -- OpenClose.LocalScript 
                            local script = Instance.new('LocalScript', OpenClose)

                            local frame = script.Parent.Parent.Main
                            
                            script.Parent.MouseButton1Click:Connect(function()
                                frame.Visible = not frame.Visible
                            end)
                        end
                        coroutine.wrap(NERMBF_fake_script)()
                        print("Confirmed the ANTI AFK.")
                    end
                },
                {
                    Title = "Cancel",
                    Callback = function()
                        print("Cancelled the ANTI AFK.")
                    end
                }
            }
        })
    end
})




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
    Title = "Xenon",
    Content = "The script has been loaded.",
    Duration = 8
})

SaveManager:LoadAutoloadConfig()
