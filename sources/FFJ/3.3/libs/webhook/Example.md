## Webhook Lib Example

Code:
```lua
local webLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/FFJ1/Roblox-Exploits/main/libs/webhook/WebhookLib.lua"))()

webLib.Send(options)
```

#### Options:
|Name|Value|Type|Optional
|---|---|---|---|
|options.Service|The name of your service.|`string`|`No`
|options.Auth|The authorization you have for your service.|`string`|`No`
|options.UserId|The player's user id to log.|`number`|`No`
|options.Fields|A list of additional data to be logged.|`table`|`Yes`
|options.Embed|Instructions for embed modifications|`table`|`Yes`
|options.Embed.Title|Custom title for embed|`string`|`Yes`
|options.Embed.Description|Custom description for embed|`string`|`Yes`
|options.Embed.Content|Unembedded messag|`string`|`Yes`
|options.Embed.Color|Custom color value for embed. Use [this tool](https://www.mathsisfun.com/hexadecimal-decimal-colors.html) to convert hex to decimal color value.|`number`|`Yes`

```{
  ["Service"] = "YourService_Hub",
  ["Auth"] = "YourHubAuth",
  ["UserId"] = game.Players.LocalPlayer.UserId,
  ["Fields"] = { -- Additional data to be sent to webhook.
    ["Game"] = "Game Name",
    ["Job ID"] = game.JobId
  },
  ["Embed"] = {
    ["Color"] = 16735433, -- Your color value, you can use "https://www.mathsisfun.com/hexadecimal-decimal-colors.html" to convert your hex color code into decimal
    ["Content"] = "@everyone" -- This won't be in embed
  }
})
```