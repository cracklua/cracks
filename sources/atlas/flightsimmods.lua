local ffpractice = 4103061728.5 * 2
-- get the flight simulator plane
--  / _` | | '__| '_ \| |/ _` | '_ \ / _ \/ __|
-- | (_| | | |  | |_) | | (_| | | | |  __/\__ \
--  \__,_|_|_|  | .__/|_|\__,_|_| |_|\___||___/
--              |_|                            
--
--  / _` | | '__| '_ \| |/ _` | '_ \ / _ \/ __|
-- | (_| | | |  | |_) | | (_| | | | |  __/\__ \
--  \__,_|_|_|  | .__/|_|\__,_|_| |_|\___||___/
---              |_|                              / _` | | '__| '_ \| |/ _` | '_ \ / _ \/ __|
-- | (_| | | |  | |_) | | (_| | | | |  __/\__ \
--  \__,_|_|_|  | .__/|_|\__,_|_| |_|\___||___/
--              |_|                              / _` | | '__| '_ \| |/ _` | '_ \ / _ \/ __|
-- | (_| | | |  | |_) | | (_| | | | |  __/\__ \
--  \__,_|_|_|  | .__/|_|\__,_|_| |_|\___||___/
--              |_|                              / _` | | '__| '_ \| |/ _` | '_ \ / _ \/ __|
-- | (_| | | |  | |_) | | (_| | | | |  __/\__ \
--  \__,_|_|_|  | .__/|_|\__,_|_| |_|\___||___/
--              |_|                              / _` | | '__| '_ \| |/ _` | '_ \ / _ \/ __|
-- | (_| | | |  | |_) | | (_| | | | |  __/\__ \
--  \__,_|_|_|  | .__/|_|\__,_|_| |_|\___||___/
--              |_|                              / _` | | '__| '_ \| |/ _` | '_ \ / _ \/ __|
-- | (_| | | |  | |_) | | (_| | | | |  __/\__ \
--  \__,_|_|_|  | .__/|_|\__,_|_| |_|\___||___/
--              |_|                              / _` | | '__| '_ \| |/ _` | '_ \ / _ \/ __|
-- | (_| | | |  | |_) | | (_| | | | |  __/\__ \
--  \__,_|_|_|  | .__/|_|\__,_|_| |_|\___||___/
--              |_|                              / _` | | '__| '_ \| |/ _` | '_ \ / _ \/ __|
-- | (_| | | |  | |_) | | (_| | | | |  __/\__ \
--  \__,_|_|_|  | .__/|_|\__,_|_| |_|\___||___/
--              |_|                              / _` | | '__| '_ \| |/ _` | '_ \ / _ \/ __|
-- | (_| | | |  | |_) | | (_| | | | |  __/\__ \
--  \__,_|_|_|  | .__/|_|\__,_|_| |_|\___||___/
--              |_|                              / _` | | '__| '_ \| |/ _` | '_ \ / _ \/ __|
-- | (_| | | |  | |_) | | (_| | | | |  __/\__ \
--  \__,_|_|_|  | .__/|_|\__,_|_| |_|\___||___/
--              |_|                              / _` | | '__| '_ \| |/ _` | '_ \ / _ \/ __|
-- | (_| | | |  | |_) | | (_| | | | |  __/\__ \
--  \__,_|_|_|  | .__/|_|\__,_|_| |_|\___||___/
--              |_|                              / _` | | '__| '_ \| |/ _` | '_ \ / _ \/ __|
-- | (_| | | |  | |_) | | (_| | | | |  __/\__ \
--  \__,_|_|_|  | .__/|_|\__,_|_| |_|\___||___/
--              |_|                              / _` | | '__| '_ \| |/ _` | '_ \ / _ \/ __|
-- | (_| | | |  | |_) | | (_| | | | |  __/\__ \
--  \__,_|_|_|  | .__/|_|\__,_|_| |_|\___||___/
--              |_|                              / _` | | '__| '_ \| |/ _` | '_ \ / _ \/ __|
-- | (_| | | |  | |_) | | (_| | | | |  __/\__ \
--  \__,_|_|_|  | .__/|_|\__,_|_| |_|\___||___/
--              |_|                              / _` | | '__| '_ \| |/ _` | '_ \ / _ \/ __|
-- | (_| | | |  | |_) | | (_| | | | |  __/\__ \
--  \__,_|_|_|  | .__/|_|\__,_|_| |_|\___||___/
--              |_|                              / _` | | '__| '_ \| |/ _` | '_ \ / _ \/ __|
-- | (_| | | |  | |_) | | (_| | | | |  __/\__ \
--  \__,_|_|_|  | .__/|_|\__,_|_| |_|\___||___/
--              |_|                            












local ffmain = 4102449570 * 2














local ffleague = 4103063493.5 * 2














local amain = 3078739363 * 2










local apractice = 3366553389.5 * 2
if not hookmetamethod then warn("Error ".. "Loading ".."Bypass") return end
if game.PlaceId == ffmain or game.PlaceId == ffleague or game.PlaceId == ffpractice then
    -- -- -- --V1
    -- local LPH_OBFUSCATED = false
    -- local hooktest = hookmetamethod
    
    -- if not LPH_OBFUSCATED  and hooktest then
    --     getfenv().LPH_NO_VIRTUALIZE = function(f) return f end
    --     getfenv().LPH_PRINT = function(...)
    --         local args = {...}
    --         local str = ""
    --         for i, v in ipairs(args) do
    --             str = str .. tostring(v) .. "\t"
    --         end
    --         print("Luraph " .. str)
    --     end
    --     getfenv().LPH_HOOK_FUNCTION = function(func, handler)
    --         return hookfunction(func, LPH_NO_VIRTUALIZE(handler))
    --     end
    --     getfenv().LPH_GET_METATABLE = function(obj)
    --         return getrawmetatable(obj)
    --     end
    --     getfenv().LPH_SET_METATABLE = function(obj, mt)
    --         return setmetatable(obj, mt)
    --     end
    --     getfenv().LPH_DEBUG_INFO = function(func, what)
    --         return debug.info(func, what)
    --     end
    --     getfenv().LPH_GET_ENV = function()
    --         return getfenv()
    --     end
    --     getfenv().LPH_GET_GC = function(all)
    --         return getgc(all)
    --     end
    --     getfenv().LPH_IS_CALLER = function(level)
    --         return checkcaller(level)
    --     end
    --     getfenv().LPH_IS_FUNCTION = function(f)
    --         return type(f) == "function"
    --     end
    --     getfenv().LPH_IS_TABLE = function(t)
    --         return type(t) == "table"
    --     end
    --     getfenv().LPH_RAWLEN = function(t)
    --         return rawlen(t)
    --     end
    -- end
    -- -- ff
    -- ffcalc = 4102449570 * 2
    -- local bypassloaded = false
    -- if not hooktest then
    --     bypassloaded = true
    -- end
    -- if game.PlaceId == ffcalc and hooktest then
    --     local Hooks = {}
    --     local Targets = {}
    --     local Whitelisted = {
    --         {655, 775, 724, 633, 891},
    --         {760, 760, 771, 665, 898},
    --         {660, 759, 751, 863, 771},
    --     }
    
    --     local function TableEquality(x, y)
    --         if LPH_RAWLEN(x) ~= LPH_RAWLEN(y) then
    --             return false
    --         end
    
    --         for i, v in ipairs(x) do
    --             if y[i] ~= v then
    --                 return false
    --             end
    --         end
    
    --         return true
    --     end
    --     LPH_NO_VIRTUALIZE(function()
    --         for i, v in ipairs(LPH_GET_GC(true)) do
    --             if LPH_IS_FUNCTION(v) then
    --                 local ScriptTrace, Line = LPH_DEBUG_INFO(v, "sl")
    
    --                 if string.find(ScriptTrace, "PlayerModule.LocalScript") and table.find({42, 51, 61}, Line) then
    --                     table.insert(Targets, v)
    --                 end
    --             end
    
    --             if LPH_IS_TABLE(v) and LPH_RAWLEN(v) == 19 and LPH_GET_METATABLE(v) then
    --                 Targets.__call = rawget(LPH_GET_METATABLE(v), "__call")
    --             end
    --         end
    --     end)()
    --     if not (Targets[1] and Targets[2] and Targets[3] and Targets.__call) then
    --         bypassloaded = true
    --     end
    --     if bypassloaded ~= true then
    --         local ScriptPath = LPH_DEBUG_INFO(Targets[1], "s")
    --         Hooks.debug_info = LPH_HOOK_FUNCTION(debug.info, LPH_NO_VIRTUALIZE(function(...)
    --             if not LPH_IS_CALLER() and TableEquality({...}, {2, "s"}) then
    --                 return ScriptPath
    --             end
    
    --             return Hooks.debug_info(...)
    --         end))
    --         LPH_HOOK_FUNCTION(Targets[1], LPH_NO_VIRTUALIZE(function() end))
    --         LPH_HOOK_FUNCTION(Targets[2], LPH_NO_VIRTUALIZE(function() end))
    --         LPH_HOOK_FUNCTION(Targets[3], LPH_NO_VIRTUALIZE(function() end))
    --         Hooks.__call = LPH_HOOK_FUNCTION(Targets.__call, LPH_NO_VIRTUALIZE(function(self, ...)
    --             if
    --                 TableEquality(Whitelisted[1], {...}) or
    --                 TableEquality(Whitelisted[2], {...}) or
    --                 TableEquality(Whitelisted[3], {...})
    --             then
    --                 return Hooks.__call(self, ...)
    --             end
    --         end))
    --         bypassloaded = true
    --     end
    -- else
    --     bypassloaded = true 
    -- end
    -- while bypassloaded == false do
    --     task.wait(1)
    -- end
    -- return
    
    
    -- >> Services
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local Players = game:GetService("Players")
    
    -- >> Values
    local HandshakeRemote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("CharacterSoundEvent")
    local FakeTable = {}
    local LastCheck = nil
    local LocalPlayer = Players.LocalPlayer
    
    -- >> Bypass
    local Namecall
    Namecall = hookmetamethod(game, '__namecall', newcclosure(function(self, ...)
        local Method = getnamecallmethod()
        local Args = {...}
    
        if not checkcaller() and (self == HandshakeRemote) and (Method == "fireServer") and string.find(Args[1], "AC") then
            if (#FakeTable == 0) then
                FakeTable = {table.unpack(Args[2], 2, 18)}
            else
                for Index, Value in next, FakeTable do
                    Args[2][Index + 1] = Value
                end
    
                LastCheck = tick()
            end
        end
    
        return Namecall(self, ...)
    end))
    
    for i, v in next, getgc() do
        if typeof(v) == "function" and islclosure(v) then
            if (#getprotos(v) == 1) and table.find(getconstants(getproto(v, 1)), 4000001) then
                hookfunction(v, function() end)
            end
        end
    end
    
    -- >> Main Code
    task.spawn(function()
        while task.wait(0.4) do
            if LastCheck and (tick() - LastCheck) >= 20 then
                LocalPlayer:Kick("Bypass ".."Timed".." Out")
                task.wait(3)
                game:Shutdown()
            end
        end
    end)
    task.wait(0.41)
elseif game.PlaceId == amain or game.PlaceId == apractice then
    originalhk = hookmetamethod
    local remote = game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("GameService"):WaitForChild("RF"):WaitForChild("GetTicker")
    if originalhk then
        local __namecall
        __namecall = hookmetamethod(game, "__namecall", function(self, ...)
            local args = {...}
            if self == remote and getnamecallmethod():lower() == "fireserver" or self == remote and getnamecallmethod():lower() == "invokeserver" then
                return nil
            else
                return __namecall(self, ...)
            end
        end)
    end
end
