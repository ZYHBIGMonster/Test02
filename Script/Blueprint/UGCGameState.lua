---@class UGCGameState_C:BP_UGCGameState_C
---@field AliveCatName ULuaArrayHelper<FString>
---@field HunterName ULuaArrayHelper<FString>
---@field DeadCatName ULuaArrayHelper<FString>
--Edit Below--
UGCGameSystem.UGCRequire('Script.Common.ue_enum_custom')
require("Script.UGCEventSystem");
require("Script.TestMode");
require("Script.TestModeEventDfine");
local UGCGameState = 
{

    --准备阶段剩余时间

    ReadyStateRemainTime=-1;

    --游戏阶段剩余时间

    GameStateRemainTime=-1;

    --游戏结束剩余时间

    GameEndRemainTime=-1;

    --队伍存活人数列表

    TeamAliveNums = 
    {
       [TestMode.Camps.Cat] = 0;
       [TestMode.Camps.Hunter] = 0;
    };
    --现在游戏状态

    CurrentGameState=TestMode.GameStateType.None;

    --现在隐藏色

    CurrentColorType=TestMode.ColorType.None;


    --Hunter可以移动剩余时间

    MoveRemainTime=-1;

    --颜色改变剩余时间

    ColorChangeRemainTime=30;

    WinnerTeam=0;

    i=true;

    ii=true;

    Bgm_int=0;

    MainControlPanel=nil;

    AliveCat=0;

}; 
function UGCGameState:ReceiveBeginPlay()

    require("Script.UGCEventSystem");
    require("Script.TestMode");
    require("Script.TestModeEventDfine");
    self.SuperClass.ReceiveBeginPlay(self);

    if self:HasAuthority()==false then
        --ugcprint("UICreate");
        self:InitUI();
    end

    self.MainControlPanel = GameBusinessManager.GetWidgetFromName(ingame, "MainControlPanelTochButton_C");
    
    --隐藏部分不需要的UI
    if self.MainControlPanel ~= nil then

        local MainControlBaseUI = self.MainControlPanel.MainControlBaseUI;
        MainControlBaseUI.NavigatorPanel:SetVisibility(ESlateVisibility.Collapsed);
        MainControlBaseUI.CanvasPanelSurviveKill:SetVisibility(ESlateVisibility.Collapsed);
        MainControlBaseUI.SignalReceivingAreaTIPS_UIBP:SetVisibility(ESlateVisibility.Collapsed);
        MainControlBaseUI.CircleChasingProgress:SetVisibility(ESlateVisibility.Collapsed);
        MainControlBaseUI.SurviveInfoPanel:SetVisibility(ESlateVisibility.Collapsed);

        -- self.MainControlPanel.ShootingUIPanel.SwitchWeaponSlot_Mode2.Image_Selected:SetVisibility(ESlateVisibility.Collapsed);
        -- self.MainControlPanel.ShootingUIPanel.SwitchWeaponSlot_Mode2.Image_Selected:SetVisibility(ESlateVisibility.Collapsed);
        --MainControlBaseUI.Ingame_TeamPanel_BP:SetVisibility(ESlateVisibility.Collapsed);

        MainControlBaseUI.IsNeedTeamPanel = false;
    else
        print("Error: PeekabooUIManager:InitBaseUI MainControlPanel == nil!");
    end
end

function UGCGameState:InitUI()

    local MainUIClass = UE.LoadClass(UGCMapInfoLib.GetRootLongPackagePath().. "Asset/UI/UIBP_MainUI.UIBP_MainUI_C");

    local PlayerController=GameplayStatics.GetPlayerController(UGCGameSystem.GameState, 0);

    if PlayerController == nil then
        return false;
    end
    
    if MainUIClass == nil then

        --ugcprint("Fail");

        return false;
    end
    local MainUI = UserWidget.NewWidgetObjectBP(PlayerController, MainUIClass);

    if MainUI~=nil then
        MainUI:AddToViewport();
    end
end

