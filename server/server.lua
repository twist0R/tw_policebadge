ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand("badgepolice", function(source, args, rawCommand)
	local _source = source
	TriggerEvent('kurat420_policebadge:server:useitem', _source)
end)

ESX.RegisterUsableItem("badgepolice", function(source)
	local _source = source
	TriggerEvent('kurat420_policebadge:server:useitem', _source)
end)

RegisterServerEvent('kurat420_policebadge:server:useitem')
AddEventHandler('kurat420_policebadge:server:useitem', function(src)
	local xPlayer = ESX.GetPlayerFromId(src)
	local badgepolice = xPlayer.getInventoryItem('badgepolice')
	if xPlayer.job.name == 'police' and badgepolice.count >= 1  then
		MySQL.Async.fetchAll('SELECT * FROM user_mdt INNER JOIN characters ON user_mdt.char_id=characters.id where characters.identifier = @identifier', {['@identifier'] = xPlayer.identifier}, function(result)
			local img = '0'
			local name = 'U NEED TO PUT A PHOTO ON MDT'
			if result[1] ~= nil then
				img = result[1].mugshot_url
				name =  result[1].firstname ..' '..result[1].lastname
			end
			print(img)
			local grade = xPlayer.job.grade_label

			TriggerClientEvent('kurat420_policebadge:client:showbadgepolice', -1, src, img, grade, name)
		end)
	end
end)
