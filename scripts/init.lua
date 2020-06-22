--  Load configuration options up front
ScriptHost:LoadScript("scripts/settings.lua")

Tracker:AddItems("items/common.json")
Tracker:AddItems("items/dungeon_items.json")
Tracker:AddItems("items/keys.json")
Tracker:AddItems("items/labels.json")

if not (string.find(Tracker.ActiveVariantUID, "items_only")) then
    ScriptHost:LoadScript("scripts/logic_common.lua")
    ScriptHost:LoadScript("scripts/logic_custom.lua")
    Tracker:AddMaps("maps/maps.json")
    if not (string.find(Tracker.ActiveVariantUID, "inverted")) then
        Tracker:AddLocations("locations/overworld.json")
    else
        Tracker:AddLocations("inverted_locations/overworld.json")
    end
    Tracker:AddLocations("locations/dungeons.json")    
end

Tracker:AddItems("items/chest_proxies.json")
Tracker:AddLayouts("layouts/items.json")
Tracker:AddLayouts("layouts/tracker.json")

-- Select a broadcast view layout based on whether the current variant is keysanity or not
if not (string.find(Tracker.ActiveVariantUID, "keys")) then
    Tracker:AddLayouts("layouts/standard_broadcast.json")
else
    Tracker:AddLayouts("layouts/keysanity_broadcast.json")
end

ScriptHost:LoadScript("scripts/autotracking.lua")
