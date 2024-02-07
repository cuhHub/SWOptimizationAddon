--------------------------------------------------------
-- [Priority] Configuration
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
addonConfiguration = {
    credit = {
        discordUsername = "cuh6_",
        discordServerInvite = "https://dsc.gg/cuhhubsw"
    },

    information = {
        addonName = "Optimization Addon",

        description = {
            short = "An addon that despawns objects to improve performance.",
            long = "An addon that periodically despawns objects to reduce desync and latency in multiplayer."
        },

        requiredDLCs = {
            -- {
            --     name = "Space",
            --     enabled = AuroraFramework.attributes.SpaceEnabled
            -- },

            -- {
            --     name = "Industrial Frontier",
            --     enabled = AuroraFramework.attributes.AridEnabled
            -- },

            -- {
            --     name = "Weapons",
            --     enabled = AuroraFramework.attributes.WeaponsEnabled
            -- }
        }
    },

    dev = {
        debugEnabled = true
    }
}