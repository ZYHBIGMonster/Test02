local Action_HideUI = {
    -- 可配置参数定义，参数将显示在Action配置面板
    -- 例：
    -- MyIntParameter = 0
}

-- 触发器激活时，将执行Action的Execute
function Action_HideUI:Execute(...)
    self.MainControlPanel = GameBusinessManager.GetWidgetFromName(ingame, "MainControlPanelTochButton_C");
    local MainControlBaseUI = self.MainControlPanel.MainControlBaseUI;
    MainControlBaseUI.CanvasPanel_FreeCamera:SetVisibility(ESlateVisibility.Collapsed);
    return true
end

--[[
-- 需要勾选Action的EnableTick，才会执行Update
-- 触发器激活后，将在每个tick执行Action的Update，直到self.bEnableActionTick为false
function Action_HideUI:Update(DeltaSeconds)

end
]]

return Action_HideUI