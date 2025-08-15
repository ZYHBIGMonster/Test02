---@class UIBP_MainUI_C:UUserWidget
---@field Border_0 UBorder
---@field HorizontalBox_0 UHorizontalBox
---@field HorizontalBox_1 UHorizontalBox
---@field Image_ColorRemainTime UImage
---@field Image_Titile UImage
---@field SizeBox_0 USizeBox
---@field Text_RemainTime UTextBlock
---@field TextBlock_74 UTextBlock
---@field TextBlock_360 UTextBlock
---@field TextBlock_362 UTextBlock
---@field UI_End UI_End_C
--Edit Below--

local UIBP_MainUI = 
 { 
    bInitDoOnce = false;

    
 } 


function UIBP_MainUI:Construct()

    self:EventBind();
    -- UGCWidgetManagerSystem.HideWidget("MainUI_SurviveInfo_Btn_C_0")
end


function UIBP_MainUI:EventBind()

    UGCEventSystem:AddListener(TestModeEventDfine.ReadyStateRemainTimeChange,self.OnReadyStateRemainTimeChange,self);
    UGCEventSystem:AddListener(TestModeEventDfine.GameStateRemainTimeChange,self.OnGameStateRemainTimeChange,self);
    UGCEventSystem:AddListener(TestModeEventDfine.GameEndRemainTimeChange,self.OnGameEndRemainTimeChange,self);
    UGCEventSystem:AddListener(TestModeEventDfine.HunterUI,self.HunterUI,self);
    UGCEventSystem:AddListener(TestModeEventDfine.CatUI,self.CatUI,self);
    UGCEventSystem:AddListener(TestModeEventDfine.ColorChangeRemainTimeChange,self.OnColorChangeRemainTime,self);
    UGCEventSystem:AddListener(TestModeEventDfine.ColorChange,self.OnColorChange,self);
    UGCEventSystem:AddListener(TestModeEventDfine.HunterMovbleRemainTimeChange,self.HunterMove,self);
    UGCEventSystem:AddListener(TestModeEventDfine.GameEnd,self.OnGameEnd,self);
    UGCEventSystem:AddListener(TestModeEventDfine.AliveCat,self.OnAliveCatChange,self);
    UGCEventSystem:AddListener(TestModeEventDfine.TimeToZero,self.OnTimeToZero,self);
    UGCEventSystem:AddListener(TestModeEventDfine.TheHunterUI,self.OnTheHunterUI,self);
end

function UIBP_MainUI:OnTheHunterUI(HunterUI)
    
    if HunterUI==true then
    self.HorizontalBox_1:SetVisibility(ESlateVisibility.Collapsed);
        
    end

end

function UIBP_MainUI:OnTimeToZero(TimeToZero)

    if TimeToZero==0 then

    self.HorizontalBox_1:SetVisibility(ESlateVisibility.Collapsed);
        
    end

end

function UIBP_MainUI:OnAliveCatChange(AliveCat)

    if UGCGameSystem.GameState.CurrentGameState~=TestMode.GameStateType.GamingState then
        return;
    end

    self.Border_0:SetVisibility(ESlateVisibility.SelfHitTestInvisible);

    self.TextBlock_74:SetText(tostring(AliveCat));
    if AliveCat == 0 then
        self.TextBlock_74:SetText("0");
    end
end

function UIBP_MainUI:OnGameEnd(AliveCatName,HunterName,DeadCatName)

    -- self.TextBlock_74:SetText(tostring(AliveCatName:Num()));

    local PC = STExtraGameplayStatics.GetFirstPlayerController(self)

    if PC then

        PC:CastUIMsg("MainControlPanel_HideAllUI", "ingame");

    else
        print("Error: PeekabooSettlementUI:ShowReult PC is nil!")
    end
    local LocalAddClass = UE.LoadClass(UGCMapInfoLib.GetRootLongPackagePath().. "Asset/UI/UI_Add.UI_Add_C");

    local PlayerController=GameplayStatics.GetPlayerController(UGCGameSystem.GameState, 0);

    self.UI_End:SetVisibility(ESlateVisibility.SelfHitTestInvisible);

    self.Image_ColorRemainTime:SetVisibility(ESlateVisibility.Collapsed);

    self.HorizontalBox_0:SetVisibility(ESlateVisibility.Collapsed);

    self.SizeBox_0:SetVisibility(ESlateVisibility.Collapsed);

    self.HorizontalBox_1:SetVisibility(ESlateVisibility.Collapsed);

    local extraHunterSlot={};

    local extraCatSlot={};

    self.UI_End.TextBlock_5:SetText(tostring(AliveCatName:Num()+DeadCatName:Num()));

    self.UI_End.TextBlock_3:SetText(tostring(DeadCatName:Num()));

    if AliveCatName:Num()==0 then
        self.UI_End.TextBlock_0:SetText("抓捕成功")
    end

    for _ , Hunter in pairs(HunterName) do

        local HunterAdd=UserWidget.NewWidgetObjectBP(PlayerController,LocalAddClass);

        local HunterAddSlot=self.UI_End.VerticalBox_3:AddChildToVerticalBox(HunterAdd);

        HunterAdd.TextBlock_453:SetText(tostring(Hunter));

        HunterAdd.Image_5:SetColorAndOpacity(TestMode.SettlementColor.purple);
        self:CatSettlementInit(HunterAddSlot);
    end


    for _, AliveCat in pairs(AliveCatName) do
        local CatAdd=UserWidget.NewWidgetObjectBP(PlayerController,LocalAddClass);

        local CatAddSlot=self.UI_End.VerticalBox_2:AddChildToVerticalBox(CatAdd);
        CatAdd.TextBlock_453:SetText(tostring(AliveCat));
        CatAdd.Image_5:SetColorAndOpacity(TestMode.SettlementColor.Green);
        self:CatSettlementInit(CatAddSlot);
    end

    for _, DeadCat in pairs(DeadCatName) do

        local DeadCatAdd=UserWidget.NewWidgetObjectBP(PlayerController,LocalAddClass);
        local DeadCatAddSlot=self.UI_End.VerticalBox_2:AddChildToVerticalBox(DeadCatAdd);
        DeadCatAdd.TextBlock_453:SetText(tostring(DeadCat));
        DeadCatAdd.Image_5:SetColorAndOpacity(TestMode.SettlementColor.Red);
        self:CatSettlementInit(DeadCatAddSlot);
    end

    --停止检测DS连接
    if NetUtil then
        NetUtil.StopCheckDSActive();
    end
    
    --忽略DS链接报错
    if BattleResult then
        BattleResult.IgnoreDSError = true;
    end
    
