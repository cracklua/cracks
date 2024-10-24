local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "NightLight" .. Fluent.Version,
    SubTitle = "by Xenon",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options
local Players = game:GetService("Players")
lp = Players.LocalPlayer

--Functions

getgenv().TPPlace = "string"
    function Teleport(teleportPlace)
      local player = game.Players.LocalPlayer
      player.Character.HumanoidRootPart.CFrame = teleportPlace
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
        Content = "Default WalkSpeed 16.\nInput you WalkSpeed!"
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


    Tabs.Main:AddButton({
        Title = "Button",
        Description = "ESP For Notes",
        Callback = function()
             -- loadstring
             local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/XenonLUA/Xenon/main/Script/ESP%20XENON.lua"))()
                        
             -- config
             ESP.Players = false
             ESP.Boxes = false
             ESP.Names = true
             ESP:Toggle(true)

             
             -- object
             ESP:AddObjectListener(Workspace.Notes, { -- Object Path, For example: Workspace.ThisFolder
                 Name = "Note1", --Object name inside of the path, for example: Workspace.ThisFolder.Item_1
                 CustomName = "Note 1", -- Name you want to be displayed
                 Color = Color3.fromRGB(0, 255, 0), -- Color
                 IsEnabled = "whatever" -- Any name, has to be the same as the last line: ESP.TheNameYouWant
             })

             ESP:AddObjectListener(Workspace.Notes, { -- Object Path, For example: Workspace.ThisFolder
                 Name = "Note2", --Object name inside of the path, for example: Workspace.ThisFolder.Item_1
                 CustomName = "Note 2", -- Name you want to be displayed
                 Color = Color3.fromRGB(0, 255, 0), -- Color
                 IsEnabled = "whatever" -- Any name, has to be the same as the last line: ESP.TheNameYouWant
             })

             ESP:AddObjectListener(Workspace.Notes, { -- Object Path, For example: Workspace.ThisFolder
                 Name = "Note3", --Object name inside of the path, for example: Workspace.ThisFolder.Item_1
                 CustomName = "Note 3", -- Name you want to be displayed
                 Color = Color3.fromRGB(0, 255, 0), -- Color
                 IsEnabled = "whatever" -- Any name, has to be the same as the last line: ESP.TheNameYouWant
             })

             ESP:AddObjectListener(Workspace.Notes, { -- Object Path, For example: Workspace.ThisFolder
                 Name = "Note4", --Object name inside of the path, for example: Workspace.ThisFolder.Item_1
                 CustomName = "Note 4", -- Name you want to be displayed
                 Color = Color3.fromRGB(0, 255, 0), -- Color
                 IsEnabled = "whatever" -- Any name, has to be the same as the last line: ESP.TheNameYouWant
             })

             ESP:AddObjectListener(Workspace.Notes, { -- Object Path, For example: Workspace.ThisFolder
                 Name = "Note5", --Object name inside of the path, for example: Workspace.ThisFolder.Item_1
                 CustomName = "Note 5", -- Name you want to be displayed
                 Color = Color3.fromRGB(0, 255, 0), -- Color
                 IsEnabled = "whatever" -- Any name, has to be the same as the last line: ESP.TheNameYouWant
             })

             ESP:AddObjectListener(Workspace.Notes, { -- Object Path, For example: Workspace.ThisFolder
                 Name = "Note6", --Object name inside of the path, for example: Workspace.ThisFolder.Item_1
                 CustomName = "Note 6", -- Name you want to be displayed
                 Color = Color3.fromRGB(0, 255, 0), -- Color
                 IsEnabled = "whatever" -- Any name, has to be the same as the last line: ESP.TheNameYouWant
             })

             ESP:AddObjectListener(Workspace.Notes, { -- Object Path, For example: Workspace.ThisFolder
                 Name = "Note7", --Object name inside of the path, for example: Workspace.ThisFolder.Item_1
                 CustomName = "Note 7", -- Name you want to be displayed
                 Color = Color3.fromRGB(0, 255, 0), -- Color
                 IsEnabled = "whatever" -- Any name, has to be the same as the last line: ESP.TheNameYouWant
             })

             ESP:AddObjectListener(Workspace.Notes, { -- Object Path, For example: Workspace.ThisFolder
                 Name = "Note8", --Object name inside of the path, for example: Workspace.ThisFolder.Item_1
                 CustomName = "Note 8", -- Name you want to be displayed
                 Color = Color3.fromRGB(0, 255, 0), -- Color
                 IsEnabled = "whatever" -- Any name, has to be the same as the last line: ESP.TheNameYouWant
             })

             ESP.whatever = true
                 print("Confirmed ESP")
        end
    })

    Tabs.Main:AddButton({
        Title = "Button",
        Description = "ESP Matches",
        Callback = function()
            local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/XenonLUA/Xenon/main/Script/ESP%20XENON.lua"))()
                            
                            -- config
                            ESP.Players = false
                            ESP.Boxes = false
                            ESP.Names = true
                            ESP:Toggle(true)

                            
                            -- object
                            ESP:AddObjectListener(Workspace.Matches, { -- Object Path, For example: Workspace.ThisFolder
                                Name = "Match", --Object name inside of the path, for example: Workspace.ThisFolder.Item_1
                                CustomName = "Matches", -- Name you want to be displayed
                                Color = Color3.fromRGB(255, 0, 0), -- Color
                                IsEnabled = "match" -- Any name, has to be the same as the last line: ESP.TheNameYouWant
                            })

                            ESP.match = true
                            print("Confirmed the Matches.")
        end
    })

    Tabs.Main:AddButton({
        Title = "Button",
        Description = "ESP for Coins",
        Callback = function()
            local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/XenonLUA/Xenon/main/Script/ESP%20XENON.lua"))()
 
                        -- config
                        ESP.Players = false
                        ESP.Boxes = false
                        ESP.Names = true
                        ESP:Toggle(true)

                        
                        -- object
                        ESP:AddObjectListener(Workspace.House.Coins, { -- Object Path, For example: Workspace.ThisFolder
                            Name = "Coin_2", --Object name inside of the path, for example: Workspace.ThisFolder.Item_1
                            CustomName = "Matches", -- Name you want to be displayed
                            Color = Color3.fromRGB(212, 166, 65), -- Color
                            IsEnabled = "match" -- Any name, has to be the same as the last line: ESP.TheNameYouWant
                        })

                        ESP:AddObjectListener(Workspace.House.Coins, { -- Object Path, For example: Workspace.ThisFolder
                            Name = "Coin_5", --Object name inside of the path, for example: Workspace.ThisFolder.Item_1
                            CustomName = "Coins", -- Name you want to be displayed
                            Color = Color3.fromRGB(212, 166, 65), -- Color
                            IsEnabled = "c" -- Any name, has to be the same as the last line: ESP.TheNameYouWant
                        })

                        ESP.c = true
                            print("Confirmed the Coins.")
        end
    })

    Tabs.Main:AddButton({
        Title = "Button",
        Description = "ESP Beta",
        Callback = function()
            local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/XenonLUA/Xenon/main/Script/ESP%20XENON.lua"))()
 
                        -- config
                        ESP.Players = false
                        ESP.Boxes = false
                        ESP.Names = true
                        ESP:Toggle(true)

                        
                        -- object
                        ESP:AddObjectListener(Workspace, { -- Object Path, For example: Workspace.ThisFolder
                            Name = "Beta", --Object name inside of the path, for example: Workspace.ThisFolder.Item_1
                            CustomName = "Beta", -- Name you want to be displayed
                            Color = Color3.fromRGB(212, 0, 0), -- Color
                            IsEnabled = "beta" -- Any name, has to be the same as the last line: ESP.TheNameYouWant
                                })
                                ESP.beta = true
                            print("Confirmed the Beta.")
        end
    })

    Tabs.Main:AddButton({
        Title = "Button",
        Description = "ESP for Midnight",
        Callback = function()
            local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/XenonLUA/Xenon/main/Script/ESP%20XENON.lua"))()
 
                        -- config
                        ESP.Players = false
                        ESP.Boxes = false
                        ESP.Names = true
                        ESP:Toggle(true)

                        
                        -- object
                        ESP:AddObjectListener(Workspace, { -- Object Path, For example: Workspace.ThisFolder
                            Name = "Midnight", --Object name inside of the path, for example: Workspace.ThisFolder.Item_1
                            CustomName = "Midnight", -- Name you want to be displayed
                            Color = Color3.fromRGB(212, 0, 0), -- Color
                            IsEnabled = "midnight" -- Any name, has to be the same as the last line: ESP.TheNameYouWant
                                })
                                ESP.midnight = true
                            print("Confirmed the Midnight.")
        end
    })

    Tabs.Main:AddButton({
        Title = "Button",
        Description = "Brighnes",
        Callback = function()
            Window:Dialog({
                Title = "Title",
                Content = "Brighnes",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            Game.Lighting.Brightness = 1
                            Game.Lighting.FogEnd = 100000
                            Game.Lighting.GlobalShadows = false
                            Game.Lighting.ClockTime = 12
                            print("Confirmed the Brighnes.")
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            Game.Lighting.Brightness = 0
                            Game.Lighting.FogEnd = 100000
                            Game.Lighting.GlobalShadows = false
                            Game.Lighting.ClockTime = 12
                            print("Cancelled the Brighnes.")
                        end
                    }
                }
            })
        end
    })

    Tabs.Main:AddButton({
        Title = "Button",
        Description = "Teleport to Matches",
        Callback = function()
            hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    			for i, v in next, workspace.Matches:GetChildren() do
    				if v.IsA(v, "Model") then
    					hrp.CFrame = CFrame.new(v:FindFirstChild("Part").Position)
    				end
    			end
        end
    })

    Tabs.Main:AddButton({
        Title = "Button",
        Description = "Teleport to Exit Door",
        Callback = function()
            Teleport(game:GetService("Workspace").Spawn.CFrame)
        end
    })


-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- InterfaceManager (Allows you to have a interface managment system)

-- Hand the library over to our managers
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- You can add indexes of elements the save manager should ignore
SaveManager:SetIgnoreIndexes({})

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
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

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()
