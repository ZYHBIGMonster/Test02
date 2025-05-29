local Action_WinnerCheck = {
    -- 可配置参数定义，参数将显示在Action配置面板
    -- 例：
    -- MyIntParameter = 0
}

-- 触发器激活时，将执行Action的Execute
function Action_WinnerCheck:Execute(...)
    print("Action_RoundSettlement:Execute");

    local IsCatAllDead = true;

	local PlayerKeys = UGCTeamSystem.GetPlayerKeysByTeamID(TestMode.Camps.Cat);
	print(string.format("Action_RoundSettlement:Execute #PlayerKeys[%d]", #PlayerKeys));

	for i, PlayerKey in ipairs(PlayerKeys) do 
		local PlayerState = UGCGameSystem.GetPlayerStateByPlayerKey(PlayerKey); 
        if PlayerState and UGCPlayerStateSystem.IsAlive(PlayerState.PlayerKey) then
            IsCatAllDead = false;
            break;
        else
            print("Error: Action_RoundSettlement:Execute CatPlayerState is nil!");
        end
    end

    local WinTeam = TestMode.Camps.Cat;

    if IsCatAllDead then 
        WinTeam = TestMode.Camps.Hunter;
    end

    return true
end

function Action_WinnerCheck:SendSettlementData(WinTeam)
    
    if WinTeam==TestMode.Camps.Cat then

        UGCGameSystem.GameState.WinnerTeam=TestMode.Camps.Cat;
    end
    if WinTeam==TestMode.Camps.Hunter then
        UGCGameSystem.GameState.WinnerTeam=TestMode.Camps.Hunter;
    end
    
end

return Action_WinnerCheck