end

function UIBP_MainUI:CatSettlementInit(Theslot)

    Theslot:SetSize({Value=1,SizeRule=ESlateSizeRule.Fill});

    Theslot:SetHorizontalAlignment(EHorizontalAlignment.HAlign_Center);

    Theslot:SetVerticalAlignment(EVerticalAlignment.VAlign_Center);
    
end
function UIBP_MainUI:HunterMove(RemainTime)
    
    self.TextBlock_362:SetText(tostring(RemainTime));
    
end

function UIBP_MainUI:OnColorChange(ColorType)
   -- ugcprint("ui颜色改变了");
   
    if ColorType==1 then
        ugcprint("蓝色");
        self.Image_ColorRemainTime:SetColorAndOpacity(TestMode.TheColor.Blue);
    end
    if ColorType==2 then
        ugcprint("绿色");
        self.Image_ColorRemainTime:SetColorAndOpacity(TestMode.TheColor.Green);
    end
    if ColorType==3 then
        ugcprint("粉色");
        self.Image_ColorRemainTime:SetColorAndOpacity(TestMode.TheColor.Pink);
    end
    if ColorType==4 then
        ugcprint("黄色");
        self.Image_ColorRemainTime:SetColorAndOpacity(TestMode.TheColor.Yellow);
    end
    if ColorType==5 then
        ugcprint("橙色");
        self.Image_ColorRemainTime:SetColorAndOpacity(TestMode.TheColor.Orange);
    end
end
function UIBP_MainUI:OnReadyStateRemainTimeChange(RemainTime)

    if RemainTime~=0 then
        self.Text_RemainTime:SetText(tostring(RemainTime)); 
    end

    if RemainTime==0 then
        self.Text_RemainTime:SetText(tostring(TestMode.MaxGametime)); 
    end

end

function UIBP_MainUI:OnGameStateRemainTimeChange(RemainTime,colortime)

    self.Text_RemainTime:SetText(tostring(RemainTime));

    self.TextBlock_360:SetText(tostring(colortime));

    
    if RemainTime==0 then

        self.Text_RemainTime:SetText(tostring(10));
        
    end
    
end

function UIBP_MainUI:OnGameEndRemainTimeChange(RemainTime)
    
   -- ugcprint("666");
    self.Text_RemainTime:SetText(tostring(RemainTime));
    if RemainTime==0 then

        local PlayerController = STExtraGameplayStatics.GetFirstPlayerController(self);

        if PlayerController then

           PlayerController:ExitGame();

        else
            
        print("PeekabooSettlementUI:Button_Back_OnClicked PlayerController is nil");
    end

    UGCGameSystem.ReturnToLobby();
    end

end

function UIBP_MainUI:HunterUI(Time)

if Time ==-1 then

      self.HorizontalBox_1:SetVisibility(ESlateVisibility.SelfHitTestInvisible);
        
    end
    --ugcprint("HunterUI");

end

function UIBP_MainUI:CatUI()
    
    --ugcprint("CatUI");
    self.Image_ColorRemainTime:SetVisibility(ESlateVisibility.SelfHitTestInvisible);
    self.HorizontalBox_0:SetVisibility(ESlateVisibility.SelfHitTestInvisible);
    self.SizeBox_0:SetVisibility(ESlateVisibility.SelfHitTestInvisible);
end



return UIBP_MainUI