function UGCGameState:ReceiveTick(DeltaTime)

    if self:HasAuthority()==false then
        if self.CurrentGameState==TestMode.GameStateType.GamingState then
            if self.ii then
              local AudioPath =UE.LoadObject('/Game/WwiseEvent/Ambient/Play_Ambient_Leaf_Music.Play_Ambient_Leaf_Music')
              self.Bgm_int=UGCSoundManagerSystem.PlaySound2D(AudioPath)
              self.ii=false
            end
        end
    end
    
    if self:HasAuthority()==false then

        if self.CurrentGameState==TestMode.GameStateType.GameEndState then
            UGCSoundManagerSystem.StopSoundByID(self.Bgm_int)
        end
    end


    if self:HasAuthority() then

        if self.i then

            if self.CurrentGameState==TestMode.GameStateType.GamingState then
    
                local PlayerStates=UGCGameSystem.GetAllPlayerState(false);
        
                for key, LocalPlayerState in pairs(PlayerStates) do
        
                    if LocalPlayerState.TeamID==TestMode.Camps.Hunter then
        
                        self.HunterName:AddUnique(LocalPlayerState.PlayerName);

                        print(string.format("uicat数量[%s][d][d]",LocalPlayerState.PlayerName));

                        ugcprint("111")
        
                    end
                    if LocalPlayerState.TeamID==TestMode.Camps.Cat then
        
                        self.AliveCatName:AddUnique(LocalPlayerState.PlayerName);
        
                        ugcprint("222")
                    end

                    print(string.format("uicat数量[%s][d][d]",LocalPlayerState.PlayerName));
                        
         
                end
    
                self.AliveCat=self.AliveCatName:Num();

                self.i=false;
    
            end
        end
    end

 end

function UGCGameState:GetReplicatedProperties()

    return
    "ReadyStateRemainTime",
    "GameStateRemainTime",
    "GameEndRemainTime",
    "CurrentGameState",
    "ColorChangeRemainTime",
    "MoveRemainTime",
    "CurrentColorType",
    "AliveCat";
end

function UGCGameState:OnRep_AliveCat()

    UGCEventSystem:SendEvent(TestModeEventDfine.AliveCat,self.AliveCat);
    
end

function UGCGameState:OnRep_CurrentColorType()
    
    UGCEventSystem:SendEvent(TestModeEventDfine.ColorChange,self.CurrentColorType);

end
function UGCGameState:OnRep_MoveRemainTime()

    UGCEventSystem:SendEvent(TestModeEventDfine.HunterMovbleRemainTimeChange,self.MoveRemainTime);

end

function UGCGameState:OnRep_ColorChangeRemainTime()
    
    UGCEventSystem:SendEvent(TestModeEventDfine.ColorChangeRemainTimeChange,self.ColorChangeRemainTime);

end

function UGCGameState:OnRep_ReadyStateRemainTime()
    
    UGCEventSystem:SendEvent(TestModeEventDfine.ReadyStateRemainTimeChange,self.ReadyStateRemainTime);

end

function UGCGameState:OnRep_GameStateRemainTime()

    UGCEventSystem:SendEvent(TestModeEventDfine.GameStateRemainTimeChange,self.GameStateRemainTime);
    
end

function UGCGameState:OnRep_GameEndRemainTime()

    UGCEventSystem:SendEvent(TestModeEventDfine.GameEndRemainTimeChange,self.GameEndRemainTime);
    
end

function UGCGameState:OnRep_CurrentGameState()
    
    --ugcprint("OnRep_CurrentGameState");

    local PlayerController= GameplayStatics.GetPlayerController(UGCGameSystem.GameState,0);

    local Character = PlayerController:GetPlayerCharacterSafety();

    if self.CurrentGameState ==TestMode.GameStateType.GamingState then
        if Character~=nil then
            if Character.TeamID==TestMode.Camps.Hunter then
                UGCEventSystem:SendEvent(TestModeEventDfine.HunterUI);
            end
            if Character.TeamID==TestMode.Camps.Cat then
                
                --ugcprint("Cat");
                UGCEventSystem:SendEvent(TestModeEventDfine.CatUI);
    
            end
        end
    end


    
    if self.CurrentGameState==TestMode.GameStateType.GameEndState then
        
        UGCEventSystem:SendEvent(TestModeEventDfine.GameEnd,self.AliveCatName,self.HunterName,self.DeadCatName);

        ugcprint("GameEnd");

    end

end


return UGCGameState;
