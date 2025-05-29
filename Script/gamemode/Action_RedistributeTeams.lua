local Action_RedistributeTeams = {
    -- 可配置参数定义，参数将显示在Action配置面板
    -- 例：
    -- MyIntParameter = 0
    HunterCount=2;
}

-- 触发器激活时，将执行Action的Execute
function Action_RedistributeTeams:Execute(...)
	print(string.format("Action_RedistributeTeams:Execute HunterCount[%s]", self.HunterCount));

	local PlayerStates = UGCGameSystem.GetAllPlayerState(false);
	print(string.format("Action_RedistributeTeams:Execute #PlayerStates[%d]", #PlayerStates));

	if #PlayerStates < self.HunterCount then
		print(string.format("Error: Action_RedistributeTeams:Execute #PlayerStates[%d] < HunterCount[%d]", #PlayerStates, self.HunterCount));
		return false;
	end


	if #PlayerStates==TestMode.AllThePlayerNums1 then
		
		self.HunterCount=1;
		
	end

	-- TeamModeComponent:ResetTeamMap();

	--找出猎人玩家
	for i = 1, self.HunterCount, 1 do
		local Index = math.random(#PlayerStates);
		local PlayerState = PlayerStates[Index]; 
		if PlayerState then
			print(string.format("Action_RedistributeTeams:Execute HunterPlayerState[%s]", PlayerState.PlayerName));
			UGCTeamSystem.ChangePlayerTeamID(PlayerState.PlayerKey, TestMode.Camps.Hunter);
			
			table.remove(PlayerStates, Index);
		else
			print("Error: Action_RedistributeTeams:Execute HunterPlayerState is nil!");
		end
	end

	for i, PlayerState in ipairs(PlayerStates) do 
		if PlayerState then
			print(string.format("Action_RedistributeTeams:Execute CatPlayerState[%s]", PlayerState.PlayerName));
			UGCTeamSystem.ChangePlayerTeamID(PlayerState.PlayerKey, TestMode.Camps.Cat);

		else
			print("Error: Action_RedistributeTeams:Execute CatPlayerState is nil!");
		end		
	end

	
	--统计双方人数
	for Key, TeamID in pairs(TestMode.Camps) do
		local PlayerKeys = UGCTeamSystem.GetPlayerKeysByTeamID(TeamID);	
		UGCGameSystem.GameState.TeamAliveNums[TeamID] = #PlayerKeys;
	end
    return true
end

return Action_RedistributeTeams