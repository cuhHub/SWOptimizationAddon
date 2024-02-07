--------------------------------------------------------
-- [Priority] Setup
--------------------------------------------------------

--[[
    ----------------------------

    CREDIT:
        Author: @cuh6_ (Discord)
        GitHub Repository: https://github.com/Cuh4/SWOptimizationAddon

    ----------------------------
]]

-------------------------------
-- // Setup
-------------------------------
-- Create logger
mainLogger = AuroraFramework.services.debuggerService.createLogger("Main", true)
mainLogger:setSuppressed(not addonConfiguration.dev.debugEnabled)