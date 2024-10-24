local ID = game.PlaceId
if ID == 16993380837 then
    print("Game Detected: RNG Gods")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Catto-YFCN/GatoHub/main/Scripts/RNG-Gods.lua"))()
elseif ID == 16510724413 then
    print("Game Detected: Pet Catchers")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Catto-YFCN/GatoHub/main/PetCatchersBETA"))()
elseif ID == 2631572400 then
    print("Game Detected: Ancient Egypt Roleplay")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Catto-YFCN/GatoHub/main/Scripts/Ancient-Egypt-RP.lua"))()
else
    print("Unknown Game ID or Unsupported Game!", ID)
end
