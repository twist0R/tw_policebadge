ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('kurat420_policebadge:client:showbadgepolice')
AddEventHandler('kurat420_policebadge:client:showbadgepolice', function(src, image, grade, name)
	local playerPed = GetPlayerPed(GetPlayerFromServerId(src))
	local playerPed2 = PlayerPedId()
	local playerCoords = GetEntityCoords(playerPed)
	local playerCoords2 = GetEntityCoords(playerPed2)

	if playerPed == playerPed2 then
		prop_name = prop_name or 'prop_fib_badgepolice'
		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 28422)
				
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.09, 0.018, -0.04, 100.0, -0.2, 90.0, true, true, false, true, 1, true)
			RequestAnimDict('paper_1_rcm_alt1-9')
			TaskPlayAnim(playerPed, 'paper_1_rcm_alt1-9', 'player_one_dual-9', 8.0, -8, 4.0, 49, 0, 0, 0, 0)
			Citizen.Wait(3500)
			ClearPedSecondaryTask(playerPed)
			DeleteObject(prop)
		end)
	end
	
	local distance = #(playerCoords - playerCoords2)
	if distance <= 5 then
		SendNUIMessage({ action = "open", img = image, grade = grade, name = name})
		Citizen.Wait(5600)
		SendNUIMessage({
			action = "close"
		})
	end
	
end)