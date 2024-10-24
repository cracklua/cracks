local Library = loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()

        local PhantomForcesWindow = Library:NewWindow("StarRail Sim")
        local x = PhantomForcesWindow:NewSection("Main")

--Values
_G.pet = false
getgenv().TPPlace = "string"

getgenv().potion = false
getgenv().slot = false
--function

function Teleport(teleportPlace)
    local player = game.Players.LocalPlayer
    player.Character.HumanoidRootPart.CFrame = teleportPlace
end
function potion()
    while getgenv().potion do task.wait()
    local playerhead = game.Players.LocalPlayer.Character.Head
        for i,v in pairs(game:GetService("Workspace").Machines["扭蛋机"]:GetDescendants()) do
        if v.Name == "TouchInterest" and v.Parent then
            firetouchinterest(playerhead, v.Parent, 0)
            wait(0.01)
            firetouchinterest(playerhead, v.Parent, 1)
            end
        end
    end
end
function pet()
    while _G.pet do task.wait()
        game:GetService("ReplicatedStorage").Events.Hero.HeroAbility:FireServer(workspace.UserPets["1116656080"]["Pom-Pom"],"05-Emit")

game:GetService("ReplicatedStorage").Events.Hero.HeroAttack:FireServer(workspace.UserPets["1116656080"]["Pom-Pom"])

local args = {
    [1] = workspace.UserPets:FindFirstChild("1116656080"):FindFirstChild("Black Swan")
}

game:GetService("ReplicatedStorage").Events.Hero.HeroAttack:FireServer(unpack(args))

local args = {
    [1] = workspace.UserPets:FindFirstChild("1116656080"):FindFirstChild("Black Swan"),
    [2] = "Damage01"
}

game:GetService("ReplicatedStorage").Events.Hero.HeroAbility:FireServer(unpack(args))

local args = {
    [1] = workspace.UserPets:FindFirstChild("1116656080"):FindFirstChild("Black Swan"),
    [2] = "Damage02"
}

game:GetService("ReplicatedStorage").Events.Hero.HeroAbility:FireServer(unpack(args))

local args = {
    [1] = workspace.UserPets:FindFirstChild("1116656080"):FindFirstChild("Black Swan"),
    [2] = "Damage03"
}

game:GetService("ReplicatedStorage").Events.Hero.HeroAbility:FireServer(unpack(args))

local args = {
    [1] = workspace.UserPets:FindFirstChild("1116656080").Sparkle
}

game:GetService("ReplicatedStorage").Events.Hero.HeroAttack:FireServer(unpack(args))

local args = {
    [1] = workspace.UserPets:FindFirstChild("1116656080").Sparkle,
    [2] = "02"
}

game:GetService("ReplicatedStorage").Events.Hero.HeroAbility:FireServer(unpack(args))
    end
end

    --Main
        x:CreateToggle("Claim Potion", function(value)
        getgenv().potion = value
        potion()
                end)

local slot = {
    "Slot001",
    "Slot002",
    "Slot003",
    "Slot004",
    "Slot005",
}

function slots()
  while getgenv().slot do task.wait()
        for i,v in (slot) do
        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Stats"):WaitForChild("ClaimSlot"):InvokeServer(v)
        end
    end
 end

        x:CreateToggle("Auto SlotMachine", function(Value)
        getgenv().slot = Value 
        slots()
        end)

        --[[x:CreateToggle("Auto Collect", function(Value)
        c = Value 
        while c do
          pcall(function() 
            local playerhead = game.Players.LocalPlayer.Character.Head
for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
  if v.Name == "TouchInterest" and v.Parent then
    firetouchinterest(playerhead, v.Parent, 0)
    wait(0.01)
    firetouchinterest(playerhead, v.Parent, 1)
    
    end
end
end)
        end
  wait()
        end)]]

        x:CreateToggle("Auto Power", function(Value)
        a = Value 
        while a do task.wait()
          pcall(function()
        game:GetService("ReplicatedStorage").Events.Fight.ClickDamage:FireServer()
            end)
          end
        end)

    x:CreateToggle("Auto Ability Pet", function(value)
        _G.pet = value
        pet()
        end)

    x:CreateDropdown("Zone", {"World 1", "World 2", "World 3", "World 4"}, 1, function(value)
         getgenv().TPPlace = value
    end)

    x:CreateButton("Teleport", function()
        if getgenv().TPPlace == "World 1" then
            Teleport(game:GetService("Workspace").Teleport.World001.CFrame)
         elseif getgenv().TPPlace == "World 2" then
            Teleport(game:GetService("Workspace").Teleport.World002.CFrame)
            elseif getgenv().TPPlace == "World 3" then
                Teleport(game:GetService("Workspace").Teleport.World003.CFrame)
            elseif getgenv().TPPlace == "World 4" then
                Teleport(game:GetService("Workspace").Teleport.World004.CFrame)
         end
    end)