---@class UGCGameMode_C:BP_UGCGameBase_C
---@field LocalPlayerCat ULuaArrayHelper<BP_UGCPlayerPawn_C>
---@field LocalPlayerHunter ULuaArrayHelper<BP_UGCPlayerPawn_C>
--Edit Below--
local UGCGameMode =
 {
    IsChange=true;
 }; 
 function UGCGameMode:ReceiveBeginPlay()

 end

 function UGCGameMode:ReceiveTick(DeltaTime)

    if self.IsChange then  
        if UGCGameSystem.GameState.CurrentGameState==TestMode.GameStateType.GamingState then
            --ugcprint("1");
            local LocalPlayerPawn=UGCGameSystem.GetAllPlayerPawn();
            --ugcprint("2");
            for key, ThePawn in pairs(LocalPlayerPawn) do
                if ThePawn.TeamID==TestMode.Camps.Cat then
                    self.LocalPlayerCat:Add(ThePawn);
                    --ugcprint("3");
                end
                if ThePawn.TeamID==TestMode.Camps.Hunter then
    
                    self.LocalPlayerHunter:Add(ThePawn);
                    --ugcprint("4");
                end
            end
            if #LocalPlayerPawn==TestMode.AllThePlayerNums1 or #LocalPlayerPawn==TestMode.AllThePlayerNums2 then
                
                self.IsChange=false;

            end
        end
    end
       for key, TheHunter in pairs(self.LocalPlayerHunter) do

           local Position1=TheHunter:K2_GetActorLocation();

            for key, TheCat in pairs(self.LocalPlayerCat)  do

                local Position2=TheCat:K2_GetActorLocation();

                local Distance=math.sqrt((Position2.X-Position1.X)*(Position2.X-Position1.X)+(Position2.Y-Position1.Y)*(Position2.Y-Position1.Y)+(Position2.Z-Position1.Z)*(Position2.Z-Position1.Z));

                --ugcprint("%d",Distance);

                if Distance<=TestMode.KillDistance then

                     
                    UGCPawnAttrSystem.SetHealth(TheCat,0);

                    self.LocalPlayerCat:Remove(TheCat);

                    local CatPC=UGCGameSystem.GetPlayerControllerByPlayerPawn(TheCat);

                    local OBPlayerKeys = {}

                    local PlayerControllerList = UGCGameSystem.GetAllPlayerController()

                    for _, PlayerController in ipairs(PlayerControllerList) do

                      if PlayerController and PlayerController ~= self then

                       table.insert(OBPlayerKeys, PlayerController.PlayerKey)

                      end

                     end
                    UGCGameSystem.EnterSpectating(CatPC)   --进入观战
                    
                    UGCGameSystem.ChangeAllowOBPlayerKeys(CatPC, OBPlayerKeys)   --设置该玩家可以观战所有玩家。

                    --ugcprint("chenggong");


               end
            end
        end
end
-- function UGCGameMode:ReceiveEndPlay()
 
-- end
return UGCGameMode;