---@class UIBP_MainUI_C:UUserWidget
---@field HorizontalBox_0 UHorizontalBox
---@field HorizontalBox_1 UHorizontalBox
---@field Image_ColorRemainTime UImage
---@field Image_Titile UImage
---@field SizeBox_0 USizeBox
---@field Text_RemainTime UTextBlock
---@field TextBlock_360 UTextBlock
---@field TextBlock_362 UTextBlock
---@field UI_End UI_End_C
--Edit Below--

local UIBP_MainUI = 
 { 
    bInitDoOnce = false;

    i=11;
    
 } 


function UIBP_MainUI:Construct()

    self:EventBind();
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

end

function UIBP_MainUI:OnGameEnd(AliveCatName,HunterName,DeadCatName)

    local LocalAddClass = UE.LoadClass(UGCMapInfoLib.GetRootLongPackagePath().. "Asset/UI/UI_Add.UI_Add_C");

    local PlayerController=GameplayStatics.GetPlayerController(UGCGameSystem.GameState, 0);

    self.UI_End:SetVisibility(ESlateVisibility.SelfHitTestInvisible);

    self.Image_ColorRemainTime:SetVisibility(ESlateVisibility.Collapsed);

    self.HorizontalBox_0:SetVisibility(ESlateVisibility.Collapsed);

    self.SizeBox_0:SetVisibility(ESlateVisibility.Collapsed);

    self.HorizontalBox_1:SetVisibility(ESlateVisibility.Collapsed);

    local extraHunterSlot={};

    local extraCatSlot={};

    self.UI_End.UI_Add_4.Image_5:SetColorAndOpacity({R=0.700000,G=0.000000,B=1.000000,A=1.000000});

    self.UI_End.UI_Add_4.TextBlock_453:SetText(tostring(HunterName:Get(1)));

    if HunterName:Num()==2 then

        self.UI_End.TextBlock_5:SetText(tostring(6));

        local LocalAdd1 = UserWidget.NewWidgetObjectBP(PlayerController, LocalAddClass);

        local LocalAdd2 = UserWidget.NewWidgetObjectBP(PlayerController, LocalAddClass);

        local LocalAdd3 = UserWidget.NewWidgetObjectBP(PlayerController, LocalAddClass);

        local LocalAdd4 = UserWidget.NewWidgetObjectBP(PlayerController, LocalAddClass);



        extraHunterSlot[1]=self.UI_End.VerticalBox_3:AddChildToVerticalBox(LocalAdd1);

        LocalAdd1.Image_5:SetColorAndOpacity({R=0.700000,G=0.000000,B=1.000000,A=1.000000});

        LocalAdd1.TextBlock_453:SetText(tostring(HunterName:Get(2)));

       -- ugcprint("0");

        extraHunterSlot[1]:SetSize({Value=1,SizeRule=ESlateSizeRule.Fill});

      --  ugcprint("1");
        extraHunterSlot[1]:SetHorizontalAlignment(EHorizontalAlignment.HAlign_Center);

       -- ugcprint("2");
        extraHunterSlot[1]:SetVerticalAlignment(EVerticalAlignment.VAlign_Center);

       -- ugcprint("3");

        extraCatSlot[1]=self.UI_End.VerticalBox_2:AddChildToVerticalBox(LocalAdd2);

        self:CatSettlementInit(extraCatSlot[1]);
      --  ugcprint("4");

        extraCatSlot[2]=self.UI_End.VerticalBox_2:AddChildToVerticalBox(LocalAdd3);

        self:CatSettlementInit(extraCatSlot[2]);
      --  ugcprint("5");

        extraCatSlot[3]=self.UI_End.VerticalBox_2:AddChildToVerticalBox(LocalAdd4);

        self:CatSettlementInit(extraCatSlot[3]);
       -- ugcprint("6");

       if DeadCatName:Num()==0 and AliveCatName:Num()==6 then

        self.UI_End.TextBlock_3:SetText(tostring(0));
        self.UI_End.UI_Add.TextBlock_453:SetText(tostring(AliveCatName:Get(1)));
        self.UI_End.UI_Add_0.TextBlock_453:SetText(tostring(AliveCatName:Get(2)));  
        self.UI_End.UI_Add_1.TextBlock_453:SetText(tostring(AliveCatName:Get(3)));  
        LocalAdd2.TextBlock_453:SetText(tostring(AliveCatName:Get(4)));
        LocalAdd3.TextBlock_453:SetText(tostring(AliveCatName:Get(5)));
        LocalAdd4.TextBlock_453:SetText(tostring(AliveCatName:Get(6)));

       end

       if DeadCatName:Num()==1  and AliveCatName:Num()==5 then
        self.UI_End.TextBlock_3:SetText(tostring(1));

        LocalAdd4.Image_5:SetColorAndOpacity({R=1,G=0,B=0,A=1});
        LocalAdd4.TextBlock_453:SetText(tostring(DeadCatName:Get(1)));

        self.UI_End.UI_Add.TextBlock_453:SetText(tostring(AliveCatName:Get(1)));
        self.UI_End.UI_Add_0.TextBlock_453:SetText(tostring(AliveCatName:Get(2)));  
        self.UI_End.UI_Add_1.TextBlock_453:SetText(tostring(AliveCatName:Get(3)));  
        LocalAdd2.TextBlock_453:SetText(tostring(AliveCatName:Get(4)));
        LocalAdd3.TextBlock_453:SetText(tostring(AliveCatName:Get(5)));
       end
       if DeadCatName:Num()==2 and AliveCatName:Num()==4 then

        self.UI_End.TextBlock_3:SetText(tostring(2));

        LocalAdd4.Image_5:SetColorAndOpacity({R=1,G=0,B=0,A=1});
        LocalAdd4.TextBlock_453:SetText(tostring(DeadCatName:Get(1)));
        LocalAdd3.Image_5:SetColorAndOpacity({R=1,G=0,B=0,A=1});
        LocalAdd3.TextBlock_453:SetText(tostring(DeadCatName:Get(2)));

        self.UI_End.UI_Add.TextBlock_453:SetText(tostring(AliveCatName:Get(1)));
        self.UI_End.UI_Add_0.TextBlock_453:SetText(tostring(AliveCatName:Get(2)));  
        self.UI_End.UI_Add_1.TextBlock_453:SetText(tostring(AliveCatName:Get(3)));  
        LocalAdd2.TextBlock_453:SetText(tostring(AliveCatName:Get(4)));
       end
       if DeadCatName:Num()==3 and AliveCatName:Num()==3 then

        self.UI_End.TextBlock_3:SetText(tostring(3));
        
        LocalAdd4.Image_5:SetColorAndOpacity({R=1,G=0,B=0,A=1});
        LocalAdd4.TextBlock_453:SetText(tostring(DeadCatName:Get(1)));
        LocalAdd3.Image_5:SetColorAndOpacity({R=1,G=0,B=0,A=1});
        LocalAdd3.TextBlock_453:SetText(tostring(DeadCatName:Get(2)));
        LocalAdd2.Image_5:SetColorAndOpacity({R=1,G=0,B=0,A=1});
        LocalAdd2.TextBlock_453:SetText(tostring(DeadCatName:Get(3)));

        self.UI_End.UI_Add.TextBlock_453:SetText(tostring(AliveCatName:Get(1)));
        self.UI_End.UI_Add_0.TextBlock_453:SetText(tostring(AliveCatName:Get(2)));  
        self.UI_End.UI_Add_1.TextBlock_453:SetText(tostring(AliveCatName:Get(3)));  
       end
       if DeadCatName:Num()==4 and AliveCatName:Num()==2 then

        self.UI_End.TextBlock_3:SetText(tostring(4));

        LocalAdd4.Image_5:SetColorAndOpacity({R=1,G=0,B=0,A=1});
        LocalAdd4.TextBlock_453:SetText(tostring(DeadCatName:Get(1)));
        LocalAdd3.Image_5:SetColorAndOpacity({R=1,G=0,B=0,A=1});
        LocalAdd3.TextBlock_453:SetText(tostring(DeadCatName:Get(2)));
        LocalAdd2.Image_5:SetColorAndOpacity({R=1,G=0,B=0,A=1});
        LocalAdd2.TextBlock_453:SetText(tostring(DeadCatName:Get(3)));
        self.UI_End.UI_Add_1.TextBlock_453:SetText(tostring(DeadCatName:Get(4)))
        self.UI_End.UI_Add_1.Image_5:SetColorAndOpacity({R=1,G=0,B=0,A=1});

        self.UI_End.UI_Add.TextBlock_453:SetText(tostring(AliveCatName:Get(1)));
        self.UI_End.UI_Add_0.TextBlock_453:SetText(tostring(AliveCatName:Get(2)));  
       end
       if DeadCatName:Num()==5 and AliveCatName:Num()==1 then

        self.UI_End.TextBlock_3:SetText(tostring(5));


        LocalAdd4.Image_5:SetColorAndOpacity({R=1,G=0,B=0,A=1});
        LocalAdd4.TextBlock_453:SetText(tostring(DeadCatName:Get(1)));
        LocalAdd3.Image_5:SetColorAndOpacity({R=1,G=0,B=0,A=1});
        LocalAdd3.TextBlock_453:SetText(tostring(DeadCatName:Get(2)));
        LocalAdd2.Image_5:SetColorAndOpacity({R=1,G=0,B=0,A=1});
        LocalAdd2.TextBlock_453:SetText(tostring(DeadCatName:Get(3)));
        self.UI_End.UI_Add_1.TextBlock_453:SetText(tostring(DeadCatName:Get(4)))
        self.UI_End.UI_Add_1.Image_5:SetColorAndOpacity({R=1,G=0,B=0,A=1});
        self.UI_End.UI_Add_0.TextBlock_453:SetText(tostring(DeadCatName:Get(5)));
        self.UI_End.UI_Add_0.Image_5:SetColorAndOpacity({R=1,G=0,B=0,A=1});

        self.UI_End.UI_Add.TextBlock_453:SetText(tostring(AliveCatName:Get(1)));
       end
       if DeadCatName:Num()==6 and AliveCatName:Num()==0 then

        self.UI_End.TextBlock_0:SetText("抓捕成功");
        
        self.UI_End.TextBlock_3:SetText(tostring(6));


        LocalAdd4.Image_5:SetColorAndOpacity({R=1,G=0,B=0,A=1});
        LocalAdd4.TextBlock_453:SetText(tostring(DeadCatName:Get(1)));
        LocalAdd3.Image_5:SetColorAndOpacity({R=1,G=0,B=0,A=1});
        LocalAdd3.TextBlock_453:SetText(tostring(DeadCatName:Get(2)));
        LocalAdd2.Image_5:SetColorAndOpacity({R=1,G=0,B=0,A=1});
        LocalAdd2.TextBlock_453:SetText(tostring(DeadCatName:Get(3)));
        self.UI_End.UI_Add_1.TextBlock_453:SetText(tostring(DeadCatName:Get(4)))
        self.UI_End.UI_Add_1.Image_5:SetColorAndOpacity({R=1,G=0,B=0,A=1});
        self.UI_End.UI_Add_0.TextBlock_453:SetText(tostring(DeadCatName:Get(5)));
        self.UI_End.UI_Add_0.Image_5:SetColorAndOpacity({R=1,G=0,B=0,A=1});
        self.UI_End.UI_Add.TextBlock_453:SetText(tostring(DeadCatName:Get(6)));
        self.UI_End.UI_Add.Image_5:SetColorAndOpacity({R=1,G=0,B=0,A=1});
       end
    end

    if HunterName:Num()==1 then

        self.UI_End.TextBlock_5:SetText(tostring(3));
        if DeadCatName:Num()==0 then
            self.UI_End.TextBlock_3:SetText(tostring(0));

            self.UI_End.UI_Add.TextBlock_453:SetText(tostring(AliveCatName:Get(1)));
            self.UI_End.UI_Add_0.TextBlock_453:SetText(tostring(AliveCatName:Get(2)));
            self.UI_End.UI_Add_1.TextBlock_453:SetText(tostring(AliveCatName:Get(3)));
        end
        if DeadCatName:Num()==1 then

            self.UI_End.TextBlock_3:SetText(tostring(1));

            self.UI_End.UI_Add.TextBlock_453:SetText(tostring(AliveCatName:Get(1)));
            self.UI_End.UI_Add_0.TextBlock_453:SetText(tostring(AliveCatName:Get(2)));
            self.UI_End.UI_Add_1.TextBlock_453:SetText(tostring(DeadCatName:Get(1)));
            self.UI_End.UI_Add_1.Image_5:SetColorAndOpacity({R=1,G=0,B=0,A=1});
        end
        if DeadCatName:Num()==2 then

            self.UI_End.TextBlock_3:SetText(tostring(2));


            self.UI_End.UI_Add.TextBlock_453:SetText(tostring(AliveCatName:Get(1)));
            self.UI_End.UI_Add_1.TextBlock_453:SetText(tostring(DeadCatName:Get(1)));
            self.UI_End.UI_Add_1.Image_5:SetColorAndOpacity({R=1,G=0,B=0,A=1});
            self.UI_End.UI_Add_0.TextBlock_453:SetText(tostring(DeadCatName:Get(2)));
            self.UI_End.UI_Add_0.Image_5:SetColorAndOpacity({R=1,G=0,B=0,A=1});
        end
        if DeadCatName:Num()==3 then


            self.UI_End.TextBlock_0:SetText("抓捕成功");
            self.UI_End.TextBlock_3:SetText(tostring(3));

            self.UI_End.UI_Add.TextBlock_453:SetText(tostring(DeadCatName:Get(1)));
            self.UI_End.UI_Add.Image_5:SetColorAndOpacity({R=1,G=0,B=0,A=1});
            self.UI_End.UI_Add_1.TextBlock_453:SetText(tostring(DeadCatName:Get(2)));
            self.UI_End.UI_Add_1.Image_5:SetColorAndOpacity({R=1,G=0,B=0,A=1});
            self.UI_End.UI_Add_0.TextBlock_453:SetText(tostring(DeadCatName:Get(3)));
            self.UI_End.UI_Add_0.Image_5:SetColorAndOpacity({R=1,G=0,B=0,A=1});

        end
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
    
    if RemainTime==0 then
        self.HorizontalBox_1:SetVisibility(ESlateVisibility.Collapsed);
    end

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
    if ColorType==6 then
        ugcprint("黑色");
        self.Image_ColorRemainTime:SetColorAndOpacity(TestMode.TheColor.Black);
    end
