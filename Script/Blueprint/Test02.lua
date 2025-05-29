---@class Test02_C:AActor
---@field StaticMesh UStaticMeshComponent
---@field DefaultSceneRoot USceneComponent
--Edit Below--
local Test02 = {}
 
--[[
function Test02:ReceiveBeginPlay()
    Test02.SuperClass.ReceiveBeginPlay(self)
end
--]]

--[[
function Test02:ReceiveTick(DeltaTime)
    Test02.SuperClass.ReceiveTick(self, DeltaTime)
end
--]]

--[[
function Test02:ReceiveEndPlay()
    Test02.SuperClass.ReceiveEndPlay(self) 
end
--]]

--[[
function Test02:GetReplicatedProperties()
    return
end
--]]

--[[
function Test02:GetAvailableServerRPCs()
    return
end
--]]

return Test02