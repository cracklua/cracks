local hookHandler = {}
local cacheFuncs = {}
local cacheIndex = 0

hookHandler.Hook = function (oldF, newF)
  return hookfunction(oldF, newF)
end

hookHandler.HookFunc = function (func)
  cacheIndex += 1
  local index = cacheIndex
  cacheFuncs[index] = {}
  cacheFuncs[index].func = hookfunction(func, function (...)
    task.spawn(cacheFuncs[index].Callback, {...})
    return cacheFuncs[index].func(...)
  end)
  
  cacheFuncs[index].Destroy = function ()
    hookfunction(func, cacheFuncs[index].func)
  end
  
  return cacheFuncs[index]
end

hookHandler.HookGame = function (method, ins, name)
  local handler = {}
  local oldF
  oldF = hookmetamethod(game, "__namecall", function (self, ...)
    if getnamecallmethod() == method then
      if self and self.Name == name and self:IsA(ins) then
        task.spawn(handler.Callback, {...})
      end
    end
    return oldF(self, ...)
  end)
  
  handler.Destroy = function ()
    hookmetamethod(game, "__namecall", oldF)
  end
  return handler
end

return hookHandler
