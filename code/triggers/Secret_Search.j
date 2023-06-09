function Trig_Secret_Search_Actions takes nothing returns nothing
    if UnitHasBuffBJ(ArctUnit, 0x42303039) then
        call UnitAddAbilityBJ(0x4130335A, ArctUnit)
    else
        call UnitRemoveAbilityBJ(0x4130335A, ArctUnit)
    endif
endfunction

function InitTrig_Secret_Search takes nothing returns nothing
    set gg_trg_Secret_Search = CreateTrigger()
    call DisableTrigger(gg_trg_Secret_Search)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Secret_Search, 0.30)
    call TriggerAddAction(gg_trg_Secret_Search, function Trig_Secret_Search_Actions)
endfunction