local Action_PlayMusic = {
    -- 可配置参数定义，参数将显示在Action配置面板
    -- 例：
    -- MyIntParameter = 0
}

-- 触发器激活时，将执行Action的Execute
function Action_PlayMusic:Execute(...)

    local AudioPath =UE.LoadObject('/Game/WwiseEvent/Ambient/Play_Ambient_Leaf_Music.Play_Ambient_Leaf_Music')
    UGCGameSystem.GameState.Bgm_int=UGCSoundManagerSystem.PlaySound2D(AudioPath)
    
    -- 这里可以添加其他逻辑，比如播放音效、更新UI等
    return true
end

--[[
-- 需要勾选Action的EnableTick，才会执行Update
-- 触发器激活后，将在每个tick执行Action的Update，直到self.bEnableActionTick为false
function Action_PlayMusic:Update(DeltaSeconds)

end
]]

return Action_PlayMusic