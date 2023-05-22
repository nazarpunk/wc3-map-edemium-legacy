
function Trig_ISeeDeadPeople_Actions takes nothing returns nothing
endfunction
function InitTrig_ISeeDeadPeople takes nothing returns nothing
    set gg_trg_ISeeDeadPeople = CreateTrigger()
    call DisableTrigger(gg_trg_ISeeDeadPeople)
    call TriggerRegisterTimerEventPeriodic(gg_trg_ISeeDeadPeople, 2.00)
    call TriggerAddAction(gg_trg_ISeeDeadPeople, function Trig_ISeeDeadPeople_Actions)
endfunction