local Action_SetHunterUI = {
    -- 可配置参数定义，参数将显示在Action配置面板
    -- 例：
    -- MyIntParameter = 0
    Time=1;
}

-- 触发器激活时，将执行Action的Execute
function Action_SetHunterUI:Execute(...)

    if self.Time==0 then

       UGCGameSystem.GameState.TimeToZero = 0; -- 设置猎人UI可见

    end
    ugcprint("Action_SetHunterUI:Execute TimeToZero = " .. self.Time);

    return true
end

--[[
-- 需要勾选Action的EnableTick，才会执行Update
-- 触发器激活后，将在每个tick执行Action的Update，直到self.bEnableActionTick为false
function Action_SetHunterUI:Update(DeltaSeconds)

end
]]

return Action_SetHunterUI