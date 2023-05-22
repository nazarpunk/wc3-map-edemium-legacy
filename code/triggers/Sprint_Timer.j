
function Trig_Sprint_Timer_Actions takes nothing returns nothing
    call IssueImmediateOrderBJ(udg_Arct, "manashieldoff")
endfunction

function InitTrig_Sprint_Timer takes nothing returns nothing
    set gg_trg_Sprint_Timer = CreateTrigger()
    call TriggerRegisterTimerExpireEventBJ(gg_trg_Sprint_Timer, udg_SprintTimer)
    call TriggerAddAction(gg_trg_Sprint_Timer, function Trig_Sprint_Timer_Actions)
endfunction
