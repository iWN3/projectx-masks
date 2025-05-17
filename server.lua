local Sources = {}
if Config.Framework == "qb-core" or Config.Framework == "qbox" then
    QBCore = exports["qb-core"]:GetCoreObject()
else
    CreateThread(function()
        while ESX == nil do Wait(1000) end
    end)
end

CreateThread(function()
    if Config.Framework == "qb-core" or Config.Framework == "qbox" then
        if Config.Inventory ~= "ox" then
            QBCore.Functions.CreateUseableItem(Config.GasMask["Item"], function(source, Item)
                if QBCore.Functions.GetPlayer(source).Functions.GetItemBySlot(Item.slot) == nil then return end
                TriggerClientEvent("projectx-masks:client:UseGasMask", source)
            end)
            QBCore.Functions.CreateUseableItem(Config.NightVisionGoggles["Item"], function(source, Item)
                if QBCore.Functions.GetPlayer(source).Functions.GetItemBySlot(Item.slot) == nil then return end
                TriggerClientEvent("projectx-masks:client:UseNightVision", source)
            end)
        end
    end
    if Config.Framework == "esx" then
        if Config.Inventory == "esx" then
            ESX.RegisterUsableItem(Config.GasMask["Item"], function(source)
                TriggerClientEvent("projectx-masks:client:UseGasMask", source, Config.GasMask["Item"])
            end)
            ESX.RegisterUsableItem(Config.NightVisionGoggles["Item"], function(source)
                TriggerClientEvent("projectx-masks:client:UseNightVision", source, Config.NightVisionGoggles["Item"])
            end)
        end
    end
end)

RegisterNetEvent('projectx-masks:server:AddItem', function(Item)
    local src = source
    local bool
    local Mask
    for i = 1, #Sources do if Sources[i] == src then table.remove(Sources, i) bool = true end end
    if Item then Mask = Config["GasMask"]["Item"] else Mask = Config["NightVisionGoggles"]["Item"] end
    Wait(100)
    if bool then
        if Config.Framework == "qb-core" or Config.Framework == "qbox" then
            if Config.Inventory == "ox" then
                exports.ox_inventory:AddItem(src, Mask, 1)
            else
                QBCore.Functions.GetPlayer(src).Functions.AddItem(Mask, 1)
            end
            if Config.Inventory ~= "ox" then
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Mask], 'add', 1)
            end
        end
        if Config.Framework == "esx" then
            if Config.Inventory == "ox" then
                exports.ox_inventory:AddItem(src, Mask, 1)
            else
                ESX.GetPlayerFromId(src).addInventoryItem(Mask, 1)
            end
        end
    else
        if Config.Notification == "ox" then
            TriggerClientEvent('ox_lib:notify', src, {description = Config.GlitchMessage, type = 'error', duration = Config.NotificationDuration, position = 'center-right'})
        elseif Config.Notification == "qb" then
            TriggerClientEvent('QBCore:Notify', src, Config.GlitchMessage, 'error', Config.NotificationDuration)
        else
            TriggerClientEvent('esx:showNotification', src, Config.GlitchMessage, 'error', Config.NotificationDuration)
        end
    end
    TriggerClientEvent('projectx-masks:client:Sync', src, Mask)
end)

RegisterNetEvent('projectx-masks:server:RemoveItem', function(Item)
    local src = source
    Sources[#Sources + 1] = src
    if Config.Framework == "qb-core" or Config.Framework == "qbox" then
        if Config.Inventory == "ox" then
            exports.ox_inventory:RemoveItem(src, Item, 1)
        else
            QBCore.Functions.GetPlayer(src).Functions.RemoveItem(Item, 1)
        end
        if Config.Inventory ~= "ox" then
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Item], 'remove', 1)
        end
    end
    if Config.Framework == "esx" then
        if Config.Inventory == "ox" then
            exports.ox_inventory:RemoveItem(src, Item, 1)
        else
            ESX.GetPlayerFromId(src).removeInventoryItem(Item, 1)
        end
    end
end)