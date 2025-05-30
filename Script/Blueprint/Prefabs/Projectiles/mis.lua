---@class mis_C:UniversalProjectileBase
---@field ParticleSystem UParticleSystemComponent
---@field Sphere USphereComponent
---@field StaticMesh UStaticMeshComponent
--Edit Below--
local mis = {}

--[[
function mis:ReceiveLaunchBullet()
    mis.SuperClass.ReceiveLaunchBullet(self)
end
--]]

--[[
function mis:ReceiveOnImpact(HitResult)
    mis.SuperClass.ReceiveOnImpact(self,HitResult)
end
--]]

--[[
function mis:ReceiveOnBounce(HitResult, ImpactVelocity)
    mis.SuperClass.ReceiveOnBounce(self,HitResult, ImpactVelocity)
end
--]]

--[[
function mis:ReceivePlayExplosionEffect(ExplosionTarget)
    mis.SuperClass.ReceivePlayExplosionEffect(self,ExplosionTarget)
end
--]]

--[[
function mis:TickMovementPath(DeltaTime)
    mis.SuperClass.TickMovementPath(self,DeltaTime)
end
--]]

return mis