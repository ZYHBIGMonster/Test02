local Action_PlayerExit = {
    -- 可配置参数定义，参数将显示在Action配置面板
    -- 例：
    -- MyIntParameter = 0
    exitkey = 0;  -- 玩家离开时的PlayerKey
    isLostConnect=false;  -- 玩家是否是因为掉线而离开
}

-- 触发器激活时，将执行Action的Execute
function Action_PlayerExit:Execute(...)

    local TheCat = UGCGameSystem.GetPlayerPawnByPlayerKey(self.exitkey);

    if TheCat == nil then
        ugcprint(string.format("[Action_PlayerExit] Error: PlayerState is nil for PlayerKey %d", self.exitkey));
        return false;
    end
    if self.isLostConnect then
        return;
    end
    UGCPawnAttrSystem.SetHealth(TheCat,0);

    return true
end

--[[
-- 需要勾选Action的EnableTick，才会执行Update
-- 触发器激活后，将在每个tick执行Action的Update，直到self.bEnableActionTick为false
function Action_PlayerExit:Update(DeltaSeconds)

end
]]

return Action_PlayerExit