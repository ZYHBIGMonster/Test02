---@class UGCPlayerController_C:BP_UGCPlayerController_C
---@field IfChangePawn bool
--Edit Below--
local UGCPlayerController =
 {


 }
 

function UGCPlayerController:ReceiveBeginPlay()

    UGCPlayerController.SuperClass.ReceiveBeginPlay(self)

end

function UGCPlayerController:SetHunterMoveable(bMoveable)

    
    if UGCGameSystem.GameState.CurrentGameState==TestMode.GameStateType.GamingState then

        if self.Pawn then
            
            if self.Pawn.TeamID==TestMode.Camps.Hunter then
                
                --ugcprint("666");

                UGCPawnSystem.DisabledPawnState(self.Pawn,EPawnState.Move,not bMoveable);
                UGCAttributeSystem.SetGameAttributeValue(self.Pawn,"UGCGeneralMoveSpeedScale",1.6);


                --ugcprint("777");
            end
        end
        
    end
    
end

--[[
function UGCPlayerController:ReceiveTick(DeltaTime)
    UGCPlayerController.SuperClass.ReceiveTick(self, DeltaTime)
end
--]]

--[[
function UGCPlayerController:ReceiveEndPlay()
    UGCPlayerController.SuperClass.ReceiveEndPlay(self) 
end
--]]


-- function UGCPlayerController:GetReplicatedProperties()
--     return;
-- end


--[[
function UGCPlayerController:GetAvailableServerRPCs()
    return
end
--]]
-- function UGCPlayerController:GetAvailableServerRPCs() 
--     return;
-- end


return UGCPlayerController