local SetHunterCanMove = {
    -- 可配置参数定义，参数将显示在Action配置面板
    -- 例：
    -- MyIntParameter = 0
}

-- 触发器激活时，将执行Action的Execute
function SetHunterCanMove:Execute(...)

    local PlayerController=UGCGameSystem.GetAllPlayerController();

    for Key, PC in pairs(PlayerController) do
        
        PC.ifCanMove = true; -- 设置猎人可以移动

        PC:SetHunterMoveable(true); -- 调用设置猎人移动状态的函数
    end

    UGCGameSystem.GameState.HunterUI = true; -- 设置猎人UI可见

    return true
end

--[[
-- 需要勾选Action的EnableTick，才会执行Update
-- 触发器激活后，将在每个tick执行Action的Update，直到self.bEnableActionTick为false
function SetHunterCanMove:Update(DeltaSeconds)

end
]]

return SetHunterCanMove