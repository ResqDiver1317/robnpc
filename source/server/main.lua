NDCore = exports["ND_Core"]:GetCoreObject()

AddEventHandler("robnpc:getcash")
RegisterServerEvent('robnpc:getcash', function()
    local player = source
    local amount = (math.random(config.minMoney,config.maxMoney))
	NDCore.Functions.AddMoney(amount, player, config.paymentType)
    -- TriggerClientEvent("chat:addMessage", player, {
    --     color = {0, 255, 100},
    --     args = {config.stealAmountTitle, config.stealAmountMessage ..amount.. " "}
    -- })
end)

RegisterServerEvent('robnpc:muggingAlert')
AddEventHandler('robnpc:muggingAlert', function(street1, street2, reportcoords)
    -- TriggerClientEvent("chat:addMessage", -1, {
    --     color = {255, 100, 100},
    --     args = {config.alertTitle, config.alertMessage..street1.." & "..street2, reportcoords}
    -- })
end)


RegisterServerEvent('robnpc:muggingAlertS1')
AddEventHandler('robnpc:muggingAlertS1', function(street1, reportcoords)
    -- TriggerClientEvent("chat:addMessage", -1, {
    --     color = {255, 100, 100},
    --     args = {config.alertTitle, config.alertMessage ..street1, reportcoords}
    -- })
end)

RegisterServerEvent('robnpc:muggingPos')
AddEventHandler('robnpc:muggingPos', function(gx, gy, gz)
	TriggerClientEvent('robnpc:muggingPos', -1, gx, gy, gz)
end)
