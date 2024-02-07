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

    server.spawnObject(player:getPosition(), math.random(1, 74))
end, "explode", {"ex"})