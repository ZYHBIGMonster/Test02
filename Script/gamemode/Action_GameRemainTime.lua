local Action_GameRemainTime = {

    value=0;
}

-- 触发器激活时，将执行Action的Execute
function Action_GameRemainTime:Execute(...)

   local time = self.value-(30*(UGCGameSystem.GameState.iii-1));

    if time <= 0 then

        UGCGameSystem.GameState.iii = UGCGameSystem.GameState.iii - 1;
        
    end

    time = self.value-(30*(UGCGameSystem.GameState.iii-1));

    UGCGameSystem.GameState.ColorchangeTime = time;

    UGCGameSystem.GameState.GameStateRemainTime = self.value;

    return true
end

--[[
-- 需要勾选Action的EnableTick，才会执行Update
-- 触发器激活后，将在每个tick执行Action的Update，直到self.bEnableActionTick为false
function Action_GameRemainTime:Update(DeltaSeconds)

end
]]

return Action_GameRemainTime