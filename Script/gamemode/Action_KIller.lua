local Action_KIller = {

    PlayerCat={};

    PlayerHunter={};

}

-- 触发器激活时，将执行Action的Execute
function Action_KIller:Execute(...)


    return true
end


-- 需要勾选Action的EnableTick，才会执行Update
-- 触发器激活后，将在每个tick执行Action的Update，直到self.bEnableActionTick为false
function Action_KIller:Update(DeltaSeconds)

   

end


return Action_KIller