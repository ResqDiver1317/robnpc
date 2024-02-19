
AddEventHandler('robnpc:getcash')
RegisterServerEvent('robnpc:getcash', function()
    local player = NDCore.getPlayer(source)
    local amount = stealamount
    if amount > 0 then
        local success = player.addMoney("cash", amount, "Stolen Money from Robbery")
        print(success)
    else
        TriggerClientEvent('chatMessage', player, '', {100,200,100}, 'You did not steal any money!')
    end
end)


--If your 911 system uses Server Side exports or Events to trigger, edit this section below to trigger it. 
--If your 911 system uses Client Side exports or Events to trigger, leave this alone and edit the 'robnpc:911Client' event in the client.lua file.
--By default, this script is configured to function with Night's MDT system. 
--Support is not provided related to configuration of other MDT/CAD/911 scripts.
AddEventHandler('robnpc:911')
RegisterServerEvent('robnpc:911', function(source)
    local ped = source
    TriggerClientEvent("robnpc:911Client", ped) --For Server Side 911 triggers, replace this line with your event/export. 
end)

