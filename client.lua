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
	    local tPedPlayer = NetworkIsPlayerActive(targetPed)

            if aiming then
                local playerPed = GetPlayerPed(-1)
                local pCoords = GetEntityCoords(playerPed, true)
                local tCoords = GetEntityCoords(targetPed, true)

                if DoesEntityExist(targetPed) and IsEntityAPed(targetPed) then
                    if robbedRecently then
                        ShowInfo("~r~Your last robbery was too recent. Please wait to conduct your next robbery.")
                    elseif IsPedDeadOrDying(targetPed, true) then
                        ShowInfo("~r~Your victim is dead and cannot be robbed.")
		    elseif tPedPlayer = true then
			ShowInfo("~r~You cannot use this to rob other players. You can only rob NPCs.")
                    elseif GetDistanceBetweenCoords(pCoords.x, pCoords.y, pCoords.z, tCoords.x, tCoords.y, tCoords.z, true) >= Config.RobDistance then
                        ShowInfo("~r~Your target is too far away to rob. Move closer.")
                    else
                        robNpc(targetPed)
                    end
                end
            end
        end
    end
    end --vehicle check end
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
            local plyPos = GetEntityCoords(GetPlayerPed(-1), true)
            local s1, s2 = Citizen.InvokeNative( 0x2EB41072B4C1E4C0, plyPos.x, plyPos.y, plyPos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt() )
                local street1 = GetStreetNameFromHashKey(s1)
                local street2 = GetStreetNameFromHashKey(s2)
            reportcoords = {
                x = plyPos.x,
                y = plyPos.y,
                z = plyPos.z,
            }
            local alertmath = (math.random(1,100))
            if alertmath <= Config.AlertChance then
                TriggerServerEvent('robnpc:muggingPos', plyPos.x, plyPos.y, plyPos.z)
                if s2 == 0 then
                    TriggerServerEvent('robnpc:muggingAlertS1', street1, reportcoords)
                elseif s2 ~= 0 then
                    TriggerServerEvent('robnpc:muggingAlert', street1, street2, reportcoords)
                end
            end
        end
        --end report chat message data
        SetEveryoneIgnorePlayer(PlayerId(), true)
        TaskStandStill(targetPed, Config.RobAnimationSeconds * 1000)
        --FreezeEntityPosition(targetPed, true)
        SetBlockingOfNonTemporaryEvents(targetPed, true)
        TaskPlayAnim(targetPed, dict, 'cower_loop', 8.0, -8, 15000.0, 49, 0, 0, 0, 0)
        --TaskPlayAnim(targetPed, dict, 'handsup_standing_base', 8.0, -8, .01, 49, 0, 0, 0, 0)
        ShowInfo("~y~Robbery Started")

        Citizen.Wait(Config.RobAnimationSeconds * 1000)
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
            ShowInfo("~g~Robbery Completed")
        if Config.ShouldWaitBetweenRobbing then
            local cooldowntime = (math.random(Config.MinWaitSeconds, Config.MaxWaitSeconds) * 1000)
            local cooldowntimer = (cooldowntime / 1000)
            Citizen.Wait(1000)
            ShowInfo("~y~Cooldown in effect. You can rob again in " .. cooldowntimer .. " seconds.")
            Citizen.Wait(cooldowntime)
            ShowInfo("~g~You can now rob another NPC.")
            robbedRecently = false
        else
        robbedRecently = false
        end
        end)
end

RegisterNetEvent('robnpc:muggingPos')
AddEventHandler('robnpc:muggingPos', function(tx, ty, tz)
		local transT = 1000
		local Blip = AddBlipForCoord(tx, ty, tz)
		SetBlipSprite(Blip,  10)
		SetBlipColour(Blip,  1)
		SetBlipAlpha(Blip,  transT)
		SetBlipAsShortRange(Blip,  false)
		while transT ~= 0 do
			Wait(100)
			transT = transT - 1
			SetBlipAlpha(Blip,  transT)
			if transT == 0 then
				SetBlipSprite(Blip,  2)
				return
			end
	end
end)
