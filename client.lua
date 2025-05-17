local Mask = {["gasmask"] = false, ["nightvision"] = false}
local NightVision = false

local function loadAnimDict(dict) while not HasAnimDictLoaded(dict) do RequestAnimDict(dict) Wait(5) end end
local function unloadAnimDict(dict) RemoveAnimDict(dict) end

local function Notification(NotificationType, Message)
    if NotificationType == "ox" then
        lib.notify({description = Message, type = 'error', position = 'center-right'})
    elseif NotificationType == "qb" then
        TriggerEvent('QBCore:Notify', Message, 'error', Config.NotificationDuration)
    else
        TriggerEvent('esx:showNotification', Message, 'error', Config.NotificationDuration)
    end
end

RegisterNetEvent('projectx-masks:client:UseGasMask', function()
    if Mask["gasmask"] then return Notification(Config.Notification, Config.WearingMaskMessage) end
    TriggerServerEvent('projectx-masks:server:RemoveItem', Config.GasMask["Item"])
    loadAnimDict('mp_masks@on_foot')
    TaskPlayAnim(PlayerPedId(), "mp_masks@on_foot", "put_on_mask", 8.0, -8.0, -1, 9, 1, false, false, false)
    Wait(600)
    ClearPedTasks(PlayerPedId())
    SetEntityProofs(PlayerPedId(), false, false, false, false, false, false, true, true, false)
    SetPedComponentVariation(PlayerPedId(), 1, Config["GasMask"]["Clothing"], Config["GasMask"]["Variation"], 0)
    Mask["gasmask"] = true
    Wait(100)
    unloadAnimDict('mp_masks@on_foot')
end)

RegisterNetEvent('projectx-masks:client:UseNightVision', function()
    if Mask["nightvision"] then return Notification(Config.Notification, Config.WearingMaskMessage) end
    TriggerServerEvent('projectx-masks:server:RemoveItem', Config.NightVisionGoggles["Item"])
    loadAnimDict('mp_masks@on_foot')
    TaskPlayAnim(PlayerPedId(), "mp_masks@on_foot", "put_on_mask", 8.0, -8.0, -1, 9, 1, false, false, false)
    Wait(600)
    ClearPedTasks(PlayerPedId())
    SetEntityProofs(PlayerPedId(), false, false, false, false, false, false, true, true, false)
    SetPedPropIndex(PlayerPedId(), 0, Config["NightVisionGoggles"]["Clothing"], 0, 0)
    Mask["nightvision"] = true
    unloadAnimDict('mp_masks@on_foot')
end)

RegisterNetEvent('projectx-masks:client:RemoveMask', function(Item)
    if not Mask[Item] then return Notification(Config.Notification, Config.ErrorMessage) end
    if Item == Config["NightVisionGoggles"]["Item"] then if NightVision then return Notification(Config.Notification, Config.TurnOffNightVisionMessage) end end
    loadAnimDict('missheist_agency2ahelmet')
    TaskPlayAnim(PlayerPedId(), "missheist_agency2ahelmet", "take_off_helmet_stand", 8.0, -8.0, -1, 9, 1, false, false, false)
    Wait(600)
    ClearPedTasks(PlayerPedId())
    SetEntityProofs(PlayerPedId(), false, false, false, false, false, false, false, false, false)
    if Item == Config["GasMask"]["Item"] then SetPedComponentVariation(PlayerPedId(), 1, 0, 0, 0) else ClearPedProp(PlayerPedId(), 0) end
    local GasMask
    if Item == Config["GasMask"]["Item"] then GasMask = true else GasMask = false end
    TriggerServerEvent('projectx-masks:server:AddItem', GasMask)
end)

RegisterNetEvent('projectx-masks:client:Sync', function(Item)
    unloadAnimDict('missheist_agency2ahelmet')
    ClearPedTasks(PlayerPedId())
    Mask[Item] = false
end)

RegisterNetEvent('projectx-masks:client:ToggleNightVision', function()
    if not Mask["nightvision"] then return end
    local anim
    local clothing
    local coords = GetEntityCoords(PlayerPedId())
    if NightVision then
        anim = 'goggles_up'
        clothing = Config["NightVisionGoggles"]["Clothing"]
    else
        anim = 'goggles_down'
        clothing = (Config["NightVisionGoggles"]["Clothing"] - 1)
    end
    loadAnimDict('anim@mp_helmets@on_foot')
    TaskPlayAnim(PlayerPedId(), 'anim@mp_helmets@on_foot', anim, 8.0, -8.0, -1, 9, 1, false, false, false)
    Wait(550)
    TriggerEvent('InteractSound_CL:PlayWithinDistance', coords, 1.0, "nv", 0.25)
    ClearPedTasks(PlayerPedId())
    SetNightvision(not NightVision)
    SetPedPropIndex(PlayerPedId(), 0, clothing, 0, 0)
    NightVision = not NightVision
    unloadAnimDict('anim@mp_helmets@on_foot')
end)

RegisterCommand('removegasmask', function()
    TriggerEvent('projectx-masks:client:RemoveMask', Config.GasMask["Item"])
end, false)

RegisterCommand('removenightvision', function()
    TriggerEvent('projectx-masks:client:RemoveMask', Config.NightVisionGoggles["Item"])
end, false)

RegisterCommand('togglenightvision', function()
    TriggerEvent('projectx-masks:client:ToggleNightVision')
end, false)