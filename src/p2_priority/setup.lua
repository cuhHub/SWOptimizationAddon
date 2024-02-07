--------------------------------------------------------
-- [Priority] Setup
--------------------------------------------------------

--[[
    ----------------------------

    CREDIT:
        Author: @cuh6_ (Discord)
        GitHub Repository: https://github.com/cuhHub/SWOptimizationAddon

    ----------------------------
]]

-------------------------------
-- // Setup
-------------------------------
-- Create logger
mainLogger = AuroraFramework.services.debuggerService.createLogger("Main", false)
mainLogger:setSuppressed(not addonConfiguration.dev.debugEnabled)