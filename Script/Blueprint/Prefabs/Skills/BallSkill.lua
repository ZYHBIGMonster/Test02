---@class BallSkill_C:PESkillTemplate_Indicate_C
--Edit Below--
local BallSkill = {}
 
function BallSkill:OnEnableSkill_BP()
    BallSkill.SuperClass.OnEnableSkill_BP(self)
end

function BallSkill:OnDisableSkill_BP()
    BallSkill.SuperClass.OnDisableSkill_BP(self)
end

function BallSkill:OnActivateSkill_BP()
    --UGCWeaponManagerSystem.CurrentWeaponAttachToBack(self.Owner.Owner)
    BallSkill.SuperClass.OnActivateSkill_BP(self)
end

function BallSkill:OnDeActivateSkill_BP()
    BallSkill.SuperClass.OnDeActivateSkill_BP(self)
end

function BallSkill:CanActivateSkill_BP()
    return BallSkill.SuperClass.CanActivateSkill_BP(self)
end

return BallSkill