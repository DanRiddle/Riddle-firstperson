local playerId           = PlayerId()
local forcingFirstPerson = false
local previousCamMode    = Config.DefaultCamMode
local hintShown          = false

local function getNotifySystem()
    if Config.Notify ~= 'auto' then return Config.Notify end
    if GetResourceState('ox_lib') == 'started' then return 'ox' end
    if GetResourceState('qbx_core') == 'started' then return 'qbx' end
    if GetResourceState('qb-core') == 'started' then return 'qb' end
    if GetResourceState('es_extended') == 'started' then return 'esx' end
    return 'native'
end

local function notify(title, text, duration)
    local system = getNotifySystem()

    if system == 'ox' then
        exports.ox_lib:notify({ title = title, description = text, type = 'inform', duration = duration })
    elseif system == 'qbx' then
        exports.qbx_core:Notify(('%s: %s'):format(title, text), 'inform', duration)
    elseif system == 'qb' then
        TriggerEvent('QBCore:Notify', ('%s: %s'):format(title, text), 'primary', duration)
    elseif system == 'esx' then
        TriggerEvent('esx:showNotification', ('%s: %s'):format(title, text), 'info', duration)
    elseif system == 'custom' then
        Config.CustomNotify(title, text, duration)
    else
        BeginTextCommandThefeedPost('STRING')
        AddTextComponentSubstringPlayerName(('~b~[%s]~s~ %s'):format(title, text))
        EndTextCommandThefeedPostTicker(false, true)
    end
end

CreateThread(function()
    while true do
        local ped = PlayerPedId()

        if IsPedInAnyVehicle(ped, false) then
            local isAiming = IsPlayerFreeAiming(playerId) or IsPedShooting(ped)

            if isAiming then
                local currentMode = GetFollowVehicleCamViewMode()

                if not forcingFirstPerson then
                    previousCamMode    = (currentMode ~= 4) and currentMode or Config.DefaultCamMode
                    forcingFirstPerson = true

                    if Config.ShowHint and not hintShown then
                        hintShown = true
                        notify(Config.HintTitle, Config.HintText, Config.HintDuration)
                    end
                end

                DisableControlAction(0, 106, true)
                SetFollowVehicleCamViewMode(4)

            elseif forcingFirstPerson then
                forcingFirstPerson = false
                SetFollowVehicleCamViewMode(previousCamMode)
            end

            Wait(0)
        else
            if forcingFirstPerson then
                forcingFirstPerson = false
            end

            Wait(Config.IdleSleep)
        end
    end
end)
