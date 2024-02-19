function msg(string)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(string)
    DrawNotification(false, true)
end

function ShowInfo(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end

local robbedRecently = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if not IsPedInAnyVehicle(GetPlayerPed(-1),true) then
        if IsControlJustPressed(0, 38) then
            local aiming, targetPed = GetEntityPlayerIsFreeAimingAt(PlayerId(-1))
            local tPedId = IsPedAPlayer(targetPed)
            
            if aiming then
                local playerPed = GetPlayerPed(-1)
                local pCoords = GetEntityCoords(playerPed, true)
                local tCoords = GetEntityCoords(targetPed, true)

                if DoesEntityExist(targetPed) and IsEntityAPed(targetPed) then
                    if robbedRecently then
                        ShowInfo(Config.TooSoon)
                    elseif IsPedDeadOrDying(targetPed, true) then
                        ShowInfo(Config.VictimDead)
                    elseif tPedId == 1 then
                        ShowInfo(Config.ActualPlayer)
                    elseif GetDistanceBetweenCoords(pCoords.x, pCoords.y, pCoords.z, tCoords.x, tCoords.y, tCoords.z, true) >= Config.RobDistance then
                        ShowInfo(Config.TooFar)
                    else
                        robNpc(targetPed)
                    end
                end
            end
        end
    end
    end 
end)

function robNpc(targetPed)
    robbedRecently = true

    Citizen.CreateThread(function()
        local dict = 'mp_am_hold_up'
        RequestAnimDict(dict)
        while not HasAnimDictLoaded(dict) do
            Citizen.Wait(10)
        end
        --start report chat message data
        if Config.Notify then
            local alertmath = (math.random(1,100))
            if alertmath <= Config.AlertChance then
                TriggerServerEvent("robnpc:911")
            end
        end
        --end report chat message data
        SetEveryoneIgnorePlayer(PlayerId(), true)
        TaskStandStill(targetPed, Config.RobAnimationSeconds * 1000)
        --FreezeEntityPosition(targetPed, true)
        SetBlockingOfNonTemporaryEvents(targetPed, true)
        TaskPlayAnim(targetPed, dict, 'cower_loop', 8.0, -8, 15000.0, 49, 0, 0, 0, 0)
        --TaskPlayAnim(targetPed, dict, 'handsup_standing_base', 8.0, -8, .01, 49, 0, 0, 0, 0)
        ShowInfo(Config.Started)
        
        local robtime = math.random(Config.RobTimeMinSeconds,Config.RobTimeMaxSeconds)
        Citizen.Wait(robtime * 1000)
        randomact = math.random(1,10)
            if randomact > 6 then
                PlayAmbientSpeech1(targetPed, "GENERIC_INSULT_HIGH", "SPEECH_PARAMS_FORCE_NORMAL_CLEAR")
            elseif randomact > 3 then
                PlayAmbientSpeech1(targetPed, "GENERIC_FRIGHTENED_HIGH", "SPEECH_PARAMS_FORCE_NORMAL_CLEAR")
            end
        TriggerServerEvent('robnpc:getcash')
            FreezeEntityPosition(targetPed, false)
            ClearPedTasks(targetPed)
            SetEveryoneIgnorePlayer(PlayerId(), false)
            ShowInfo(Config.Completed)
        if Config.ShouldWaitBetweenRobbing then
            local cooldowntime = (math.random(Config.MinWaitSeconds, Config.MaxWaitSeconds) * 1000)
            local cooldowntimer = (cooldowntime / 1000)
            Citizen.Wait(1000)
            ShowInfo(" ".. cooldowntimer .. Config.Cooldown)
            Citizen.Wait(cooldowntime)
            ShowInfo(Config.Reset)
            robbedRecently = false
        else
        robbedRecently = false
        end
        end)
end

--If your 911 system uses client side exports or events to trigger, edit the section below to suit your system's needs. 
--By default, this script is configured to function with Night's MDT system. 
--Support is not provided related to configuration of other MDT/CAD/911 scripts.
RegisterNetEvent('robnpc:911Client')
AddEventHandler('robnpc:911Client', function(ped)
    local ped2 = ped
    local coords = GetEntityCoords(ped2)
    local alarmmsg = "ANON REPORT: Armed robbery of local citizen!"
    exports.night_shifts:TriggerAlarm(true --[[ bool ]], true --[[ bool ]], false --[[ bool ]], false --[[ bool ]], false --[[ bool ]], alarmmsg --[[ string ]], coords --[[ Vector3 ]])
end)
