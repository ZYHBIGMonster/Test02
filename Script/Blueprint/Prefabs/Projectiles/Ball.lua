---@class Ball_C:UniversalProjectileBase
---@field ParticleSystem UParticleSystemComponent
---@field Sphere USphereComponent
---@field StaticMesh UStaticMeshComponent
--Edit Below--
local Ball = {}

--[[
function Ball:ReceiveLaunchBullet()
    Ball.SuperClass.ReceiveLaunchBullet(self)
end
--]]

--[[
function Ball:ReceiveOnImpact(HitResult)
    Ball.SuperClass.ReceiveOnImpact(self,HitResult)
end
--]]

--[[
function Ball:ReceiveOnBounce(HitResult, ImpactVelocity)
    Ball.SuperClass.ReceiveOnBounce(self,HitResult, ImpactVelocity)
end
--]]

--[[
function Ball:ReceivePlayExplosionEffect(ExplosionTarget)
    Ball.SuperClass.ReceivePlayExplosionEffect(self,ExplosionTarget)
end
--]]

--[[
function Ball:TickMovementPath(DeltaTime)
    Ball.SuperClass.TickMovementPath(self,DeltaTime)
end
--]]

return Ball