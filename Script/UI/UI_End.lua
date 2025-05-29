---@class UI_End_C:UUserWidget
---@field Image_0 UImage
---@field Image_1 UImage
---@field Image_2 UImage
---@field NewButton_Back UNewButton
---@field TextBlock_0 UTextBlock
---@field TextBlock_3 UTextBlock
---@field TextBlock_5 UTextBlock
---@field UI_Add UI_Add_C
---@field UI_Add_0 UI_Add_C
---@field UI_Add_1 UI_Add_C
---@field UI_Add_4 UI_Add_C
---@field VerticalBox_2 UVerticalBox
---@field VerticalBox_3 UVerticalBox
--Edit Below--
local UI_End = 
{ 
    bInitDoOnce = false 

    
} 

function UI_End:Construct()
	self:LuaInit();
	
    
end
-- Construct ]==]

-- function UI_End:Tick(MyGeometry, InDeltaTime)

-- end

-- function UI_End:Destruct()

-- end

-- [Editor Generated Lua] function define Begin:
function UI_End:LuaInit()
	if self.bInitDoOnce then
		return;
	end
	self.bInitDoOnce = true;
	-- [Editor Generated Lua] BindingProperty Begin:
	-- [Editor Generated Lua] BindingProperty End;
	
	-- [Editor Generated Lua] BindingEvent Begin:
	self.NewButton_Back.OnClicked:Add(self.NewButton_Back_OnClicked, self);
	-- [Editor Generated Lua] BindingEvent End;
end

function UI_End:NewButton_Back_OnClicked()
	print("PeekabooSettlementUI:Button_Back_OnClicked");

    local PlayerController = STExtraGameplayStatics.GetFirstPlayerController(self);
    if PlayerController then
        PlayerController:ExitGame();
    else
        print("PeekabooSettlementUI:Button_Back_OnClicked PlayerController is nil");
    end

    UGCGameSystem.ReturnToLobby();
	return nil;
end

-- [Editor Generated Lua] function define End;

return UI_End