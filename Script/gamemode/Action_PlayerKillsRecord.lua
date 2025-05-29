local Action_PlayerKillsRecord = 
{
    VictimKey = 0;
}

function Action_PlayerKillsRecord:Execute()

   -- ugcprint("Kill");

    local PlayerState=UGCGameSystem.GetPlayerStateByPlayerKey(self.VictimKey);

   -- ugcprint("Kill1");
    local LocalGameState=UGCGameSystem.GameState;

  --  ugcprint("Kill2");
    LocalGameState.DeadCatName:Add(PlayerState.PlayerName);

   -- ugcprint("Kill3");
    LocalGameState.AliveCatName:Remove(PlayerState.PlayerName);

   -- ugcprint("Kill4");

end

return Action_PlayerKillsRecord