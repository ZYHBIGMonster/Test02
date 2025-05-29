local Action_SetGameState = {
    -- 可配置参数定义，参数将显示在Action配置面板
    -- 例：
    -- MyIntParameter = 0
    GameStateType="None";
}

-- 触发器激活时，将执行Action的Execute
function Action_SetGameState:Execute(...)

    print(string.format("Action_SetRoundState:Execute RoundState[%s]", self.GameStateType));

	if TestMode.GameStateType[self.GameStateType] == nil then
		--print(string.format("Error: Action_SetRoundState:Execute RoundState[%s] Not Exist!", self.RoundState));
		return true;
	end

	--ugcprint("setgamestate");
	
	UGCGameSystem.GameState.CurrentGameState = TestMode.GameStateType[self.GameStateType];

	return true;

end

--[[
-- 需要勾选Action的EnableTick，才会执行Update
-- 触发器激活后，将在每个tick执行Action的Update，直到self.bEnableActionTick为false
function Action_SetGameState:Update(DeltaSeconds)

end
]]

return Action_SetGameState