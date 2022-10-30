NDCore = exports["ND_Core"]:GetCoreObject()

AddEventHandler("robnpc:getcash")
RegisterServerEvent('robnpc:getcash', function()
    local player = source
    local amount = (math.random(Config.MinMoney,Config.MaxMoney))
	NDCore.Functions.AddMoney(amount, player, "cash")
        TriggerClientEvent("chat:addMessage", player, {
        color = {0, 255, 100},
        args = {Config.StealAmountTitle, Config.StealAmountMessage ..amount.. " "}
        })
end)

RegisterServerEvent('robnpc:muggingAlert')
AddEventHandler('robnpc:muggingAlert', function(street1, street2, reportcoords)
    TriggerClientEvent("chat:addMessage", -1, {
        color = {255, 100, 100},
        args = {Config.AlertTitle, Config.AlertMessage..street1.." & "..street2, reportcoords}
        })
    --TriggerClientEvent("muggingNotify", -1, "~r~Reported Mugging by ~r~near~w~ "..street1.." and "..street2, coords)
end)


RegisterServerEvent('robnpc:muggingAlertS1')
AddEventHandler('robnpc:muggingAlertS1', function(street1, reportcoords)
    TriggerClientEvent("chat:addMessage", -1, {
        color = {255, 100, 100},
        args = {Config.AlertTitle, Config.AlertMessage ..street1, reportcoords}
        })
    --TriggerClientEvent("muggingNotify", -1, "~r~Reported Mugging by ~r~near~w~ "..street1, coords)
end)


RegisterServerEvent('robnpc:muggingPos')
AddEventHandler('robnpc:muggingPos', function(gx, gy, gz)
	TriggerClientEvent('robnpc:muggingPos', -1, gx, gy, gz)
end)
