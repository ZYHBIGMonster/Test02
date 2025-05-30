---@class EyeBuff_C:PersistEffectBuff
--Edit Below--
local EyeBuff = {}
 
-- buff启动条件
--[[
function EyeBuff:CanApply_BP(OwnerActor)
-- return true
end
--]]

--buff开始

function EyeBuff:OnApply_BP(OwnerActor)
	log_tree("EyeBuff:OnApply_BP(OwnerActor):"..tostring(OwnerActor))
	local Eye = OwnerActor.Eye;
	log_tree("EyeBuff:OnApply_BP(Eye):"..tostring(Eye))

	Eye:SetVisibility(true);
end

-- buff结束

function EyeBuff:OnUnApply_BP(OwnerActor, Reason)
	log_tree("EyeBuff:OnUnApply_BP(OwnerActor, Reason):"..tostring(OwnerActor))
	local Eye = OwnerActor.Eye;
	log_tree("EyeBuff:OnUnApply_BP(Eye, Reason):"..tostring(Eye))

	Eye:SetVisibility(false);
end


-- buff合并条件，A为当前身上已有buff，B为外来buff，当要挂载外来buff时会判断A.CanMerge(B)
--[[
function EyeBuff:CanMerge_BP(PersistEffect)
-- return true
end
--]]

-- buff合并，A为当前身上已有buff，B为外来buff，调用A.OnMerge(B)
--[[
function EyeBuff:OnMerge_BP(PersistEffect)

end
--]]

-- 开启Tick需要SetTickEnable(true)，或buff为间隔触发类型会自动开启
--[[
function EyeBuff:Tick_BP(OwnerActor, DeltaTime)

end
--]]

--[[
function EyeBuff:OnInterrupted_BP(OwnerActor)

end
--]]

-- buff总持续时长变化，如修改ApplyTime、修改StackNum
--[[
function EyeBuff:OnTotalDurationChange_BP(PreTime, CurTime)

end
--]]

-- buff堆叠层数变化
--[[
function EyeBuff:OnStackChange_BP(PreNum, CurNum)

end
--]]

-- buff触发前条件判断
--[[
function EyeBuff:CanTrigger_BP()
	return true
end
--]]

-- buff触发效果
--[[
function EyeBuff:OnTrigger_BP(Delta)

end
--]]

return EyeBuff