--------------------------------------------------------
-- [Commands] Debug - Spawn
--------------------------------------------------------

--[[
    ----------------------------

    CREDIT:
        Author: @cuh6_ (Discord)
        GitHub Repository: https://github.com/cuhHub/SWOptimizationAddon

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

    for i = 1, 250 do
        server.spawnObject(player:getPosition(), 56)
    end
end, "spawn", {"s"})