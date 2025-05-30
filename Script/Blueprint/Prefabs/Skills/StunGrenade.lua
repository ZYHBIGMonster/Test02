---@class StunGrenade_C:PESkillTemplate_Indicate_C
--Edit Below--
local StunGrenade = {}
 
function StunGrenade:OnEnableSkill_BP()
    StunGrenade.SuperClass.OnEnableSkill_BP(self)
end

function StunGrenade:OnDisableSkill_BP()
    StunGrenade.SuperClass.OnDisableSkill_BP(self)
end

function StunGrenade:OnActivateSkill_BP()
    --UGCWeaponManagerSystem.CurrentWeaponAttachToBack(self.Owner.Owner)
    StunGrenade.SuperClass.OnActivateSkill_BP(self)
end

function StunGrenade:OnDeActivateSkill_BP()
    StunGrenade.SuperClass.OnDeActivateSkill_BP(self)
end

function StunGrenade:CanActivateSkill_BP()
    return StunGrenade.SuperClass.CanActivateSkill_BP(self)
end

return StunGrenade