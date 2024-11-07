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
            QBCore.Functions.CreateUseableItem(Config.Items["GasMask"], function(source, Item)
                if QBCore.Functions.GetPlayer(source).Functions.GetItemBySlot(Item.slot) == nil then return end
                TriggerClientEvent("projectx-atmrobbery:client:USeGasMask", source)
            end)
        end
    end
    if Config.Framework == "esx" then
        if Config.Inventory == "esx" then
            ESX.RegisterUsableItem(Config.Items["GasMask"], function(source)
                TriggerClientEvent("projectx-gasmask:client:UseGasMask", source, Config.Items["GasMask"])
            end)
        end
    end
end)

RegisterNetEvent('projectx-masks:server:AddItem', function(bool, Item)
    local src = source
    if bool then
        if Config.Framework == "qb-core" or Config.Framework == "qbox" then
            if Config.Inventory == "ox" then
                exports.ox_inventory:AddItem(src, Item, 1)
            else
                QBCore.Functions.GetPlayer(src).Functions.AddItem(Item, 1)
            end
            if Config.Inventory ~= "ox" then
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add', 1)
            end
        end
        if Config.Framework == "esx" then
            if Config.Inventory == "ox" then
                exports.ox_inventory:AddItem(src, Item, 1)
            else
                ESX.GetPlayerFromId(src).addInventoryItem(Item, 1)
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
    TriggerClientEvent('projectx-masks:client:Sync', src, Item)
end)

RegisterNetEvent('projectx-masks:server:RemoveItem', function(Item)
    local src = source
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