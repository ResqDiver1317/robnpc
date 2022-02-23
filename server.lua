-- Get player identifier function (This will not change the identifier all the time)
function GetPlayerIdentifierFromType(type, source) -- Credits: xander1998, Post: https://forum.cfx.re/t/solved-is-there-a-better-way-to-get-lic-steam-and-ip-than-getplayeridentifiers/236243/2?u=andyyy7666
	local identifiers = {}
	local identifierCount = GetNumPlayerIdentifiers(source)

	for a = 0, identifierCount do
		table.insert(identifiers, GetPlayerIdentifier(source, a))
	end

	for b = 1, #identifiers do
		if string.find(identifiers[b], type, 1) then
			return identifiers[b]
		end
	end
	return nil
end

AddEventHandler("robnpc:getcash")
RegisterServerEvent('robnpc:getcash', function()
    local player = source
    local amount = (math.random(Config.MinMoney,Config.MaxMoney))
        if Config.Framework then
            exports.oxmysql:query("UPDATE characters SET cash = cash + ? WHERE license = ?", {amount, GetPlayerIdentifierFromType("license", player)})
            TriggerClientEvent("updateAddMoney", player, amount, "cash")
        else
            exports.oxmysql:query("UPDATE money SET cash = cash + ? WHERE license = ?", {amount, GetPlayerIdentifierFromType("license", player)})
            TriggerClientEvent("updateAddMoney", player, amount, "cash")
        end
        TriggerClientEvent("chat:addMessage", player, {
        color = {0, 255, 100},
        args = {"RobNPC:", " You stole $" ..amount.. " from the NPC."}
        })
end)

RegisterServerEvent('robnpc:muggingAlert')
AddEventHandler('robnpc:muggingAlert', function(street1, street2, reportcoords)
    TriggerClientEvent("chat:addMessage", -1, {
        color = {255, 100, 100},
        args = {"POLICE ALERT:", " Reported Mugging near ~w~ "..street1.." and "..street2, reportcoords}
        })
    --TriggerClientEvent("muggingNotify", -1, "~r~Reported Mugging by ~r~near~w~ "..street1.." and "..street2, coords)
end)


RegisterServerEvent('robnpc:muggingAlertS1')
AddEventHandler('robnpc:muggingAlertS1', function(street1, reportcoords)
    TriggerClientEvent("chat:addMessage", -1, {
        color = {255, 100, 100},
        args = {"POLICE ALERT:", " Reported Mugging near ~w~ "..street1, reportcoords}
        })
    --TriggerClientEvent("muggingNotify", -1, "~r~Reported Mugging by ~r~near~w~ "..street1, coords)
end)


RegisterServerEvent('robnpc:muggingPos')
AddEventHandler('robnpc:muggingPos', function(gx, gy, gz)
	TriggerClientEvent('robnpc:muggingPos', -1, gx, gy, gz)
end)