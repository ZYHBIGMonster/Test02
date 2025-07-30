local Action_PlayerExit = 
{
	ExitKey = 0;
	PlayersLeaveNotifyEvent = "";
}

function Action_PlayerExit:Execute()
	print(string.format("Action_PlayerExit:Execute ExitKey[%d]", self.ExitKey));

	UGCGameSystem.SendPlayerSettlement(self.ExitKey);

	local PlayerState = UGCGameSystem.GetPlayerStateByPlayerKey(self.ExitKey); 
	
	if PlayerState.TeamID==TestMode.Camps.Cat then

		UGCGameSystem.GameState.AliveCat=UGCGameSystem.GameState.AliveCat-1;
		
	end
	if PlayerState then
		local PlayerKeys = UGCTeamSystem.GetPlayerKeysByTeamID(PlayerState.TeamID);
		print(string.format("Action_PlayerExit:Execute #PlayerKeys[%d]", #PlayerKeys));

		if #PlayerKeys == 1 then
			if self.PlayersLeaveNotifyEvent ~= "" then 
				print("Action_PlayerExit:Execute Send PlayersLeaveNotifyEvent");
				LuaQuickFireEvent(self.PlayersLeaveNotifyEvent, self); 
			end
		end
	else
        print(string.format("Error: Action_PlayerExit:Execute PlayerExit[%d] is nil!", self.ExitKey));
	end

	return true;
end

return Action_PlayerExit