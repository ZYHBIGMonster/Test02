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
                
                UGCPawnSystem.DisabledPawnState(self.Pawn,EPawnState.Move,not bMoveable);
                UGCAttributeSystem.SetGameAttributeValue(self.Pawn,"UGCGeneralMoveSpeedScale",1.3);

                ugcprint("666");
                ugcprint("UGCPlayerController:AddSkill");
                local SkillPath = UGCMapInfoLib.GetRootLongPackagePath() .. "Asset/Blueprint/Prefabs/Skills/StunGrenade.StunGrenade_C"
                log_tree("UGCPlayerController:AddSkill"..SkillPath);
                local SkillClass = UGCObjectUtility.LoadClass(SkillPath)
                log_tree("UGCPlayerController:AddSkill:",tostring(SkillClass));
                UGCPersistEffectSystem.AddSkillByClass(self.Pawn, SkillClass)

                local SkillPath1 = UGCMapInfoLib.GetRootLongPackagePath() .. "Asset/Blueprint/Prefabs/Skills/SmellSkill.SmellSkill_C"
                log_tree("UGCPlayerController:AddSkill"..SkillPath1);
                local SkillClass1 = UGCObjectUtility.LoadClass(SkillPath1)
                log_tree("UGCPlayerController:AddSkill:",tostring(SkillClass1));
                UGCPersistEffectSystem.AddSkillByClass(self.Pawn, SkillClass1)
            elseif self.Pawn.TeamID==TestMode.Camps.Cat then

				local SkillPath2 = UGCMapInfoLib.GetRootLongPackagePath() .. "Asset/Blueprint/Prefabs/Skills/BallSkill.BallSkill_C"
                log_tree("UGCCat:AddSkill"..SkillPath2);
                local SkillClass2 = UGCObjectUtility.LoadClass(SkillPath2)
                log_tree("UGCCat:AddSkill:",tostring(SkillClass2));
                UGCPersistEffectSystem.AddSkillByClass(self.Pawn, SkillClass2)

                --ugcprint("777");
            end
        end
        
    end
    
end
-- function UGCPlayerController:AddSkill(Pawn)

-- end

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