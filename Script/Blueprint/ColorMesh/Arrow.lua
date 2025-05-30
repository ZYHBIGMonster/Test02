---@class Arrow_C:AActor
---@field Widget1 UWidgetComponent
---@field Widget UWidgetComponent
---@field DefaultSceneRoot USceneComponent
--Edit Below--
local Arrow = {}
 
--[[
function Arrow:ReceiveBeginPlay()
    Arrow.SuperClass.ReceiveBeginPlay(self)
end
--]]

--[[
function Arrow:ReceiveTick(DeltaTime)
    Arrow.SuperClass.ReceiveTick(self, DeltaTime)
end
--]]

--[[
function Arrow:ReceiveEndPlay()
    Arrow.SuperClass.ReceiveEndPlay(self) 
end
--]]

--[[
function Arrow:GetReplicatedProperties()
    return
end
--]]

--[[
function Arrow:GetAvailableServerRPCs()
    return
end
--]]

return Arrow