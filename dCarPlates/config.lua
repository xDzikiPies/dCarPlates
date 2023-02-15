Config = {}

Config.Length = 6 -- Exact number of chars in ur car plate

Config.PlateRemovingTime = 15000 

Config.UpdateOwnedVehicles = false -- true/false if you want to update the car in ur owned_vehicles table

Config.forbiddenWords = {'BAD', 'WORDS', 'YOU', 'DONT', 'WANT', 'TO BE PUT'}

Config.NoSpecials = true -- boolean (true/false) Set to true if you dont want any special characters in ur plate

Config.NoOnlyNumbers = true -- boolean (true/false) Set to true if you dont want only numbers in ur plate

Config.ForbiddenWords = true -- boolean (true/false) Set to true if you dont want any bad words in ur plate text

Config.CarPlateItem = 'carplate' -- name of ur item



Lang = {}

Lang.Length = "Your plate needs to be "..Config.Length.." characters long"

Lang.ToUpper = "Your plate texts needs to be wrote in CAPITAL LETTERS"

Lang.NoSpecials = "Your plate cannot have any special characters"

Lang.NoItem = "You dont have carplate item"

Lang.Cancelled = "You have cancelled your plate swapping"

Lang.NoNumbers = "Your plate cannot have only numbers in it!"

Lang.NoCar = 'There is no car nearby you'

Lang.SlowDown = 'Slow down'

Lang.ChangingPlates = 'Changing plate'

Lang.ChangedPlates = "You have changed ur plates"

Lang.NoForbidden = "You are not allowed to put forbidden words in ur plate text"
