--------------------------------------------------------
-- [Commands] Debug - Save Data
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
-- Print out g_savedata
AuroraFramework.services.commandService.create(function(player, command, args)
    if not addonConfiguration.dev.debugEnabled then
        return
    end

    mainLogger:send(g_savedata)
end, "savedata", {"sd"})