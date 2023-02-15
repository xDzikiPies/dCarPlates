RegisterServerEvent('dCarPlate:RemovePlate', function(oldPlate, newPlate, vehicleProps)
    local count = exports.ox_inventory:Search(source, 'count', Config.CarPlateItem)
    if count <= 0 then return end 
    local xPlayer = ESX.GetPlayerFromId(source)
        if Config.UpdateOwnedVehicles then 
            MySQL.Async.execute('UPDATE owned_vehicles SET plate = @newPlate WHERE plate = @oldPlate', {
                ['@oldPlate'] = oldPlate,
                ['@newPlate'] = newPlate,
            })
        end
    exports.ox_inventory:RemoveItem(source, Config.CarPlateItem, 1)
-- add here your carkeys event/export 
    sendToDiscord(9196287, 'dCarPlate', xPlayer.getName().." Has changed vehicle plate, old plate:  **"..oldPlate.."** \n\n New plate **"..newPlate.."**\n\nModel "..vehicleProps.name , 'dCarPlate')

end)



ESX.RegisterUsableItem(Config.CarPlateItem, function(source)
    TriggerClientEvent('dCarPlates:ChangePlate', source)
end)


local webhook = '' -- your logs webhook

function sendToDiscord(color, name, message, footer)
	local embed = {
		  {
			  ["color"] = color,
			  ["title"] = "**".. name .."**",
			  ["description"] = message,
			  ["footer"] = {
				  ["text"] = footer,
			  },
		  }
	  }
	PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
end