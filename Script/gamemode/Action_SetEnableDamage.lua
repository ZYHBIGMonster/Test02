--[[------------------------------------------设置启动伤害设置------------------------------------------------------]]--
local Action_SetEnableDamage = 
{
	IsEnableDamage = false;
}

function Action_SetEnableDamage:Execute()
	print(string.format("Action_SetEnableDamage:Execute IsEnableDamage[%s]", tostring(self.IsEnableDamage)));

	UGCGameSystem.GameMode.bEnableDamage = self.IsEnableDamage;

	return true;
end

return Action_SetEnableDamage