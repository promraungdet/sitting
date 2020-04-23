RegisterCommand("sitting", function()
	SITTING()
end)

function SITTING()
	local ped = GetPlayerPed(-1)
	local coords = GetEntityCoords(ped)
	local found = false

	for k,v in pairs(Config.SittingLocation) do
		local size = v.distance or 1.0
		if GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < size then
			TaskStartScenarioAtPosition(ped, v.scenario, v.x, v.y, v.z-v.offset , v.heading, 0, true, v.teleport)
			found = true
			break
		end
	end

	if not found then
		-- notify
	end
end