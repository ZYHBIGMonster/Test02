--[[------------------------------------------设置GameState中的Int数据------------------------------------------------------]]--
local Action_SetGameStateIntProperty = 
{
    PropertyName = "";
    Value = 0;
}


function Action_SetGameStateIntProperty:Execute(...)
    print(string.format("Action_SetGameStateIntProperty:Execute PropertyName[%s], Value[%d]", self.PropertyName, self.Value));

    if type(UGCGameSystem.GameState[self.PropertyName]) == "number" then
        UGCGameSystem.GameState[self.PropertyName] = self.Value;
    else
        print(string.format("Error: Action_SetGameStateIntProperty:Execute [%s] Not Number!", self.PropertyName));
    end

	return true;
end


return Action_SetGameStateIntProperty
