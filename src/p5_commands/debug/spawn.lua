--------------------------------------------------------
-- [Commands] Debug - Spawn
--------------------------------------------------------

--[[
    ----------------------------

    CREDIT:
        Author: @cuh6_ (Discord)
        GitHub Repository: https://github.com/Cuh4/SWOptimizationAddon

    ----------------------------
]]

-------------------------------
-- // Main
-------------------------------
-- Spawn a random object at the palyer's location
AuroraFramework.services.commandService.create(function(player, command, args)
    if not addonConfiguration.dev.debugEnabled then
        return
    end

    for objectType, _ in pairs(despawnExceptions) do
        server.spawnObject(player:getPosition(), objectType)
    end
end, "spawn", {"s"})