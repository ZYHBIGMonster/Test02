---@class UGCPlayerPawn_C:BP_UGCPlayerPawn_C
---@field Eye UWidget3DInstancedComponent
---@field IfChangeMaterial bool
---@field IfChangeMaterialDone bool
---@field IfChangeMaterialBack bool
---@field OriginalMaterials ULuaArrayHelper<UMaterialInstance>
---@field HunterMesh USkeletalMesh
--Edit Below--
local UGCPlayerPawn = 
{
   -- OriginMaterial={};
   bInitMesh = false;
}
 

function UGCPlayerPawn:ReceiveBeginPlay()
    print("UGCPlayerPawn:ReceiveBeginPlay")

    UGCPlayerPawn.SuperClass.ReceiveBeginPlay(self);
 
    self.OriginalMaterials = self.Mesh:GetMaterials();
end

function UGCPlayerPawn:Transtoabit()

    
    self.Mesh:SetScalarParameterValueOnMaterials("Opacity",0.25);

end

function UGCPlayerPawn:TranstoTranslucent()


    local MaterialInst = UE.LoadObject(UGCGameSystem.GetUGCResourcesFullPath('Asset/Material/Translucent.Translucent'));

    for i=0, self.Mesh:GetNumMaterials()-1,1 do
     
        --ugcprint("设置透明材质1");
     
        self.Mesh:SetMaterial(i,MaterialInst);
     
        --ugcprint("设置透明材质2");
     
     end

  

end

function UGCPlayerPawn:TranstoOrigin()
    
   --ugcprint("666")

   --if self.TeamID==TestMode.Camps.Cat then
    
     for i=0, self.Mesh:GetNumMaterials()-1 ,1 do
        
        --ugcprint("321");

         self.Mesh:SetMaterial(i,self.OriginalMaterials:Get(i+1));

        --ugcprint("123");
     end
--    end

-- self.Mesh:SetScalarParameterValueOnMaterials("Opacity",0.25);
    
end

function UGCPlayerPawn:ReceiveTick(DeltaTime)

    UGCPlayerPawn.SuperClass.ReceiveTick(self, DeltaTime)

	if self.IfChangeMaterialDone then

        self:Transtoabit();

    end

    if not UGCGameSystem.IsServer() then
        if not self.bInitMesh then
            if UGCGameSystem.GameState and UGCGameSystem.GameState.CurrentGameState == TestMode.GameStateType.GamingState then
                if self.TeamID and self.TeamID == TestMode.Camps.Hunter then
                    self.bInitMesh = true
                    self.Mesh:SetSkeletalMesh(self.HunterMesh,true,true);
                end
            end
        end
    end
end


function UGCPlayerPawn:GetReplicatedProperties()
    return
    "IfChangeMaterial",
    "IfChangeMaterialBack";
end

---死亡盒子
---@param EventInsigater AController
function UGCPlayerPawn:IsSkipSpawnDeadTombBox(EventInsigater)
    return true --不生成盒子
end

function UGCPlayerPawn:OnRep_IfChangeMaterial()

    if self.IfChangeMaterial then

        self:TranstoTranslucent();

    end

end

function UGCPlayerPawn:OnRep_IfChangeMaterialBack()
    
    if self.IfChangeMaterialBack then
        
        self:TranstoOrigin()
    end

end

--[[
function UGCPlayerPawn:GetAvailableServerRPCs()
    return
end
--]]

-- [Editor Generated Lua] function define Begin:


-- [Editor Generated Lua] function define End;

return UGCPlayerPawn