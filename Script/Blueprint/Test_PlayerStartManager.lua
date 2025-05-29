local Test_PlayerStartManager = {}
 
function Test_PlayerStartManager:GetUGCModePlayerStart(Controller)
    print(string.format("PeekabooPlayerStartManager:GetUGCModePlayerStart Controller[%s]", tostring(Controller and Controller.PlayerName)));

    if UGCGameSystem.GameState:HasAuthority() == true then 
        print("MMG_Lua PeekabooPlayerStartManager:GetUGCModePlayerStart Server");
    else
        print("MMG_Lua PeekabooPlayerStartManager:GetUGCModePlayerStart Client");
    end

    local PlayerState = Controller.PlayerState;

    if PlayerState == nil then
        print( "Error: PeekabooPlayerStartManager:GetUGCModePlayerStart PlayerState is nil!");
    end

    local SelectedPlayerStart = self:FindPlayerStartByBornPointID(PlayerState.TeamID, true);

	print(string.format("MMG_Lua PeekabooPlayerStartManager:GetUGCModePlayerStart PlayerState.TeamID[%s]", PlayerState.TeamID));

    if SelectedPlayerStart ~= nil then
        print(string.format("PeekabooPlayerStartManager:GetUGCModePlayerStart SelectedPlayerStart[%s] BornID[%d]",   
        KismetSystemLibrary.GetObjectName(SelectedPlayerStart), SelectedPlayerStart.PlayerBornPointID));
        -- SelectedPlayerStart:SetMarkOccupied();
        return SelectedPlayerStart;
    else
        print("Error: PeekabooPlayerStartManager:GetUGCModePlayerStart SelectedPlayerStart is nil!");
    end

    return nil;
end

return Test_PlayerStartManager