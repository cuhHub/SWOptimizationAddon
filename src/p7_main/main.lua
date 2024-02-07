--------------------------------------------------------
-- [Main] Stormworks Optimization Addon
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
g_savedata.userAddonConfig = {
    -- do not split "property.blabla" over multiple lines. stormworks parses the text, not the code, so it will not work and crash your game
    despawnCharacters = property.checkbox("Despawn Settings - Despawn characters (may break career missions)", false),
    despawnLootCrates = property.checkbox("Despawn Settings - Despawn money crates", true),
    despawnFlares = property.checkbox("Despawn Settings - Despawn flares", true)
}

local despawnExceptions = { -- index = object type
    [1] = g_savedata.userAddonConfig.despawnCharacters,

    [3] = g_savedata.userAddonConfig.despawnLootCrates,
    [24] = g_savedata.userAddonConfig.despawnLootCrates,

    [57] = g_savedata.userAddonConfig.despawnFlares,
    [62] = g_savedata.userAddonConfig.despawnFlares,
    [63] = g_savedata.userAddonConfig.despawnFlares,
    [68] = g_savedata.userAddonConfig.despawnFlares
}

-------------------------------
-- // Functions
-------------------------------
-- Attach debug code into all functions in the top layer of the provided table
---@param funcs table<integer, function>
---@param logger af_services_debugger_logger
attachDebugCodeMultiple = function(funcs, logger)
    for _, func in pairs(funcs) do
        if type(func) ~= "function" then
            goto continue
        end

        AuroraFramework.services.debuggerService.attach(func, logger)

        ::continue::
    end
end

-------------------------------
-- // Main
-------------------------------
---------- // Main
-- // Setup
-- Remove everything pending disposal
AuroraFramework.ready:connect(function()
    disposablesLibrary.dispose()
end)

-- // Addon
-- Despawn all objects periodically
local temporaryObjectSpawnPos = matrix.translation(0, 0, 0)
local temporaryObjectObjectType = 2

AuroraFramework.services.timerService.loop.create(0, function()
    -- this way of tracking objects is quite bruteforced, but it works, and its pretty much the only way to reliably get spawned objects
    local temporaryObject = server.spawnObject(temporaryObjectSpawnPos, temporaryObjectObjectType)
    disposablesLibrary.objects.dispose(temporaryObject) -- in case the addon gets reloaded before this entire function can complete

    -- spawn a new object
    local temporaryObject2 = server.spawnObject(temporaryObjectSpawnPos, temporaryObjectObjectType)
    disposablesLibrary.objects.dispose(temporaryObject2)

    -- an object (or multiple objects) was spawned, and not by us. track them
    for object_id = temporaryObject, temporaryObject2 do
        -- get the object's data. this is also technically a check to see whether or not the object exists
        local objectData = server.getObjectData(object_id)

        if not objectData then
            goto continue
        end

        -- check if we are allowed to despawn this object
        if despawnExceptions[objectData.object_type] then
            goto continue
        end

        -- despawn it
        server.despawnObject(object_id, true)

        if object_id ~= temporaryObject and object_id ~= temporaryObject2 then
            mainLogger:send("despawned %s", object_id)
        end

        ::continue::
    end
end)