local Test01 = {}
 

function Test01:ReceiveBeginPlay()

    Test01.SuperClass.ReceiveBeginPlay(self)
    
   -- if self:HasAuthority() then

        ugcprint("Test01Server");

        local ActorPath=UGCMapInfoLib.GetRootLongPackagePath().. "Asset/Blueprint/Test02.Test02_C";
        
        local ActorClass =UE.LoadClass(ActorPath); 

        ScriptGameplayStatics.SpawnActor(self,ActorClass,self:K2_GetActorLocation(),self:K2_GetActorRotation(),{x=1,y=1,z=1});

   -- end

end


--[[
function Test01:ReceiveTick(DeltaTime)
    Test01.SuperClass.ReceiveTick(self, DeltaTime)
end
--]]

--[[
function Test01:ReceiveEndPlay()
    Test01.SuperClass.ReceiveEndPlay(self) 
end
--]]

--[[
function Test01:GetReplicatedProperties()
    return
end
--]]

--[[
function Test01:GetAvailableServerRPCs()
    return
end
--]]

return Test01