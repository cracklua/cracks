if game:GetService("CoreGui"):FindFirstChild("ToraScript") then
game:GetService("CoreGui").ToraScript:Destroy()
end
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/cracklua/cracks/m/sources/toralib", true))()
local tab = Library:CreateWindow"Rock Fruit"
local Window = tab:AddFolder"Main"
Tools = {}
    for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
        if v:GetAttribute("Type") and v:GetAttribute("Type") ~= "Items" then
            table.insert(Tools,v)
        end
    end
    Window:AddList({text = "Select Tools", flag = "list", value = "==Select Tools==", values = Tools, callback = function(a) 
        tool = a
        function getTool()
            spawn(function()
                local Plr = game.Players.LocalPlayer
                local vu = game:GetService("VirtualUser")
                if Plr.Backpack:FindFirstChild(tool) and Plr.Character:FindFirstChild(tool) == nil then
                    local tool = Plr.Backpack:FindFirstChild(tool)
                        Plr.Character.Humanoid:EquipTool(tool)
                end
            end)
        end
    end})

local Mobs = {}
local seenNames = {}

for i, v in pairs(workspace.Mob:GetChildren()) do
    if not seenNames[v.Name] then
        table.insert(Mobs, v)
        seenNames[v.Name] = true
    end
end

table.sort(Mobs, function(a, b)
    return a.Humanoid.MaxHealth < b.Humanoid.MaxHealth
end)

local sortedMobNames = {}
for i, v in ipairs(Mobs) do
    table.insert(sortedMobNames, v.Name)
end

Window:AddList({text = "Mobs & Health", flag = "list", value = "::Select Mobs::", values = Mobs, callback = function(a) 
    MobsName = a
    function Mobs()
        spawn(function()
            _G.Mobs = true
            while _G.Mobs do wait()
                pcall(function()
                    local vu = game:GetService("VirtualUser")
                    repeat task.wait()
                    getTool()
                    for i,v in pairs(workspace.Mob:GetChildren()) do
                        if v.Name == MobsName and v.Humanoid.Health > 0 then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Humanoid.RootPart.Position) * CFrame.new(0,0,5)
                        break
                        end
                     end
                     vu:Button1Down(Vector2.new(100000, 100000), workspace.CurrentCamera.CFrame)
                     vu:Button1Up(Vector2.new(100000, 100000), workspace.CurrentCamera.CFrame)
                    until _G.Mobs == false
                    wait(0.2)
                end)
            end
        end)
    end
end})

Window:AddToggle({text = "Auto Mobs", flag = "Auto Print", state = false, callback = function(value) 
    _G.Mobs = value
    print('Mobs: ', value);
    if value then
        Mobs();
        _G.Mobs = true
        else
        _G.Mobs = false
    end
end})
Window:AddToggle({text = "Auto Skills", flag = "toggle", state = false, callback = function(value) 
    _G.Skills = value
    print('Skills: ', value);
    if value then
        Skills();
    end
end})

function Skills()
    spawn(function()
        _G.Skills = true
        while _G.Skills do wait()
        pcall(function()
            for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.HUD.MobileSkill:GetChildren()) do
                local args = {
                    [1] = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name,
                    [2] = string.lower(v.Name),
                    [3] = v.Parent
                }
                
                game:GetService("ReplicatedStorage").Remote.Action:FireServer(unpack(args))    
            end
            wait()
        end)
    end
end)
end
Window:AddToggle({text = "Collect Fruits", flag = "toggle", state = false, callback = function(value) 
    _G.Fruits = value
    print('Fruits: ', value);
    if value then
        Fruits();
    end
end})

function Fruits()
    spawn(function()
        _G.Fruits = true
        while _G.Fruits do wait()
        pcall(function()
            for i,v in pairs(workspace.Fruits:GetDescendants()) do
                if v:IsA("TouchTransmitter") then
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
                wait()
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 1)
                break
                end
            end
            wait()
        end)
    end
end)
end
Window:AddLabel({text = "YouTube: Tora IsMe"})
local Window = tab:AddFolder"Stats"
Window:AddBox({text = "Stats Value", flag = "box", value = "Set Value", callback = function(a) 
SetStats = a
end})
local function addToggle(text, stat)
    Window:AddToggle({
        text = text,
        flag = "toggle",
        state = false,
        callback = function(value)
            _G[stat] = value
            print(stat .. ": ", value)
            if value then
                spawn(function()
                    _G[stat] = true
                    while _G[stat] do
                        wait()
                        pcall(function()
                            local args = {
                                [1] = "UpStats",
                                [2] = text,
                                [3] = SetStats*1
                            }
                            game:GetService("ReplicatedStorage").Remotes.System:FireServer(unpack(args))
                            wait(1)
                        end)
                    end
                end)
            end
        end
    })
end

addToggle("Melee", "up1")
addToggle("Sword", "up2")
addToggle("DevilFruit", "up3")
addToggle("Special", "up4")
addToggle("Defense", "up5")

local Window = tab:AddFolder"Teleport"
MobsTP = {}
for i,v in pairs(workspace.Drop:GetChildren()) do
        table.insert(MobsTP,v.Name)
end

Window:AddList({text = "Mobs Zone", flag = "list", value = "==Select Zone==", values = MobsTP, callback = function(a) 
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(workspace.Drop[a].Position)
end})

NPCs = {}
for i,v in pairs(workspace.npcClick:GetChildren()) do
        table.insert(NPCs,v.Name)
end

Window:AddList({text = "NPCs", flag = "list", value = "==Select NPCs==", values = NPCs, callback = function(a) 
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(workspace.npcClick[a].HumanoidRootPart.Position)
end})
Window:AddLabel({text = "YouTube: Tora IsMe"})
Library:Init()