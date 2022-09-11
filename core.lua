local ADDON_NAME, ns = ...

local faction = UnitFactionGroup("player")
local race = select(2, UnitRace("player"))

local function PlayerHasPet(item)
    return C_PetJournal.GetNumCollectedInfo(item.reward.species) >= 1
end

local function PlayerHasMount(item)
    return select(11, C_MountJournal.GetMountInfoByID(item.reward.mountid))
end

local function PlayerHasTransmog(item)
    local CTC = C_TransmogCollection
    if CTC.PlayerHasTransmog(item.id) then return true end
    local specs = GetItemSpecInfo(item.id)
    if type(specs) == "table" and #specs == 0 then return true end
    local sourceID = select(2, CTC.GetItemInfo(item.id))
    if sourceID and not select(2, CTC.PlayerCanCollectSource(sourceID)) then return true end
    return false
end

local function PlayerHasHeirloom(item)
    return C_Heirloom.PlayerHasHeirloom(item)
end

local function CheckMissingItem(obj)
    if not obj.name or obj.name == "Unknown" then
        obj.name = GetItemInfo(obj.id) or "Unknown"
    end
    if not obj.quality then
        obj.quality = select(3, GetItemInfo(obj.id))
    end
    if (faction == "Alliance" and obj.alliance) or (faction == "Horde" and obj.horde) then
        if (obj.reward.type == "pet") then
            if (not PlayerHasPet(obj)) then
                return true
            end
        elseif (obj.reward.type == "toy") then
            if (not PlayerHasToy(obj.id)) then
                return true
            end
        elseif (obj.reward.type == "mount") then
            if (not PlayerHasMount(obj)) then
                return true
            end
        elseif (obj.reward.type == "transmog") then
            if (not PlayerHasTransmog(obj)) then
                return true
            end
        elseif (obj.reward.type == "quest") then
            if (not C_QuestLog.IsQuestFlaggedCompleted(obj.reward.questid)) then
                return true
            end
        elseif (obj.reward.type == "heirloom") then
            if (not PlayerHasHeirloom(obj.id)) then
                return true
            end
        end
    end
end

local function Honorbound(obj)
    if faction == "Alliance" then
        obj.id = 1717
    end
    return obj
end

local function Honeyback(obj)
    local id, cur, _, name, _, _, _, _, max = GetFriendshipReputation(obj.id)
    if (id == nil) then return end
    if not max then 
        obj.farmAmount = 0
        return obj
    end
    obj.quality = 1
    local r,g,b,hex = GetItemQualityColor(obj.quality)
    local a = GetItemCount(168822,true,true) or 0
    local b = GetItemCount(168825,true,true) or 0
    local c = GetItemCount(168828,true,true) or 0
    obj.name = name or "Unknown"
    obj.icon = 3066348 --fallback iconID (questionmark)
    obj.qualityColor = {r=r,g=g,b=b,hex=hex}
    obj.farmAmount = max - cur
    local mod = race == "Human" and 1.1 or 1
    obj.currentAmount = (a*5 + b*20 + c*40) * mod
    if faction ~= "Alliance" then
        obj.farmAmount = 0
    end
    return obj
end

local specialCurrencies = {
    [1716] = Honorbound,
    [2398] = Honeyback,
}

--Check for all conditions to show or hide the object.
local function ShowOrHideCurrency(obj)
    if obj.farmAmount == 0 then
        return false
    else
        return true
    end
end

local function GetObjectFarmAmount(obj)
    local remaining = 0
    for i = 1, #obj.items do
        if CheckMissingItem(obj.items[i]) then
            remaining = remaining + obj.items[i].cost
        end
    end
    return remaining
end

local function GetDynamicObjectInfo(obj)
    if obj.type == "currency" then
        local info = C_CurrencyInfo.GetCurrencyInfo(obj.id)
        obj.currentAmount = info.quantity
        obj.farmAmount = GetObjectFarmAmount(obj)
    elseif obj.type == "item" then
        obj.currentAmount = GetItemCount(obj.id,true,true) or 0
        obj.farmAmount = GetObjectFarmAmount(obj)
    end
    return obj
end

