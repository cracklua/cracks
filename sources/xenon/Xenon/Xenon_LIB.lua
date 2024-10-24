local Library = loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()

local areas = game:GetService("Workspace").Mobs[1]:GetChildren()
local areasTable = {}

for i,v in pairs(areas) do
      table.insert(areasTable, v.Name)
end
getgenv().win = nil

local PhantomForcesWindow = Library:NewWindow("TEST UI")

local KillingCheats = PhantomForcesWindow:NewSection("Main")

KillingCheats:CreateDropdown("DropDown", areasTable, 2, function(value)
getgenv().area = value
end)

KillingCheats:CreateToggle("Auto Ez", function()
getgenv().win = area
win()
local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
		for i,v in pairs(areas) do
		    if v.Name == area then
		       for i,v in pairs(v:GetDescendants()) do
		          if v:IsA("Part") and v.Name == ("PlayerPart") then
		             hrp.CFrame = v.CFrame
		          end
		       end
		    end
		end
end)

function win()
while getgenv().win do
local A_1 = 1
local Event = game:GetService("ReplicatedStorage").RemoveC
Event:FireServer(A_1)
local A_1 = "1"
local Event = game:GetService("ReplicatedStorage").WinEvent
Event:FireServer(A_1)
local A_1 = 0
local Event = game:GetService("ReplicatedStorage").RemoveC
Event:FireServer(A_1)
wait()
end
end
