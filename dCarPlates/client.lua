


RegisterNetEvent("dCarPlates:ChangePlate", function()
    local ped = PlayerPedId()
    local pCoords = GetEntityCoords(ped)
    local isChanging = false
    local vehicle = ESX.Game.GetClosestVehicle(pCoords)
    local vehCoords = GetEntityCoords(vehicle)
    local vehmodel = GetEntityModel(vehicle)
    local vehname = GetLabelText(GetDisplayNameFromVehicleModel(vehmodel))
    local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
    local count = exports.ox_inventory:Search('count', Config.CarPlateItem)
    if count > 0 then 
        if #(pCoords - vehCoords) <= 3.5 then 
            local oldplate = GetVehicleNumberPlateText(vehicle)
            local input = lib.inputDialog('Car plate', {
                { type = "input", label = "Your new plate (XYZ 123)", placeholder = "Max "..Config.Length.." chars" },
            })
            if not input then return ESX.ShowNotification(Lang.Cancelled) end
            if #input[1] ~= Config.Length then return ESX.ShowNotification(Lang.Length) end 
            if input[1] ~= string.upper(input[1]) then return ESX.ShowNotification(Lang.ToUpper) end
            if Config.NoSpecials then 
                if string.match(input[1], '[^%a%d]+') then
                    return ESX.ShowNotification(Lang.NoSpecials)
                end
            end
            if Config.NoOnlyNumbers then 
                if string.match(input[1], '^%d+$') then
                    return ESX.ShowNotification(Lang.NoNumbers)
                end
            end
            if Config.ForbiddenWords then 
                for _, word in ipairs(Config.forbiddenWords) do
                    local startIndex, endIndex = string.find(input[1], word)
                    if startIndex ~= nil then
                        return ESX.ShowNotification(Lang.NoForbidden)
                    end
                end
            end

            if isChanging then return ESX.ShowNotification(Lang.SlowDown) end 
            isChanging = true 
            -- TaskStartScenarioInPlace(ped, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
            if lib.progressBar({
                duration = Config.PlateRemovingTime,
                label = Lang.ChangingPlates,
                useWhileDead = false,
                canCancel = false,
                disable = {
                    car = true,
                    move = true,
                },
                anim = {
                    dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
                    clip = 'machinic_loop_mechandplayer',
                    flag = 1,
                },
            }) then
                -- ClearPedTasks(ped)
                local spacedPlate = string.sub(input[1], 1, 3) .. " " .. string.sub(input[1], 4)
                ESX.ShowNotification(Lang.ChangedPlates.." "..spacedPlate)
                isChanging = false 
                SetVehicleNumberPlateText(vehicle, spacedPlate)
                TriggerServerEvent('dCarPlate:RemovePlate', oldplate, spacedPlate, vehicleProps)
            end
        else 
            ESX.ShowNotification(Lang.NoCar)
        end
    else
        ESX.ShowNotification(Lang.NoItem)
    end
end)

print(Lang.Length)