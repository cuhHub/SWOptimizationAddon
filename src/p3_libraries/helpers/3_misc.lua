--------------------------------------------------------
-- [Libraries] Helpers - Misc
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
g_savedata.helpersLibrary = {
    id = 0
}

helpersLibrary.misc = {
    incrementalID = function()
        g_savedata.helpersLibrary.id = g_savedata.helpersLibrary.id + 1
        return g_savedata.helpersLibrary.id
    end
}