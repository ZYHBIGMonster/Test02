---@class Ball_C:UniversalProjectileBase
---@field ParticleSystem UParticleSystemComponent
---@field Sphere USphereComponent
---@field StaticMesh UStaticMeshComponent
--Edit Below--
local ShootSkill = {}

--[[
function ShootSkill:ReceiveLaunchBullet()
    ShootSkill.SuperClass.ReceiveLaunchBullet(self)
end
--]]

--[[
function ShootSkill:ReceiveOnImpact(HitResult)
    ShootSkill.SuperClass.ReceiveOnImpact(self,HitResult)
end
--]]

--[[
function ShootSkill:ReceiveOnBounce(HitResult, ImpactVelocity)
    ShootSkill.SuperClass.ReceiveOnBounce(self,HitResult, ImpactVelocity)
end
--]]

--[[
function ShootSkill:ReceivePlayExplosionEffect(ExplosionTarget)
    ShootSkill.SuperClass.ReceivePlayExplosionEffect(self,ExplosionTarget)
end
--]]

--[[
function ShootSkill:TickMovementPath(DeltaTime)
    ShootSkill.SuperClass.TickMovementPath(self,DeltaTime)
end
--]]

return ShootSkill