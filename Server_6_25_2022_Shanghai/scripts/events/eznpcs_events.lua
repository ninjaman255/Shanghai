local eznpcs = require('scripts/ezlibs-scripts/eznpcs/eznpcs')
local ezmemory = require('scripts/ezlibs-scripts/ezmemory')
local ezmystery = require('scripts/ezlibs-scripts/ezmystery')
local ezweather = require('scripts/ezlibs-scripts/ezweather')
local ezwarps = require('scripts/ezlibs-scripts/ezwarps/main')
local ezencounters = require('scripts/ezlibs-scripts/ezencounters/main')
local helpers = require('scripts/ezlibs-scripts/helpers')

local event1 = {
    name="Kogasa",
    action=function (npc,player_id,dialogue,relay_object)
        return async(function()
        Net.initiate_encounter(player_id, "/server/assets/bosses/Kogasa.zip")
        return dialogue.custom_properties["Next 1"]
    end)
end
}
eznpcs.add_event(event1)

local event2 = {
    name="Yuki",
    action=function (npc,player_id,dialogue,relay_object)
        return async(function()
        Net.initiate_encounter(player_id, "/server/assets/bosses/Yuki.zip")
        return dialogue.custom_properties["Next 1"]
    end)
end
}
eznpcs.add_event(event2)

local event3 = {
    name="Volcanoman",
    action=function (npc,player_id,dialogue,relay_object)
        return async(function()
        Net.initiate_encounter(player_id, "/server/assets/bosses/Volcanoman.zip")
        return dialogue.custom_properties["Next 1"]
    end)
end
}
eznpcs.add_event(event3)

local event4 = {
    name="Hectia",
    action=function (npc,player_id,dialogue,relay_object)
        return async(function()
        Net.initiate_encounter(player_id, "/server/assets/bosses/Hectia.zip")
        return dialogue.custom_properties["Next 1"]
    end)
end
}
eznpcs.add_event(event4)

local event5 = {
    name="Yumeko",
    action=function (npc,player_id,dialogue,relay_object)
        return async(function()
        Net.initiate_encounter(player_id, "/server/assets/bosses/Yumeko.zip")
        return dialogue.custom_properties["Next 1"]
    end)
end
}
eznpcs.add_event(event5)
