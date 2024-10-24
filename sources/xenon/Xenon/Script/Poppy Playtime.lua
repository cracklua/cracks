local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Xenon HUB",
    SubTitle = "Poppy Playtime",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

-- Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "home" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options
local Players = game:GetService("Players")
lp = Players.LocalPlayer
local found = false
local triggerCounter = 0
local MaxTriggerCounter = 8 -- Set the maximum trigger counter value here
local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
local userInputService = game:GetService("UserInputService")

-- Functions
local function pressKey(keyCode, state)
    if state then
        userInputService.InputBegan:Fire({ KeyCode = keyCode, UserInputType = Enum.UserInputType.Keyboard })
    else
        userInputService.InputEnded:Fire({ KeyCode = keyCode, UserInputType = Enum.UserInputType.Keyboard })
    end
end

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
local Toggle = Tabs.Main:AddToggle("MyToggle", { Title = "Auto Fuse", Default = false })

Toggle:OnChanged(function(Value)
    found = Value
    while found do
        task.wait()
        for i, v in next, workspace:GetChildren() do
            if found and v.Name == "Fuse" and v:IsA("Model") then
                local hitbox = v:FindFirstChild("Hitbox")
                if hitbox then
                    hrp.CFrame = CFrame.new(hitbox.Position)
                    wait(3) -- Wait 3 seconds before continuing
                    triggerCounter = triggerCounter + 1
                    local itemName = v.Name
                    Fluent:Notify({
                        Title = "Found Trigger",
                        Content = "Item Name: " .. itemName .. "\nTrigger Counter: " .. triggerCounter,
                        Duration = 1
                    })
                    if triggerCounter >= 999 then
                        hrp.CFrame = CFrame.new(-64.2259979, 39.276329, -798.156006, 0.924953222, 7.48114399e-19, -0.380080998, -1.35980759e-18, 1, -1.34088252e-18, 0.380080998, 1.75709065e-18, 0.924953222)
                        found = false -- Disable the toggle
                        print("Finished finding triggers")
                    else
                        hrp.CFrame = CFrame.new(-64.2259979, 39.276329, -798.156006, 0.924953222, 7.48114399e-19, -0.380080998, -1.35980759e-18, 1, -1.34088252e-18, 0.380080998, 1.75709065e-18, 0.924953222)
                    end
                    wait(1)
                    break
                end
            end
        end
    end
    print("Toggle changed:", Value)
end)


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
