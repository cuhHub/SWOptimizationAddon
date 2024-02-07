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

despawnExceptions = { -- index = object type
    [1] = not g_savedata.userAddonConfig.despawnCharacters,

    [3] = not g_savedata.userAddonConfig.despawnLootCrates,
    [24] = not g_savedata.userAddonConfig.despawnLootCrates,

    [57] = not g_savedata.userAddonConfig.despawnFlares,
    [62] = not g_savedata.userAddonConfig.despawnFlares,
    [63] = not g_savedata.userAddonConfig.despawnFlares,
    [68] = not g_savedata.userAddonConfig.despawnFlares
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
-- // Addon
-- Despawn all objects periodically
local temporaryObjectSpawnPos = matrix.translation(0, 0, 0)
local temporaryObjectObjectType = 2

AuroraFramework.callbacks.onTick.main:connect(function()
    -- spawn a new object
    local temporaryObject = server.spawnObject(temporaryObjectSpawnPos, temporaryObjectObjectType)

    if not old then
        old = temporaryObject
    end

    -- an object (or multiple objects) was spawned, and not by us. track them
    for object_id = old, temporaryObject do
        -- mainLogger:setSuppressed(object_id == temporaryObject or object_id == old)
        -- mainLogger:send("%s | %s/%s", object_id, old, temporaryObject)

        -- get the object's data. this is also technically a check to see whether or not the object exists
        local objectData = server.getObjectData(object_id)

        if not objectData then
            -- mainLogger:send("no object data")
            goto continue
        end

        -- check if we are allowed to despawn this object
        if despawnExceptions[objectData.object_type] then
            -- mainLogger:send("in exceptions")
            goto continue
        end

        -- despawn it
        server.despawnObject(object_id, true)
        -- mainLogger:send("despawned")

        ::continue::
    end

    -- update old
    old = temporaryObject
end)