end
function UIBP_MainUI:OnReadyStateRemainTimeChange(RemainTime)

    if RemainTime~=0 then
        self.Text_RemainTime:SetText(tostring(RemainTime)); 
    end

    if RemainTime==0 then
        self.Text_RemainTime:SetText(tostring(360)); 
    end

end

function UIBP_MainUI:OnGameStateRemainTimeChange(RemainTime)

    self.Text_RemainTime:SetText(tostring(RemainTime));


    if RemainTime==360 then

        self.i=11;
    
    end

    local ColorRemainTime=RemainTime-30*(self.i);

    if ColorRemainTime==0 then

        self.i=self.i-1;

    end

    ColorRemainTime=RemainTime-30*(self.i);

    self.TextBlock_360:SetText(tostring(ColorRemainTime));

    if RemainTime==0 then

        self.Text_RemainTime:SetText(tostring(10));
        
    end
    
end

function UIBP_MainUI:OnGameEndRemainTimeChange(RemainTime)
    
   -- ugcprint("666");
    self.Text_RemainTime:SetText(tostring(RemainTime));
end

function UIBP_MainUI:HunterUI()

    --ugcprint("HunterUI");
    self.HorizontalBox_1:SetVisibility(ESlateVisibility.SelfHitTestInvisible);

end

function UIBP_MainUI:CatUI()
    
    --ugcprint("CatUI");
    self.Image_ColorRemainTime:SetVisibility(ESlateVisibility.SelfHitTestInvisible);
    self.HorizontalBox_0:SetVisibility(ESlateVisibility.SelfHitTestInvisible);
    self.SizeBox_0:SetVisibility(ESlateVisibility.SelfHitTestInvisible);
end

-- function UIBP_MainUI:OnColorChangeRemainTime(RemainTime)

-- if RemainTime == 30 or RemainTime == 0 then

--     self.TextBlock_360:SetText(tostring(30));

-- else    
--     self.TextBlock_360:SetText(tostring(RemainTime));
-- end

-- end
-- function UIBP_MainUI:Tick(MyGeometry, InDeltaTime)

-- end

-- function UIBP_MainUI:Destruct()

-- end

return UIBP_MainUI