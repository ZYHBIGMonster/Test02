local Action_WaitPlayerJoin = {
    -- 可配置参数定义，参数将显示在Action配置面板
    -- 例：
    -- MyIntParameter = 0
    NotifyEvent="";
}

-- 触发器激活时，将执行Action的Execute
function Action_WaitPlayerJoin:Execute(...)

    self.bEnableActionTick=true;
    print("Action_WaitPlayerJoin_Start");

    return true
end


function Action_WaitPlayerJoin:Update(DeltaSeconds)
	print("Action_WaitPlayerJoin:Update");

	local PlayerStates = UGCGameSystem.GetAllPlayerState(false);
	print(string.format("Action_WaitPlayerJoin:Update #PlayerStates[%d]", #PlayerStates));

	if #PlayerStates > 0 then
		LuaQuickFireEvent(self.NotifyEvent, self); 
		self.bEnableActionTick = false;
	end
end


return Action_WaitPlayerJoin