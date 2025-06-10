---@class bp_Color_Base_C:AActor
---@field Box UBoxComponent
---@field StaticMesh UStaticMeshComponent
---@field DefaultSceneRoot USceneComponent
---@field ColorValue int32
---@field LocalPawn ULuaArrayHelper<BP_UGCPlayerPawn_C>
--Edit Below--
local bp_Color_Base = 
{

}
 

function bp_Color_Base:ReceiveTick(DeltaTime)



	bp_Color_Base.SuperClass.ReceiveTick(self,DeltaTime);


if self:HasAuthority() then

	if self.LocalPawn:Num() ~= 0 then

		if UGCGameSystem.GameState.CurrentColorType ~= self.ColorValue then
		
			for key, ThePawn in pairs(self.LocalPawn) do
	
				--ugcprint("ThePawnfor循环");

				ThePawn.IfChangeMaterial=false;
	
				ThePawn.IfChangeMaterialBack=true;

				self.LocalPawn:Remove(ThePawn);

				--ugcprint("ThePawnfor循环成功");
	
			end

			
		end

		--ugcprint("faker vs bin");

	end

end

if self:HasAuthority() then

	if self.LocalPawn:Num() ~= 0 then

		if UGCGameSystem.GameState.CurrentColorType ~= self.ColorValue then
		
			for key, ThePawn in pairs(self.LocalPawn) do
	
				--ugcprint("ThePawnfor循环");
	
				ThePawn.IfChangeMaterialDone=false;

				--ugcprint("ThePawnfor循环成功");
	
			end

		end

	end
end
	
	
end

function bp_Color_Base:ReceiveBeginPlay()
	
	bp_Color_Base.SuperClass.ReceiveBeginPlay(self)



	if self:HasAuthority() then

		self.ColorValue=math.random(TestMode.ColorNums);

		--ugcprint("1")
		local Cube= UE.LoadObject(UGCGameSystem.GetUGCResourcesFullPath('Asset/Blueprint/ColorMesh/Cube.Cube'));
		--ugcprint("2")
		local Sphere=UE.LoadObject(UGCGameSystem.GetUGCResourcesFullPath('Asset/Blueprint/ColorMesh/Sphere.Sphere'));
		--ugcprint("3")
		local Si=UE.LoadObject(UGCGameSystem.GetUGCResourcesFullPath('Asset/Blueprint/ColorMesh/tetrahedro.tetrahedro'));
		--ugcprint("4")
		local Num=math.random(3);
		if Num==1 then
			self.StaticMesh:SetStaticMesh(Cube);
			--ugcprint("5")
		end
		if Num==2 then
			self.StaticMesh:SetStaticMesh(Sphere);
			--ugcprint("5")
		end
		if Num==3 then
			self.StaticMesh:SetStaticMesh(Si);
			--ugcprint("5")
		end
	end

    print("BoxPrint");
    self.LuaInit(self);
end

function bp_Color_Base:GetReplicatedProperties()
	return
	"ColorValue";
end

function bp_Color_Base:OnRep_ColorValue()
	
	local Blue = UE.LoadObject(UGCGameSystem.GetUGCResourcesFullPath('Asset/Blueprint/ColorMesh/Blue.Blue'));
	local Green = UE.LoadObject(UGCGameSystem.GetUGCResourcesFullPath('Asset/Blueprint/ColorMesh/Green.Green'));
	local Pink = UE.LoadObject(UGCGameSystem.GetUGCResourcesFullPath('Asset/Blueprint/ColorMesh/Pink.Pink'));
	local Yellow = UE.LoadObject(UGCGameSystem.GetUGCResourcesFullPath('Asset/Blueprint/ColorMesh/Yellow.Yellow'));
	local Orange = UE.LoadObject(UGCGameSystem.GetUGCResourcesFullPath('Asset/Blueprint/ColorMesh/Orange.Orange'));

	if self.ColorValue==1 then
		self.StaticMesh:SetMaterial(0,Blue);
		print("ColorValueis1,ThisisBlue");
	end
	if self.ColorValue==2 then
		self.StaticMesh:SetMaterial(0,Green);
		print("ColorValueis1,ThisisGreen");
	end
	if self.ColorValue==3 then
		self.StaticMesh:SetMaterial(0,Pink);
		ugcprint("8")
	end
	if self.ColorValue==4 then
		self.StaticMesh:SetMaterial(0,Yellow);
		ugcprint("9")
	end
	if self.ColorValue==5 then
		self.StaticMesh:SetMaterial(0,Orange);
		ugcprint("10")
	end
end
function bp_Color_Base:LuaInit()
	if self.bInitDoOnce then
		return;
	end
	self.bInitDoOnce = true;

	--if self:HasAuthority() then

		self.Box.OnComponentBeginOverlap:Add(self.Box_OnComponentBeginOverlap, self);

		self.Box.OnComponentEndOverlap:Add(self.Box_OnComponentEndOverlap, self);

	--end	
end

function bp_Color_Base:Box_OnComponentBeginOverlap(OverlappedComponent, OtherActor, OtherComp, OtherBodyIndex, bFromSweep, SweepResult)

	if self:HasAuthority() then

		local Playercontroller=OtherActor:GetPlayerControllerSafety();

	    if Playercontroller then

		  if OtherActor.TeamID==TestMode.Camps.Cat then
			
			if UGCGameSystem.GameState.CurrentColorType==self.ColorValue then


				self.LocalPawn:AddUnique(OtherActor);
				
				OtherActor.IfChangeMaterial=true;

				OtherActor.IfChangeMaterialBack=false;

			end

		  end
		
		end

	end

	if self:HasAuthority() == false then

		  if OtherActor.TeamID==TestMode.Camps.Cat then
			
			if UGCGameSystem.GameState.CurrentColorType==self.ColorValue then

				OtherActor.IfChangeMaterialDone=true;

			end

		 end
		
	end
	
	return nil;

end

function bp_Color_Base:Box_OnComponentEndOverlap(OverlappedComponent, OtherActor, OtherComp, OtherBodyIndex)

	--ugcprint("结束接触")

	if self:HasAuthority()then

		local Playercontroller=OtherActor:GetPlayerControllerSafety();

	    if Playercontroller then

		  if OtherActor.TeamID==TestMode.Camps.Cat then
			
			if UGCGameSystem.GameState.CurrentColorType==self.ColorValue then


				OtherActor.IfChangeMaterial=false;

				OtherActor.IfChangeMaterialBack=true;

			end

					
			if self.LocalPawn:Find(OtherActor) then

				self.LocalPawn:Remove(OtherActor);
	
				ugcprint("成功remove");
				
			end
			
		end

		end
	end

	if self:HasAuthority()==false then

		if OtherActor.TeamID==TestMode.Camps.Cat then
			
			if UGCGameSystem.GameState.CurrentColorType==self.ColorValue then

				OtherActor.IfChangeMaterialDone=false;

			end

		 end
	end
	return nil;
end


return bp_Color_Base