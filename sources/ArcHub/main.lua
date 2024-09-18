local placeId = game.PlaceId

if placeId == 4520749081 or placeId == 6381829480 or placeId == 15759515082 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ChopLoris/ArcHub/main/run.lua"))()
elseif placeId == 5931540094 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ChopLoris/ArcHub/main/raid.lua"))()
end

local bb = game:GetService("VirtualUser")

game:GetService("Players").LocalPlayer.Idled:connect(
    function()
        bb:CaptureController()
        bb:ClickButton2(Vector2.new())
    end
)

game.Players.PlayerAdded:Connect(function(v)
    local userId = v.UserId
    if userId == 509672020 then
        game.Players.LocalPlayer:Kick("Crash")
    end
end)