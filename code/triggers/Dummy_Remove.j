
function Trig_Dummy_Remove_Func002C takes nothing returns boolean
    if((GetUnitTypeId(GetTriggerUnit()) == 0x68303039))then
        return true
    endif
    if((GetUnitTypeId(GetTriggerUnit()) == 0x68303045))then
        return true
    endif
    if((GetUnitTypeId(GetTriggerUnit()) == 0x68303034))then
        return true
    endif
    if((GetUnitTypeId(GetTriggerUnit()) == 0x68303133))then
        return true
    endif
    if((GetUnitTypeId(GetTriggerUnit()) == 0x68303134))then
        return true
    endif
    if((GetUnitTypeId(GetTriggerUnit()) == 0x68303035))then
        return true
    endif
    return false
endfunction

function Trig_Dummy_Remove_Conditions takes nothing returns boolean
    if(not Trig_Dummy_Remove_Func002C())then
        return false
    endif
    return true
endfunction

function Trig_Dummy_Remove_Actions takes nothing returns nothing
    call RemoveUnit(GetTriggerUnit())
endfunction

function InitTrig_Dummy_Remove takes nothing returns nothing
    set gg_trg_Dummy_Remove = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Dummy_Remove, EVENT_PLAYER_UNIT_DEATH)
    call TriggerAddCondition(gg_trg_Dummy_Remove, Condition(function Trig_Dummy_Remove_Conditions))
    call TriggerAddAction(gg_trg_Dummy_Remove, function Trig_Dummy_Remove_Actions)
endfunction
