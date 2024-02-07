--------------------------------------------------------
-- [Libraries] Disposables - Main
--------------------------------------------------------

--[[
    ----------------------------

    CREDIT:
        Author: @cuh6_ (Discord)
        GitHub Repository: https://github.com/Cuh4/SWOptimizationAddon

    ----------------------------
]]

-------------------------------
-- // Variables
-------------------------------
g_savedata.disposablesLibrary = {
    pendingDisposals = {} ---@type table<string, table<integer, any>>
}

-------------------------------
-- // Main
-------------------------------
disposablesLibrary = {
    dispose = function()
        disposablesLibrary.disposeEvent:fire()
    end,

    disposeEvent = AuroraFramework.libraries.events.create("disposablesLibrary_dispose")
}