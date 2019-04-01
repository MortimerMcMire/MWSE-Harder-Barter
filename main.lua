--[[
	Mod Initialization: Harder Barter
	Author: mort

]]--

local function mort_barterAdjust(e)
	if e.buying == false then
		if e.basePrice > 10 then
			e.price = e.price / math.log(e.basePrice)
		end
	end
end

local function initialize()
	if (mwse.buildDate == nil or mwse.buildDate < 20180715) then
		modConfig.hidden = true
		tes3.messageBox("Harder Barter requires a newer version of MWSE. Please run MWSE-Update.exe.", mwse.buildDate)
		return
	end
	event.register("calcBarterPrice", mort_barterAdjust)
	print("[Harder Barter Initialized]")
end

event.register("initialized", initialize)
