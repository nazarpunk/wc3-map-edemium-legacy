function Trig_Creep_Attacked_Actions takes nothing returns nothing
    if GetUnitTypeId(GetTriggerUnit()) == 0x6E303055 and GetRandomInt(1, 5) == 1 and GetUnitStateSwap(UNIT_STATE_MANA, GetTriggerUnit()) > 0.00 then
        call IssueImmediateOrderBJ(GetTriggerUnit(), "tranquility")
    else
        if (GetUnitTypeId(GetTriggerUnit()) == 0x6E30305A or GetUnitTypeId(GetTriggerUnit()) == 0x4E303133) and GetRandomInt(1, 3) == 1 and GetUnitStateSwap(UNIT_STATE_MANA, GetTriggerUnit()) > 0.00 then
            call IssueTargetOrderBJ(GetTriggerUnit(), "heal", GetTriggerUnit())
        endif
    endif
endfunction

function InitTrig_Creep_Attacked takes nothing returns nothing
    set gg_trg_Creep_Attacked = CreateTrigger()
    call TriggerRegisterPlayerUnitEventSimple(gg_trg_Creep_Attacked, Player(11), EVENT_PLAYER_UNIT_ATTACKED)
    call TriggerAddAction(gg_trg_Creep_Attacked, function Trig_Creep_Attacked_Actions)
endfunction