local function GetStaticObjectInfo(obj)
    if obj.type == "currency" then
        local info = C_CurrencyInfo.GetCurrencyInfo(obj.id)
        obj.name = info.name
        obj.icon = info.iconFileID
        obj.quality = info.quality
        local r,g,b,hex = GetItemQualityColor(obj.quality)
        obj.qualityColor = {r=r,g=g,b=b,hex=hex}
    elseif obj.type == "item" then
        obj.quality = select(3, GetItemInfo(obj.id)) or 1
        local r,g,b,hex = GetItemQualityColor(obj.quality)
        obj.name = GetItemInfo(obj.id) or "unknown"
        obj.icon = select(10,GetItemInfo(obj.id)) or 13440 --fallback iconID (questionmark)
        obj.qualityColor = {r=r,g=g,b=b,hex=hex}
    end
    return obj
end

local function CurrencyTriggerHandler(obj)
    obj = GetStaticObjectInfo(obj)
    obj = GetDynamicObjectInfo(obj)
    if specialCurrencies[obj.id] then
        obj = specialCurrencies[obj.id](obj)
    end
    obj.show = ShowOrHideCurrency(obj)
    return obj
end

local function HandleTooltip(obj, region)
    if not obj or not region then return end
    region.tip = region.tip or CreateFrame("Frame", nil, region)
    region.tip:SetAllPoints(region)
    local GameTooltip = GameTooltip
    local color = {1, 1, 1}
    
    local function updateTooltipText()
        for i = 1, #obj.items do
            color = ITEM_QUALITY_COLORS[obj.items[i].quality]
            if CheckMissingItem(obj.items[i]) then
                GameTooltip:AddDoubleLine(obj.items[i].name, obj.items[i].cost, color.r, color.g, color.b)
            end
        end 
    end
    
    local function mouseoverTooltip()
        color = ITEM_QUALITY_COLORS[obj.quality]
        GameTooltip:SetOwner(region, "ANCHOR_NONE")
        GameTooltip:SetPoint("TOPRIGHT", region, "TOPLEFT", -2, 0)
        GameTooltip:ClearLines()
        GameTooltip:SetText(obj.name, color.r, color.g, color.b)
        GameTooltip:AddLine(" ")
        updateTooltipText()
        GameTooltip:Show()
    end
    
    region.tip:EnableMouse(true)
    region.tip:SetScript("OnEnter", function() mouseoverTooltip() end)
    region.tip:SetScript("OnLeave", function() GameTooltip:Hide() end)
end

local function UpdateTrackingText(obj)
    obj.fs:SetText(obj.currentAmount.."/"..obj.farmAmount)
end

local function CreateTrackingIcon(obj, offset)
    local f = CreateFrame("Frame")
    f:SetSize(20, 20)

    local icon = f:CreateTexture()
    icon:SetTexture(obj.icon)
    icon:SetAllPoints(f)
    f.icon = icon

    f:SetPoint("LEFT", UIParent, "LEFT", 3, offset * -22)
    f:Show()

    obj.f = f
end

local function CreateTrackingText(obj)
    local fs = obj.f:CreateFontString()
    fs:SetFont("Fonts\\FRIZQT__.TTF", 11, "OUTLINE")
    fs:SetPoint("LEFT", obj.f, "RIGHT", 3, 0)
    obj.fs = fs
end

local function ReorderIcons()

end

local function Update()
    for i, obj in pairs(ns.D) do
        obj = CurrencyTriggerHandler(obj)
        UpdateTrackingText(obj)
        if obj.show == false then
            obj.f:Hide()
            -- ReorderIcons()
        end
    end
end

local function Create()
    local offset = 0
    for i, obj in pairs(ns.D) do
        obj = CurrencyTriggerHandler(obj)
        if obj.show == true then
            CreateTrackingIcon(obj, offset)
            CreateTrackingText(obj)
            UpdateTrackingText(obj)
            offset = offset + 1
        end
    end
end

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:RegisterEvent("UPDATE_FACTION")
f:RegisterEvent("UNIT_INVENTORY_CHANGED")
f:RegisterEvent("CHAT_MSG_CURRENCY")
f:RegisterEvent("CURRENCY_DISPLAY_UPDATE")
f:RegisterEvent("NEW_MOUNT_ADDED")
f:RegisterEvent("COMPANION_LEARNED")
f:RegisterEvent("NEW_TOY_ADDED")
f:SetScript("OnEvent", function(self, event, ...)
    if event == "ADDON_LOADED" and ... == "ManiaFarmableCurrencies" then
        f:UnregisterEvent("ADDON_LOADED")
    elseif event == "PLAYER_ENTERING_WORLD" then
        C_Timer.After(0, Create)
    else
        Update()
    end
end)