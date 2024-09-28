local adminLoader = loadstring(game:HttpGet("https://raw.githubusercontent.com/FFJ1/Roblox-Exploits/main/libs/admin/AdminLib.lua"))()

local adminLib = adminLoader.New({
  ["Prefix"] = "!",
  ["Admins"] = { -- Player IDs in the table as integer (change it to admins ids)
    game.Players.LocalPlayer.UserId
  }
})

adminLib.RegisterCommand({
  ["Name"] = "ping", -- Command name (no prefix)
  ["NoAdmin"] = false, -- Having it true will make this command won't work on admins
  ["Callback"] = function (handler)
    print(handler.CommandName) -- "ping"
    print(handler.PlainArgs) -- "!ping args here" will return "args here" as plain args.
    print(handler.Args) -- Same as plain args but in table, {"args", "here"}
    print(handler.Admin) -- The player instance of the admin who used the command.
    handler.Reply("Pong!") -- Will send a message back to chat with "Pong!"
  end
})
