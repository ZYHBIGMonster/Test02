--[[------------------------------------------团灭检测------------------------------------------------------]]--

local Action_TeamAliveNumCheck = 
{
    VictimKey = 0;
    TeamAllDeadEvent = "";
}

function Action_TeamAliveNumCheck:Execute()
	print(string.format("Action_TeamAliveNumCheck:Execute VictimKey[%u]", self.VictimKey));

	local VictimState = UGCGameSystem.GetPlayerStateByPlayerKey(self.VictimKey);
	if VictimState == nil then
		print("Error: Action_TeamAliveNumCheck:Execute VictimState is nil!");
		return false;
	end

	local TeamID = VictimState.TeamID;

	local TeamAliveNum = 0;

	local PlayerKeys = UGCTeamSystem.GetPlayerKeysByTeamID(TeamID);
	print(string.format("Action_TeamAliveNumCheck:Execute #PlayerKeys[%d]", #PlayerKeys));

	for i, PlayerKey in ipairs(PlayerKeys) do 
		local PlayerState = UGCGameSystem.GetPlayerStateByPlayerKey(PlayerKey); 
		if PlayerState and UGCPlayerStateSystem.IsAlive(PlayerState.PlayerKey) then		
			TeamAliveNum = TeamAliveNum + 1;
		else
			print("Error: Action_TeamAliveNumCheck:Execute PlayerState is nil!");
		end
	end

	print(string.format("Action_TeamAliveNumCheck:Execute TeamID[%d], AliveNum[%d] ", TeamID, TeamAliveNum));

	if UGCGameSystem.GameState.TeamAliveNums[TeamID] ~= nil then
		UGCGameSystem.GameState.TeamAliveNums[TeamID] = TeamAliveNum;
	else
		print(string.format("Error: Action_TeamAliveNumCheck:Execute TeamAliveNums[%d] is nil!", TeamID));
	end

    if TeamAliveNum == 0 then
        if self.TeamAllDeadEvent ~= "" then
            LuaQuickFireEvent(self.TeamAllDeadEvent, self, TeamID);
        end
	end

	return true;
end

return Action_TeamAliveNumCheck