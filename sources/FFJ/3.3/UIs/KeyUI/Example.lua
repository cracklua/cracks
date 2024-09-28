--[[
Join discord for new updates notifications
Discord: https://discord.gg/JqeYcfmmh9
See the bottom also for some functions
This example uses the KeyUI v2
]]--

local KeyUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/FFJ1/Roblox-Exploits/main/UIs/KeyUI/KeyUIv2.lua"))()

local window = KeyUI.CreateWindow({
  ["KeySettings"] = {
-- Look at bottom of this page for the guide.
    ["Key"] = "$2a$10$DpXYsm/gJHdknMHeefRPGe/3Lh1E0I7eSzs17uoUrdcenGYoUJHru",
    ["Type"] = "plain",
    ["Encryption"] = "bcrypt"
  },
  ["GetKeyLink"] = "https://example.com", -- Link that users can copy to get the key from.
  ["Whitelisted"] = {
    1234, 1234, 1234
  }, -- An array of UserIDs or a raw url, format at bottom.
  ["Theme"] = {
-- Optional, custom themes. (hex only)
    ["Text"] = "00ff00",
    ["Border"] = "00ff00",
    ["Background"] = "000000"
  },
  ["Text"] = {
-- Optional, custom messages.
    ["Title"] = "Key System",
    ["Body"] = "Enter the key to access the contents of the script.",
    ["Fail"] = "Access denied",
    ["Pass"] = "Access granted"
  }
})

-- Events Functions
window.Failed = function()
print("You gave a wrong Key")
end

window.Passed = function()
print("You gave the correct key")
end

window.Whitelisted = function()
print("You were bypassed for being whitelisted.")
end

window.Cancelled = function()
print("You cancelled the UI")
end

-- window.Destroy() - Doesn't takes any parameter and destroys the gui without taking any user input or confirmation. Automatically destroyed if the user has passed, whitelisted or cancelled.

--[[

---------KEY SETTINGS---------

Supported Key types: (Required)
1. plain: A normal plain string with your key.
2. url: A raw url of any website that displays the key.

Supported Encryption types: (Optional)
1. bcrypt: This is your key in encrypted format. Using this ensures that your key cannot be viewed but can only be matched with a key if it's correct or not. You can generate your encrypted key using ONLY 10 OR LESS COST/ROUNDS at https://bcrypt-generator.com for it to work.

--------------------------------------


Template for Whitelisted Raw Link:
{
   "Whitelisted":[
      123456789,
      123456789,
      123456789
   ]
}

]]--
