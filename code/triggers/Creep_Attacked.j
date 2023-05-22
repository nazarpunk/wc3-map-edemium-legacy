
function Trig_Creep_Attacked_Func001Func001Func001C takes nothing returns boolean
    if((GetUnitTypeId(GetTriggerUnit()) == 0x6E30305A))then
        return true
    endif
    if((GetUnitTypeId(GetTriggerUnit()) == 0x4E303133))then
        return true
    endif
    return false
endfunction
function Trig_Creep_Attacked_Func001Func001C takes nothing returns boolean
    if(not Trig_Creep_Attacked_Func001Func001Func001C())then
        return false
    endif
    if(not(GetRandomInt(1, 3) == 1))then
        return false
    endif
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, GetTriggerUnit()) > 0.00))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Attacked_Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetTriggerUnit()) == 0x6E303055))then
        return false
    endif
    if(not(GetRandomInt(1, 5) == 1))then
        return false
    endif
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, GetTriggerUnit()) > 0.00))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Attacked_Actions takes nothing returns nothing
    if(Trig_Creep_Attacked_Func001C())then
        call IssueImmediateOrderBJ(GetTriggerUnit(), "tranquility")
    else
        if(Trig_Creep_Attacked_Func001Func001C())then
            call IssueTargetOrderBJ(GetTriggerUnit(), "heal", GetTriggerUnit())
        else
        endif
    endif
endfunction
function InitTrig_Creep_Attacked takes nothing returns nothing
    set gg_trg_Creep_Attacked = CreateTrigger()
    call TriggerRegisterPlayerUnitEventSimple(gg_trg_Creep_Attacked, Player(11), EVENT_PLAYER_UNIT_ATTACKED)
    call TriggerAddAction(gg_trg_Creep_Attacked, function Trig_Creep_Attacked_Actions)
endfunction