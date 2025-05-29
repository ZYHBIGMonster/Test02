local Action_GameSettlement = {
    -- 可配置参数定义，参数将显示在Action配置面板
    -- 例：
    -- MyIntParameter = 0
}

-- 触发器激活时，将执行Action的Execute
function Action_GameSettlement:Execute(...)

    print("Action_GameSettlement:SendUGCModeBattleResult");

	local PlayerStates = UGCGameSystem.GetAllPlayerState(false);

	print(string.format("Action_GameSettlement:SendUGCModeBattleResult #PlayerStates[%d]", #PlayerStates));

	for i, PlayerState in ipairs(PlayerStates) do

		if PlayerState then

			UGCGameSystem.SendPlayerSettlement(PlayerState.PlayerKey);
            
		else
            print("Error: Action_GameSettlement:SendUGCModeBattleResult PlayerState is nil!");
		end
	end
    return true
end

--[[
-- 需要勾选Action的EnableTick，才会执行Update
-- 触发器激活后，将在每个tick执行Action的Update，直到self.bEnableActionTick为false
function Action_GameSettlement:Update(DeltaSeconds)

end
]]

return Action_GameSettlement