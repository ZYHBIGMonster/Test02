local Action_PlayerPostLogin = 
{
	PlayerKey = 0;
}

function Action_PlayerPostLogin:Execute()

	--踢出生不逢时的玩家
	ugcprint(string.format("Action_PlayerPostLogin:Execute CurrentRoundState[%s] PlayerKey[%d]", UGCGameSystem.GameState.CurrentRoundState, self.PlayerKey));
	if UGCGameSystem.GameState.CurrentRoundState ~= PeekabooMode.RoundStateType.None then
		local PlayerController = UGCGameSystem.GetPlayerControllerByPlayerKey(self.PlayerKey);
		ugcprint(string.format("Action_PlayerPostLogin:Execute PlayerController.TeamID[%d]", PlayerController.TeamID));	
		if PlayerController ~= nil then
			PlayerController:Untimely();
		end
	end 
end

return Action_PlayerPostLogin