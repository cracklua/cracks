local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local players = game:GetService("Players")
local localPlayer = players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local PlayerGui = localPlayer:WaitForChild("PlayerGui")

OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/ionlyusegithubformcmods/1-Line-Scripts/main/Mobile%20Friendly%20Orion')))()


local Library = {
    Items = {},
}

if rconsoleprint then
	rconsoleprint(changelog)
end


local Window = OrionLib:MakeWindow({Name = "Xenon HUB", HidePremium = true, IntroEnabled = false, SaveConfig = false, ConfigFolder = "OrionTest"})

local mainTab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://13313903300",
	PremiumOnly = false
})

local miscTab = Window:MakeTab({
	Name = "Misc",
	Icon = "rbxassetid://16307658016",
	PremiumOnly = false
})

local dungeonTab = Window:MakeTab({
	Name = "Dungeon",
	Icon = "rbxassetid://180083965",
	PremiumOnly = false
})

local summonTab = Window:MakeTab({
	Name = "Summon",
	Icon = "rbxassetid://938790070",
	PremiumOnly = false
})

local teleportTab = Window:MakeTab({
	Name = "Teleport",
	Icon = "rbxassetid://6723742952",
	PremiumOnly = false
})

local settingsTab = Window:MakeTab({
	Name = "Settings",
	Icon = "rbxassetid://4738901432",
	PremiumOnly = false
})

local creditTab = Window:MakeTab({
	Name = "Credits",
	Icon = "rbxassetid://7731404863",
	PremiumOnly = false
})
	
for i,v in pairs(gethui().Orion:GetDescendants()) do
	if v.ClassName == "Frame" and v.BackgroundTransparency < 0.3 then
		v.BackgroundTransparency = 0.05
	end
end
for i,v in pairs(gethui().Orion:GetDescendants()) do
	if v.ClassName == "Frame" and v.BackgroundTransparency < 0.3 and v.BackgroundColor3 == Color3.fromRGB(32, 32, 42) then
		v.BackgroundTransparency = 1
	end
end

-- Services

local Players = game:GetService("Players")
local RS = game:GetService("RunService")
local HS = game:GetService("HttpService")

-- Variables

local Plr = Players.LocalPlayer
local Char = Plr.Character or Plr.CharacterAdded:Wait()
local Root = Char:WaitForChild("HumanoidRootPart")

local Points = {}

-- Modules

local SelfModules = {
	Directory = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Directory.lua"))(),
    Discord = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Discord.lua"))(),
    Inviter = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Discord%20Inviter/Source.lua"))(),
}

-- Directory

local Directory = SelfModules.Directory.Create({
	["Vynixu's Teleport Tool"] = {
		"Configs",
	},
})

function onCharacterAdded(char)
    Char, Root = char, char:WaitForChild("HumanoidRootPart")
end

function create(vec3)
	if #Points > 0 then
		local point, nearest = nil, 1

		for _, v in next, Points do
			local dist = (v.Position - vec3).Magnitude

			if dist < nearest then
				point, nearest = v, dist
			end
		end

		if point then
			point.Position = vec3; return
		end
	end
	
	-- Point

	local point = Instance.new("Part")
	point.Anchored = true
	point.CanCollide = false
	point.Color = Color3.new(1, 1, 1)
	point.Material = Enum.Material.Neon
	point.Position = vec3
	point.Shape = Enum.PartType.Ball
	point.Size = Vector3.new(0.4, 0.4, 0.4)

	local attachment = Instance.new("Attachment", point)

	-- Beam

	local beam = Instance.new("Beam")
	beam.Brightness = 5
	beam.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)), ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1)) })
	beam.FaceCamera = true
	beam.Width0, beam.Width1 = 0.1, 0.1
	beam.Attachment0 = attachment
	beam.Parent = point

	-- ClickDetector

	local clickDetector = Instance.new("ClickDetector")
	clickDetector.MaxActivationDistance = 9e9

	clickDetector.MouseHoverEnter:Connect(function()
		point.Color = Color3.new(1, 0, 0)
	end)

	clickDetector.MouseHoverLeave:Connect(function()
		point.Color = Color3.new(1, 1, 1)
	end)

	clickDetector.MouseClick:Connect(function()
		remove(point)
	end)

	clickDetector.Parent = point
	point.Parent = workspace
	
	return point
end

function update()
	for i, v in next, Points do
		local nextPoint = Points[i + 1]
		
		if nextPoint then
			v.Beam.Attachment1 = nextPoint.Attachment
            v.Color = Color3.new(1, 1, 1)
		end
	end

    Points[#Points].Color = Color3.fromRGB(0, 255, 128)
    Points[1].Color = Color3.fromRGB(85, 255, 0)
end

function add(vec3)
	Points[#Points + 1] = create(vec3)
	
	update()
end

function remove(point)
	local pointIdx = table.find(Points, point)
	
	if pointIdx then
		table.remove(Points, pointIdx)
		point:Destroy()
		
		update()
	end
end

local function clear()
	for i = #Points, 1, -1 do
		remove(Points[i])
	end
end

function teleportToPoint(vec3)
	local bV = Instance.new("BodyVelocity")
	bV.Velocity, bV.MaxForce = Vector3.new(), Vector3.new(9e9, 9e9, 9e9); bV.Parent = Root

	local reached = false
	local connection = RS.Stepped:Connect(function(_, step)
		local diff = vec3 - Root.Position

		Root.CFrame = CFrame.new(Root.Position + diff.Unit * math.min(x.Value * step, diff.Magnitude))
		
		if (Vector3.new(vec3.X, 0, vec3.Z) - Vector3.new(Root.Position.X, 0, Root.Position.Z)).Magnitude < 0.1 then
			Root.CFrame = CFrame.new(vec3)
            
            reached = true
		end
	end)

	repeat task.wait() until reached

	connection:Disconnect()
    bV:Destroy()
end

-- Setup

onCharacterAdded(Char)
Plr.CharacterAdded:Connect(onCharacterAdded, char)



local Section = mainTab:AddSection("Tool", {default = true})

Library.Items.PlacePoint = mainTab:AddBind("Place Point", Enum.KeyCode.KeypadPlus, {}, function()
    add(Root.Position)
end)

mainTab:AddButton("Clear All", clear)

Library.Items.TestMode = mainTab:AddDropdown("Test Mode", {"Normal", "Reverse"}, {default = "Normal"}, function() end)

mainTab:AddButton("Test Sequence", function()
    for i, v in next, Points do
        local point = Points[Library.Items.TestMode.Selected == "Normal" and i or #Points - (i - 1)]

        teleportToPoint(point.Position)
    end
end)

Library.Items.TeleportSpeed = mainTab:AddSlider("Teleport Speed", 20, 100, 50, {rounded = true}, function() end)



gethui().Orion.Name = "OrionEdited"
